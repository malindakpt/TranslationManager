<%@ page import="entityManager.EntityManager" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="entity.TranslationEntity" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    EntityManager entityManager = new EntityManager();
    String prodTransId = request.getParameter("prodTransId");
    int type = Integer.parseInt(request.getParameter("type"));
    TranslationEntity translationEntity = (TranslationEntity) entityManager.getEntity(TranslationEntity.class, "translationEntityId", prodTransId);

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
            <label class="w3-margin-left"><b><%=translationEntity.getDefaultKey()%></b></label>
            <br>
            <br>
            <label><%=translationEntity.getLanguage().getName()%></label>
            <input rel="translations" id="transVal" class="w3-input" type="text" value="<%=StringEscapeUtils.unescapeJava(translationEntity.getLanguageTerm())%>">

        </div>

        <div class="w3-container w3-light-grey w3-padding">
            <button class="w3-button w3-right w3-blue " onclick="editTranslation(<%=type%>)">Save</button>
        </div>
    </div>
</div>
<script>
    function editTranslation(type) {

        $.post('EditTranslation', {
                transEntityID: <%=translationEntity.getTranslationEntityId()%>,
                translationVal: toUnicode($('#transVal').val()),
                sess: sess
            },
            function (result) {
                console.log("Edited Translation");
                $('#id01').hide();
                if (result === "") {
                    if(type == 1) {
                        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
                    }else{
                        getAndSetPage('PageAllTranslations');
                    }
                } else {
                    swal("Error", result, "error");
                }

            }).fail(function () {
            swal("Error", "Unexpected error occured", "error");
            }
        );
    }
    $('#id01').show();
</script>