<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="height: 200px; overflow: scroll;">
    <%
        String key = request.getParameter("key");
        EntityManager entityManager = new EntityManager();
        List<Object> entities = entityManager.searchKeys(key);
        for(int y=0; entities!=null && y < entities.size() ; y++){
            String languageTerm = (String) entities.get(y);
    %>
    <div><button class="w3-button w3-blue" style="width: 100%;"><%=StringEscapeUtils.unescapeJava(languageTerm)%></button></div>
    <%
        }

    %>
</div>

