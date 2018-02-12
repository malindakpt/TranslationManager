package entity;

import java.util.Set;

/**
 * Created by MalindaK on 2/8/2018.
 */
public class Product extends Entity {
    private int productId;
    private String productName;
    private int fileType;
    private Set<ProductTranslation> productTranslations;
}
