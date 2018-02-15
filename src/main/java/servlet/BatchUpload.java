package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Language;
import entity.TranslationEntity;
import entityManager.EntityManager;
import org.apache.commons.lang.StringEscapeUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BatchUpload extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

    }

    public static void main(String args[]){

        String ss= "PERIOD_WEEK_TO_DATE: 'Week to Date',\n\tPERIOD_ONE_WEEK: 'One Week',\n" +
                "\tPERIOD_MONTH_TO_DATE: 'Month to Date',\n" +
                "\tPERIOD_ONE_MONTH: 'One Month',\n" +
                "\tPERIOD_QUARTER_TO_DATE: 'Quarter to Date',\n" +
                "\tPERIOD_ONE_QUARTER: 'One Quarter',\n" +
                "\tPERIOD_YEAR_TO_DATE: 'Year To Date',";


        EntityManager entityManager = new EntityManager();
        Language language = (Language) entityManager.getEntity(Language.class,"languageId","1");
        String[] arr = ss.split(",\n\t");

//        for (String s: arr ) {
//            s = s.replace("'","");
//            s = s.replace(": ",":");
//            String[] keyval = s.split(": ");
//            TranslationEntity translationEntity = new TranslationEntity();
//            translationEntity.setLanguage(language);
//            translationEntity.setDefaultKey(keyval[0]);
////            translationEntity.setLanguageTerm();
//            System.out.println(s);
//        }
//
//        System.out.println( "\\u" + Integer.toHexString('A' | 0x10000).substring(1) );
//        System.out.println("---------------");
//
//        byte[] bytes = Encoding.Unicode.GetBytes("string here");
//        String foreignText = "Malinda";
//
//        String response = StringEscapeUtils.escapeJava(foreignText);
//        System.out.println(response);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
