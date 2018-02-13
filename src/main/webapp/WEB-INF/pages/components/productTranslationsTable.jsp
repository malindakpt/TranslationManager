<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.ProductTranslation" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            Lnaguage
        </th>
        <th>
            Translation
        </th>

        <th>

        </th>
    </tr>
<%
    String unicode = "\u0048\u0065\u006C\u006C\u006F";
    String Title = StringEscapeUtils.unescapeJava(unicode);
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
        <%=productTranslation.getTranslationEntity().getLanguage().getName()%>
    </td>
    <td>
        <button id="<%= productTranslation.getProductTranslationId()%>" class="w3-button w3-tiny " onclick="getEditWidget(this)">
            <i class="fa fa-edit w3-large"></i>
        </button>
         <%=StringEscapeUtils.unescapeJava(productTranslation.getTranslationEntity().getLanguageTerm())%>
        <%--<%= productTranslation.getTranslationEntity().getLanguageTerm()%>--%>

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