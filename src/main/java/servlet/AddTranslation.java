package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Language;
import entity.TranslationEntity;
import entity.User;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddTranslation extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        EntityManager entityManager = new EntityManager();
        String languageId = request.getParameter("language");
        String defKey = request.getParameter("defKey");
        String translation = request.getParameter("translation");

        Language language = (Language) entityManager.getEntity(Language.class, "languageId", languageId);
        TranslationEntity translationEntity = new TranslationEntity();
        translationEntity.setLanguage(language);
        translationEntity.setDefaultKey(defKey);
        translationEntity.setLanguageTerm(translation);

        entityManager.add(translationEntity);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
