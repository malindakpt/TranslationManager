<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.ProductTranslation" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br>
<table class="w3-table w3-striped w3-bordered" id="productTransTable">
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
            <button class="w3-button w3-green w3-small w3-right " onclick="downloadFile('English')">Download EN</button>
            <button class="w3-button w3-green w3-small w3-right w3-margin-right"  onclick="downloadFile('Arabic')">Download AR</button>
        </th>

        <th>


        </th>
    </tr>
<%

    String showEmpty = request.getParameter("showEmpty");
    String productId = request.getParameter("productId");
    EntityManager entityManager = new EntityManager();
    List<Entity> productTranslationList = entityManager.getProductLanguageTranslations(productId);
    if(productTranslationList != null){

    for( Entity entity: productTranslationList){
        ProductTranslation productTranslation = (ProductTranslation) entity;
        if( !"".equals(productTranslation.getTranslationEntity().getLanguageTerm()) && "true".equals(showEmpty)){
            continue;
        }

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
        <span data-key="<%=productTranslation.getLocalizationKey()%>" rel="<%=productTranslation.getTranslationEntity().getLanguage().getName()%>">
          <%=StringEscapeUtils.unescapeJava(productTranslation.getTranslationEntity().getLanguageTerm())%>
        </span>


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
    function downloadFile(lan) {
        var str = "";
        $("#productTransTable span[rel=" + lan + "]").each(function () {
           str = str +(this.dataset.key+" : '"+this.innerText+"',\n");
        });
        var filename = "asd";
        var blob = new Blob([str], {type: "text/plain;charset=utf-8"});
        saveAs(blob, lan+".txt");
    }

</script>