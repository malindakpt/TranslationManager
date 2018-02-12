<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.ProductTranslation" %>
<br>
<table class="w3-table w3-striped w3-bordered">
    <tr>
       <th>
           Localization Key
       </th>
        <th>
            Default Key
        </th>
        <th>
            Product Key
        </th>
    </tr>
<%
    String productId = request.getParameter("productId");
    String languageId = request.getParameter("languageId");
    EntityManager entityManager = new EntityManager();
    List<Entity> productTranslationList = entityManager.getProductLanguage("1", 1);
    for( Entity entity: productTranslationList){
        ProductTranslation productTranslation = (ProductTranslation) entity;
%>
<tr>
    <td>
        <%=productTranslation.getLocalizationKey()%>
    </td>
    <td>
        <%=productTranslation.getTranslationEntity().getDefaultKey()%>
    </td>
    <td>
        <%=productTranslation.getTranslationEntity().getLanguageTerm()%>
    </td>
</tr>
<%
    }
%>

</table>