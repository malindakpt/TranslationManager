<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.User" %>

<%
    EntityManager entityManager = new EntityManager();
    List<Entity> entities = entityManager.getEntity1(User.class, "isApproved", "0");

    for(Entity entity : entities){
        User user = (User) entity;
%>
        <div class="w3-row">
            <span><%=user.getName()+"  " + user.getUserName() + " - "  %><button id="<%=user.getUserId()%>" class="w3-button " onclick="approve(this)">Approve</button><button id="<%=user.getUserId()%>" class="w3-button " onclick="remove(this)">Delete</button></span>
        </div>
<%
    }
%>

<button  class="w3-button w3-blue w3-right" onclick="upload()">Upload</button>
<textarea id="textFileEN" rows="20" cols="50" placeholder="English Text"></textarea>
<textarea id="textFileAR" rows="20" cols="50" placeholder="Arabic Text"></textarea>



<script>

    function approve(ev) {
        $.post('ChangeUser', {
                userId: ev.id,
                action: 'approve',
                sess: sess
            },
            function (result) {
                if (result === "") {
                    console.log("ok "+ok++);
                } else {
                    console.log("Error:-"+ result);
                }

            }).fail(function () {
                console.log("Error", "Unexpected error occured", "error");
            }
        );
    }

    function remove(ev) {
        $.post('ChangeUser', {
                userId: ev.id,
                action: 'remove',
                sess: sess
            },
            function (result) {
                if (result === "") {
                    console.log("ok "+ok++);
                } else {
                    console.log("Error:-"+ result);
                }

            }).fail(function () {
                console.log("Error", "Unexpected error occured", "error");
            }
        );
    }
















    sent = 0 ;
    ok = 0;
    function upload() {
        console.log("Stated...");
        var strEN = $('#textFileEN').val();
        var strAR = $('#textFileAR').val();

        var objectEN = JSON.parse(strEN);
        var objectAR = JSON.parse(strAR);

        for (var property in objectEN) {
            if (objectEN.hasOwnProperty(property)) {

                var ARTerm = toUnicode(objectAR[property]);
                var ENTerm = toUnicode(objectEN[property]);

                console.log(property + "Sent : "+sent++  +"     "+objectEN[property]+"--"+objectAR[property]);

                $.post('AddTranslation', {
                        productId: 1,
                        lanArr: ["1", "2"],
                        defKey: property,
                        transArr: [ENTerm, ARTerm],
                        sess: sess
                    },
                    function (result) {
                        if (result === "") {
                            console.log("ok "+ok++);
                        } else {
                            console.log("Error:-"+ result);
                        }

                    }).fail(function () {
                    console.log("Error", "Unexpected error occured", "error");

                    }
                );
            }
        }
    }
</script>

