<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.ProductTranslation" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="entity.TranslationEntity" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br>
<div id="editTranslationContainer">

</div>
<table class="w3-table w3-striped w3-bordered" id="productTransTable">
    <tr>
       <th>
           Entity Id
       </th>
        <th>
            Default Key
        </th>
        <th>
            Lnaguage
        </th>
        <th>
            Language Term
        </th>
    </tr>
<%

    EntityManager entityManager = new EntityManager();
    List<Entity> translations = entityManager.getEntities(TranslationEntity.class);

    for( Entity entity: translations){
        TranslationEntity trans = (TranslationEntity) entity;

%>
<tr>
    <td>
        <%=trans.getTranslationEntityId()%>
    </td>
    <td>
        <%=trans.getDefaultKey()%>
    </td>
    <td>
        <%=trans.getLanguage().getName()%>
    </td>
    <td>
        <button id="<%= trans.getTranslationEntityId()%>" class="w3-button w3-tiny " onclick="getEditWidget(this)">
            <i class="fa fa-edit w3-large"></i>
        </button>
        <%=StringEscapeUtils.unescapeJava(trans.getLanguageTerm())%>
    </td>
</tr>
<%

    }
%>

</table>

<script>
    function getEditWidget(ele) {
        getAndSetPage("PageEditTranslation?prodTransId="+ele.id, "editTranslationContainer");
    }
</script>
