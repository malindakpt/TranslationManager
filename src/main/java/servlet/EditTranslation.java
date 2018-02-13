package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Language;
import entity.TranslationEntity;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class EditTranslation extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        EntityManager entityManager = new EntityManager();
        String transEntityID = request.getParameter("transEntityID");
        String translationVal = request.getParameter("translationVal");

        TranslationEntity translationEntity = (TranslationEntity) entityManager.getEntity(TranslationEntity.class, "translationEntityId", transEntityID);
        translationEntity.setLanguageTerm(translationVal);
        entityManager.update(translationEntity);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}