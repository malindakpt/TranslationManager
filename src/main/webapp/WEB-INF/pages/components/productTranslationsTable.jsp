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
        <th>

        </th>
        <th>

        </th>
    </tr>
<%
    String productId = request.getParameter("productId");
//    int languageId = Integer.parseInt(request.getParameter("languageId"));
    EntityManager entityManager = new EntityManager();
    List<Entity> productTranslationList = entityManager.getProductLanguageTranslations(productId);
    if(productTranslationList != null){

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
        <%=productTranslation.getTranslationEntity().getLanguage().getName()%> : <%=productTranslation.getTranslationEntity().getLanguageTerm()%>
    </td>
    <td>
        <button id="<%= productTranslation.getProductTranslationId()%>" class="w3-button w3-tiny " onclick="editProdTrans(this)">Edit</button>
    </td>
    <td>
        <button id="<%= productTranslation.getProductTranslationId()%>" class="w3-button w3-tiny " onclick="removeProdTrans(this)">Remove</button>
    </td>
</tr>
<%
        }
    }
%>

</table>

<script>

</script>