
<div id="editTranslationContainer">

</div>

<div id="addTranslationWidget">
    <jsp:include page="AddTranslation.jsp"/>
</div>

<div class="w3-row">
    <div class="w3-col s3">
        <jsp:include page="components/productSelector.jsp"/>
    </div>

    <div class="w3-col s8  w3-right">
        <div class="w3-row">
            <div class="w3-col s1 w3-right">
                <button class="w3-button w3-circle w3-red " onclick="showAddTranslation()" style="margin-left: 50px"><b>+</b></button>
            </div>
            <div class="w3-col s3 w3-right">
            </div>
            <div class="w3-col s1 w3-right  w3-margin-right">
                <button class="w3-blue w3-button w3-right" onclick="addTranslationToProduct()">Add</button>
            </div>
            <div class="w3-col s4 w3-right w3-margin-right" id="PageKeySelector">
                <jsp:include page="components/keySelector.jsp"/>
            </div>

        </div>
    </div>

</div>
<br><br>

<div class="w3-row">
  <div id="translationTable">
      <%--<jsp:include page="components/productTranslationsTable.jsp"/>--%>
  </div>

</div>

<script>
    function showAddTranslation() {
        $('#addTrnsModal').show();
    }
    function onProductChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
    }
    function onLanguageChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
    }
    function getEditWidget(ele) {
        getAndSetPage("PageEditTranslation?prodTransId="+ele.id, "editTranslationContainer");
    }

    function editProdTrans(ele) {

        $.post('PageEditTranslation', {
                id: ele.id,
                sess: sess
            },
            function (result) {
                console.log("Response received");
                if (result === "") {
                    alert("Success");
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
                } else {
                    alert(result);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
    function removeProdTrans(ele) {
        $.post('RemoveTranslationToProduct', {
                id: ele.id,
                sess: sess
            },
            function (result) {
                console.log("Response received");
                if (result === "") {
                    alert("Success");
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
                } else {
                    alert(result);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
    function addTranslationToProduct() {
        $.post('AddTranslationToProduct', {
                enText: toUnicode($('#searchKeyInput').val()),
                languageArr: [1, 2],
                productId: $('#productSelector').val(),
                sess: sess
            },
            function (result) {
                if (result === "") {
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&languageId="+$('#languageSelector').val(), "translationTable");
                } else {
                    alert(result);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>
