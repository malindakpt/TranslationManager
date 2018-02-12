<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Language" %>
<select onchange="languageChanged()">
    <option>-Select an language-</option>
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