package entity;

import AppConfig.DBConfig;

import javax.persistence.*;

/**
 * Created by MalindaK on 2/8/2018.
 */
@javax.persistence.Entity
@Table(name = "translationEntity", catalog = DBConfig.DB_NAME, uniqueConstraints = {
        @UniqueConstraint(columnNames = "translationEntityId")})
public class TranslationEntity extends Entity {
    private int translationEntityId;
    private Language language;
    private String defaultKey;
    private String languageTerm;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "translationEntityId", unique = true, nullable = false)
    public int getTranslationEntityId() {
        return translationEntityId;
    }
    public void setTranslationEntityId(int translationEntityId) {
        this.translationEntityId = translationEntityId;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="languageId")
    public Language getLanguage() {
        return language;
    }
    public void setLanguage(Language language) {
        this.language = language;
    }

    @Column(name = "defaultKey", nullable = true, length = 300)
    public String getDefaultKey() {
        return defaultKey;
    }
    public void setDefaultKey(String defaultKey) {
        this.defaultKey = defaultKey;
    }

    @Column(name = "languageTerm", nullable = true, length = 300)
    public String getLanguageTerm() {
        return languageTerm;
    }
    public void setLanguageTerm(String languageTerm) {
        this.languageTerm = languageTerm;
    }
}
