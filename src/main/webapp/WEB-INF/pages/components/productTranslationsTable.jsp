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
        <%--<th>--%>
            <%--Default Key--%>
        <%--</th>--%>

        <th>
            Language
        </th>
        <th>
            Translation
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
    <%--<td>--%>
        <%--<%=productTranslation.getTranslationEntity().getDefaultKey()%>--%>
    <%--</td>--%>
    <td>
        <%=productTranslation.getTranslationEntity().getLanguage().getName()%>
    </td>
    <td>
        <button id="<%= productTranslation.getTranslationEntity().getTranslationEntityId()%>" class="w3-button w3-tiny " onclick="getEditWidget(this)">
            <i class="fa fa-edit w3-large"></i>
        </button>
        <span data-key="<%=productTranslation.getLocalizationKey()%>" rel="<%=productTranslation.getTranslationEntity().getLanguage().getName()%>">
          <%=StringEscapeUtils.unescapeJava(productTranslation.getTranslationEntity().getLanguageTerm())%>
        </span>


    </td>

    <td>
        <button data-key="<%= productTranslation.getLocalizationKey()%>" class="w3-button w3-tiny " onclick="removeProdTrans(this)"><i class="fa fa-minus-square" style="    font-size: 22px;"></i></button>
    </td>
</tr>
<%
        }
    }else{
%>
    <%--<jsp:include page="../components/emptyTable.jsp"/>--%>
<%
    }
%>

</table>

<script>

    function getEditWidget(ele) {
        getAndSetPage("PageEditTranslation?type=1&prodTransId="+ele.id, "editTranslationContainer");
    }


</script>