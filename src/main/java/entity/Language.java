package entity;

import AppConfig.DBConfig;

import javax.persistence.*;

/**
 * Created by MalindaK on 2/12/2018.
 */
@javax.persistence.Entity
@Table(name = "language", catalog = DBConfig.DB_NAME, uniqueConstraints = {
        @UniqueConstraint(columnNames = "languageId")})
public class Language extends Entity {
    private int languageId;
    private String name;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "languageId", unique = true, nullable = false)
    public int getLanguageId() {
        return languageId;
    }
    public void setLanguageId(int languageId) {
        this.languageId = languageId;
    }

    @Column(name = "name", nullable = true, length = 30)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
