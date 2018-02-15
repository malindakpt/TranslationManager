<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="height: 200px; overflow: scroll;">
    <%
        String key = request.getParameter("key");
        boolean lan = Boolean.parseBoolean(request.getParameter("lan"));

        EntityManager entityManager = new EntityManager();
        List<Object[]> entities = entityManager.searchKeys(key, lan);
        for(int y=0; entities!=null && y < entities.size() ; y++){
            String languageTerm = (String) entities.get(y)[0];
            String languageKey = (String) entities.get(y)[1];
    %>
    <div><button data-txt="<%=StringEscapeUtils.unescapeJava(languageTerm)%>" class="w3-button" style="width: 100%;text-align: left;" onclick="addTranslationToProduct(this)"><%=languageKey+": "+StringEscapeUtils.unescapeJava(languageTerm)%></button></div>
    <%
        }

    %>
</div>

