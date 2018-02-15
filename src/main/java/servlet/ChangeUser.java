package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Entity;
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
import java.util.Calendar;
import java.util.List;

public class ChangeUser extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        // Check authorization
        Helper helper = new Helper();
        User user = helper.getUser(request);
        if(user == null || user!=null && user.getRole() != Constants.ROLE_OWNER){
            out.write("Operation not permitted");
            return;
        }

        EntityManager entityManager = new EntityManager();
        String userId = request.getParameter("userId");
        String action = request.getParameter("action");

        if("approve".equals(action)){
            User user1 = (User) entityManager.getEntity(User.class, "userId", userId);
            user1.setApproved(1);
            entityManager.update(user1);
        }else {
            entityManager.deleteById(User.class, "userId", Integer.parseInt(userId));
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
