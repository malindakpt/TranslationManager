package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Entity;
import entity.Language;
import entity.LogRecord;
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
import java.util.List;

public class AddUser extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        // Check authorization
        Helper helper = new Helper();
        User user = helper.getUser(request);
//        if(user == null || user!=null && user.getRole() < Constants.ROLE_ADMIN_USER){
//            out.write("Operation not permitted");
//            return;
//        }

        EntityManager entityManager = new EntityManager();
        String name = request.getParameter("name");
        String userName = request.getParameter("userName");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String isAdmin = request.getParameter("isAdmin");
        int role = "true".equals(isAdmin)? Constants.ROLE_ADMIN_USER : Constants.ROLE_STD_USER;

        if(password1.equals(password2)) {

            List<Entity> uList = entityManager.getEntity1(User.class, "userName", userName);
            if(uList != null && uList.size()>0){
                out.write("Username already exist");
            } else {
                User newUser = new User();
                newUser.setName(name);
                newUser.setUserName(userName);
                newUser.setPassword(password1);
                newUser.setRole(role);
                newUser.setApproved(0);
                entityManager.add(newUser);
                entityManager.add(new LogRecord("New user: " +newUser.getName()+"("+newUser.getUserName()+") is added",
                        user, Calendar.getInstance().getTime()));
            }
        }else{
            out.write("Confirm password doesn't match");
        }

    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
