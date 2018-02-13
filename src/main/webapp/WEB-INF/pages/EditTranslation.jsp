<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Language" %>
<%@ page import="entity.ProductTranslation" %>

<%
    EntityManager entityManager = new EntityManager();
    String prodTransId = request.getParameter("prodTransId");
    ProductTranslation productTranslation = (ProductTranslation) entityManager.getEntity(ProductTranslation.class, "productTranslationId", prodTransId);

%>
<div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <div class="w3-card-4 w3-padding">

        <div class="w3-container w3-green">
            <h4>Edit Translation</h4>
        </div>

        <div class="w3-container" id="transList">

            <label>Default Key</label>
            <input id="defKey" class="w3-input" type="text" disabled value="<%=productTranslation.getLocalizationKey()%>">


            <label><%=productTranslation.getTranslationEntity().getLanguage().getName()%></label>
            <input rel="translations" id="transVal" class="w3-input" type="text" value="<%=productTranslation.getTranslationEntity().getLanguageTerm()%>">

            <button class="w3-right w3-button w3-blue w3-margin" onclick="editTranslation()">Change Translation</button>

        </div>

    </div>
</div>

<script>
    function editTranslation() {

        $.post('EditTranslation', {
                transEntityID: <%=productTranslation.getTranslationEntity().getTranslationEntityId()%>,
                translationVal: $('#transVal').val(),
                sess: sess
            },
            function (result) {
                console.log("Edited Translation");
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>