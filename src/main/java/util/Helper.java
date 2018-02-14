package util;

import entity.User;
import entityManager.EntityManager;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by MalindaK on 2/14/2018.
 */
public class Helper {
    public User getUser(HttpServletRequest request ){
        String session = request.getParameter("sess");
        User user = (User) new EntityManager().getFirstEntity1(User.class,"sessionId",session);
        return user;
    }
}
