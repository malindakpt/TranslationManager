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
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="width:30%;">
        <header class="w3-container w3-blue">
            <span onclick="document.getElementById('id01').style.display='none'"
         class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
            <h3>Edit Translation</h3>
        </header>

        <div class="w3-bar w3-border-bottom w3-padding" >

            <label>Default Key</label>
            <br>
            <label class="w3-margin-left"><b><%=productTranslation.getLocalizationKey()%></b></label>
            <br>
            <br>
            <%--<input id="defKey" class="w3-input" type="text" disabled value="">--%>

            <label><%=productTranslation.getTranslationEntity().getLanguage().getName()%></label>
            <input rel="translations" id="transVal" class="w3-input" type="text" value="<%=productTranslation.getTranslationEntity().getLanguageTerm()%>">

        </div>

        <div class="w3-container w3-light-grey w3-padding">
            <button class="w3-button w3-right w3-blue " onclick="editTranslation()">Save</button>
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
                $('#id01').hide();
                if (result === "") {
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
                } else {
                    alert(result);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
    $('#id01').show();
</script>