package entity;

import AppConfig.DBConfig;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 2/8/2018.
 */
@javax.persistence.Entity
@Table(name = "product", catalog = DBConfig.DB_NAME, uniqueConstraints = {
        @UniqueConstraint(columnNames = "productId")})
public class Product extends Entity {
    private int productId;
    private String productName;
    private int fileType;
    private Set<ProductTranslation> productTranslations;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "productId", unique = true, nullable = false)
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Column(name = "productName", nullable = true, length = 30)
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Column(name = "fileType", nullable = true, length = 30)
    public int getFileType() {
        return fileType;
    }
    public void setFileType(int fileType) {
        this.fileType = fileType;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "product")
    public Set<ProductTranslation> getProductTranslations() {
        return productTranslations;
    }
    public void setProductTranslations(Set<ProductTranslation> productTranslations) {
        this.productTranslations = productTranslations;
    }
}
