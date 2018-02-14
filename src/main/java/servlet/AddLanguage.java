package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Language;
import entity.LogRecord;
import entity.User;
import entityManager.EntityManager;
import util.Constants;
import util.Helper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddLanguage extends HttpServlet {

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
        String name = request.getParameter("name");
        Language language = new Language();
        language.setName(name);
        entityManager.add(language);

        entityManager.add(new LogRecord("Language Added:"+ language.getName(), user));

    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
