<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Language" %>
<div id="addTrnsModal" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="width:30%;">
        <header class="w3-container w3-blue">
            <span onclick="document.getElementById('addTrnsModal').style.display='none'"
                  class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
            <h3>Add Translation</h3>
        </header>

        <div class="w3-bar w3-border-bottom w3-padding" >

            <label>Default Key</label>
            <input id="defKey" class="w3-input" type="text" >

            <%
                EntityManager entityManager = new EntityManager();
                List<Entity> entities = entityManager.getEntities(Language.class);
                for(Entity entity : entities){
                    Language language = (Language) entity;


            %>
            <label><%=language.getName()%></label>
            <input rel="translations" id="<%=language.getLanguageId()%>" class="w3-input" type="text">

            <%
                }
            %>

            <%--<button class="w3-right w3-button w3-blue w3-margin" onclick="addTranslation()">Add Translation</button>--%>
        </div>

        <div class="w3-container w3-light-grey w3-padding">
            <button class="w3-button w3-right w3-blue " onclick="addTranslation()">Add</button>
        </div>
    </div>
</div>

<script>
    function addTranslation() {
        var lanArr = [];
        var transArr = [];
        $("#addTranslationWidget input[rel=translations]").each(function () {
            lanArr.push(this.id);
            transArr.push(toUnicode(this.value));
        });
        console.log(lanArr);
        console.log(transArr);
        $.post('AddTranslation', {
                lanArr: lanArr,
                defKey: $('#defKey').val(),
                transArr: transArr,
                sess: sess
            },
            function (result) {
                console.log("Add Translation");
                if (result === "") {
                    $('#addTrnsModal').hide();
                    getAndSetPage("PageKeySelector", "translationTable");
                } else {
                    alert(result);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>