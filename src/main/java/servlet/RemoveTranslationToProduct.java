package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Product;
import entity.ProductTranslation;
import entity.TranslationEntity;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RemoveTranslationToProduct extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager entityManager = new EntityManager();
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
//        ProductTranslation productTranslation = (ProductTranslation) entityManager.getEntity(ProductTranslation.class, "productTranslationId", id);
        entityManager.delete(ProductTranslation.class, "productTranslationId", id);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
