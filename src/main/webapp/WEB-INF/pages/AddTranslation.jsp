<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Language" %>
<div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <div class="w3-card-4 w3-padding">

        <div class="w3-container w3-green">
            <h4>Add New Translation</h4>
        </div>

        <div class="w3-container" id="transList">

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

            <button class="w3-right w3-button w3-blue w3-margin" onclick="addTranslation()">Add Translation</button>

        </div>

    </div>
</div>

<script>
    function addTranslation() {
        var lanArr = [];
        var transArr = [];
        $("#transList input[rel=translations]").each(function () {
            lanArr.push(this.id);
            transArr.push(this.value);
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