package entity;

import configuration.DBConfig;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by MalindaK on 2/14/2018.
 */
@javax.persistence.Entity
@Table(name = "LogRecord", catalog = DBConfig.DB_NAME, uniqueConstraints = {
        @UniqueConstraint(columnNames = "logId")})
public class LogRecord extends Entity {
    private int logId;
    private String action;
    private User user;
    private Date date;

    public LogRecord(){
    }
    public LogRecord(String action, User user, Date date){
        this.action = action;
        this.user = user;
        this.date = date;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "logId", unique = true, nullable = false)
    public int getLogId() {
        return logId;
    }
    public void setLogId(int logId) {
        this.logId = logId;
    }

    @Column(name = "action", nullable = true, length = 300)
    public String getAction() {
        return action;
    }
    public void setAction(String action) {
        this.action = action;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="userId")
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "date", nullable = true, length = 300)
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
}
