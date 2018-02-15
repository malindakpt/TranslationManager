package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
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
import java.util.Calendar;
import java.util.List;

public class AddTranslation extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();


        // Check authorization
        Helper helper = new Helper();
        User user = helper.getUser(request);
        if(user == null || user!=null && user.getRole() < Constants.ROLE_ADMIN_USER){
            out.write("Operation not permitted");
            return;
        }


        EntityManager entityManager = new EntityManager();
        String[] lanArr = request.getParameterValues("lanArr[]");
        String defKey = request.getParameter("defKey");
        String productId = request.getParameter("productId");
        String[] transArr = request.getParameterValues("transArr[]");

        List<Entity> existList = entityManager.getEntity1(TranslationEntity.class, "defaultKey", defKey);
        if(existList!= null && existList.size()>0 ){
            out.write("Default key is already exist !");
        } else {
            int n = 0;
            for (String lan : lanArr) {
                Language language = (Language) entityManager.getEntity(Language.class, "languageId", lan);
                TranslationEntity translationEntity = new TranslationEntity();
                translationEntity.setLanguage(language);
                translationEntity.setDefaultKey(defKey);
                translationEntity.setLanguageTerm(transArr[n++]);
                entityManager.add(translationEntity);
                entityManager.add(new LogRecord("Translation added : "+ translationEntity.getDefaultKey(), user, Calendar.getInstance().getTime()));

                Product product = (Product) entityManager.getEntity(Product.class, "productId", productId);
                ProductTranslation productTranslation = new ProductTranslation();
                productTranslation.setProduct(product);
                productTranslation.setLocalizationKey(defKey);
                productTranslation.setTranslationEntity(translationEntity);
                entityManager.add(productTranslation);
                entityManager.add(new LogRecord("ProductTranslation added to "+product.getProductName()+" :  ("+translationEntity.getDefaultKey()+")", user, Calendar.getInstance().getTime()));
            }


        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
