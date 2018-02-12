package entity;

import AppConfig.DBConfig;

import javax.persistence.*;
import java.util.Set;

@javax.persistence.Entity
@Table(name = "productTranslation", catalog = DBConfig.DB_NAME, uniqueConstraints = {
        @UniqueConstraint(columnNames = "productTranslationId")})
public class ProductTranslation extends Entity {
    private int productTranslationId;
    private Product product;
    private String localizationKey;
    private TranslationEntity translationEntity;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "productTranslationId", unique = true, nullable = false)
    public int getProductTranslationId() {
        return productTranslationId;
    }
    public void setProductTranslationId(int productTranslationId) {
        this.productTranslationId = productTranslationId;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="productId")
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }

    @Column(name = "localizationKey", nullable = true, length = 30)
    public String getLocalizationKey() {
        return localizationKey;
    }
    public void setLocalizationKey(String localizationKey) {
        this.localizationKey = localizationKey;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="translationEntityId")
    public TranslationEntity getTranslationEntity() {
        return translationEntity;
    }
    public void setTranslationEntity(TranslationEntity translationEntity) {
        this.translationEntity = translationEntity;
    }
}
