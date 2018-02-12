package entity;

import java.util.Set;

/**
 * Created by MalindaK on 2/8/2018.
 */
public class ProductTranslation extends Entity {
    private int productTranslationId;

    private Product product;
    private String localizationKey;
    private TranslationEntity translationEntity;
}
