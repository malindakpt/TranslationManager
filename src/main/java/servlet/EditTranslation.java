package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Language;
import entity.LogRecord;
import entity.TranslationEntity;
import entity.User;
import entityManager.EntityManager;
import org.apache.commons.lang.StringEscapeUtils;
import util.Constants;
import util.Helper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public class EditTranslation extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        // Check authorization
        Helper helper = new Helper();
        User user = helper.getUser(request);
        if(user == null){
            out.write("Operation not permitted");
            return;
        }

        EntityManager entityManager = new EntityManager();
        String transEntityID = request.getParameter("transEntityID");
        String translationVal = request.getParameter("translationVal");

        TranslationEntity translationEntity = (TranslationEntity) entityManager.getEntity(TranslationEntity.class, "translationEntityId", transEntityID);
        String oldVal = StringEscapeUtils.unescapeJava(translationEntity.getLanguageTerm());
        translationEntity.setLanguageTerm(translationVal);
        entityManager.update(translationEntity);
        entityManager.add(new LogRecord("Key: "+translationEntity.getDefaultKey()+" : "+
                oldVal+" is edited to: "+ StringEscapeUtils.unescapeJava(translationEntity.getLanguageTerm()),
                user, Calendar.getInstance().getTime()));
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
