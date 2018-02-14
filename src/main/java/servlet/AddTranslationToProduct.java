package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.*;
import entityManager.EntityManager;
import util.Constants;
import util.Helper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class AddTranslationToProduct extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {




        EntityManager entityManager = new EntityManager();
        PrintWriter out = response.getWriter();

        // Check authorization
        Helper helper = new Helper();
        User user = helper.getUser(request);
        if(user == null || user!=null && user.getRole() < Constants.ROLE_ADMIN_USER){
            out.write("Operation not permitted");
            return;
        }

        String enText = request.getParameter("enText");
        String[] languageArr = request.getParameterValues("languageArr[]");
        String productId = request.getParameter("productId");

        if("".equals(enText) || enText==null){
            out.write("English term cannot be empty");
            return;
        }


        Product product = (Product) entityManager.getEntity(Product.class, "productId", productId);
        if(product != null) {
            TranslationEntity translation = (TranslationEntity) entityManager.getFirstEntity2(TranslationEntity.class, "languageTerm", enText, "languageId", "1");
            if (translation != null) {

                ProductTranslation productTranslation = (ProductTranslation) entityManager.getFirstEntity2(ProductTranslation.class, "localizationKey", translation.getDefaultKey(),"productId", productId);
                    if(productTranslation == null) {

                    String defKey = translation.getDefaultKey();
                    for (String lanId : languageArr) {
                        TranslationEntity translationEntity = (TranslationEntity) entityManager.getFirstEntity2(TranslationEntity.class, "defaultKey", defKey, "languageId", lanId);
                        productTranslation = new ProductTranslation();
                        productTranslation.setProduct(product);
                        productTranslation.setLocalizationKey(defKey);
                        productTranslation.setTranslationEntity(translationEntity);
                        entityManager.add(productTranslation);
                    }
                } else {
                    out.write("Translation already added");
                }
            } else {
                out.write("No translation exist");
            }
        } else {
            out.write("Select a product to add translation");
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
