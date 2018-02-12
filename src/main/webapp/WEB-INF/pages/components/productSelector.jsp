<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Language" %>
<%@ page import="entity.Product" %>
<select id="languageSelector"  class="w3-select" class="w3-select" onchange="languageChanged()">
    <option>-Select an Product-</option>
    <%
        EntityManager entityManager = new EntityManager();
        List<Entity> languages = entityManager.getEntities(Product.class);
        for(Entity entity : languages){
            Product product = (Product)entity;
    %>
            <option value="<%=product.getProductId()%>"><%=product.getProductName()%></option>
    <%
        }
    %>
</select>