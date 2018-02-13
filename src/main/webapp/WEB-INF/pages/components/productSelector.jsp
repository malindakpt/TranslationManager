<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Language" %>
<%@ page import="entity.Product" %>
<select id="productSelector"  class="w3-select" onchange="onProductChange()">
    <option value="-1"> - Select Product -</option>
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