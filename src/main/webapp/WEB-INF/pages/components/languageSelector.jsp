<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Language" %>
<select id="languageSelector"  class="w3-select" onchange="onLanguageChange()">
    <option value="-1">Select Language</option>
    <%
        EntityManager entityManager = new EntityManager();
        List<Entity> languages = entityManager.getEntities(Language.class);
        for(Entity entity : languages){
            Language language = (Language)entity;
    %>
            <option value="<%=language.getLanguageId()%>"><%=language.getName()%></option>
    <%
        }
    %>
</select>