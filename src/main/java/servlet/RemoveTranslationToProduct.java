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
import java.util.Calendar;

public class RemoveTranslationToProduct extends HttpServlet {

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

        String key = request.getParameter("key");
        String productId = request.getParameter("productId");
        Product product = (Product) entityManager.getEntity(Product.class,"productId",productId);
        entityManager.delete2(ProductTranslation.class, "localizationKey", key, "productId", productId);
        entityManager.add(new LogRecord("Removed Trans " + key + " of "+product.getProductName() , user, Calendar.getInstance().getTime()));
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
