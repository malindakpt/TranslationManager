<div class="w3-row">
    <div class="w3-col s3">
        <jsp:include page="components/productSelector.jsp"/>
    </div>

    <div class="w3-col s8  w3-right">
        <div class="w3-row">
            <div class="w3-col s1 w3-right">
                <button class="w3-blue w3-button w3-right" onclick="addTranslationToProduct()">Add</button>
            </div>
            <div class="w3-col s4 w3-right w3-margin-right">
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
    function onProductChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
    }
    function onLanguageChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
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
                enText: $('#searchKeyInput').val(),
                languageArr: [1, 2],
                productId: $('#productSelector').val(),
                sess: sess
            },
            function (result) {
                console.log("Add language");
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&languageId="+$('#languageSelector').val(), "translationTable");
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>
