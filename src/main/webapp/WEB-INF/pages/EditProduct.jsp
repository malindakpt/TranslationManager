<div class="w3-row">
    <div class="w3-col s3">
        <jsp:include page="components/productSelector.jsp"/>
    </div>
    <div class="w3-col s3 w3-margin-left">
        <jsp:include page="components/languageSelector.jsp"/>
    </div>
</div>
<br><br>
<label>Key</label>
<div class="w3-row">
    <div class="w3-col s3 ">
        <jsp:include page="components/keySelector.jsp"/>
    </div>

    <div class="w3-col s3 w3-margin-left">
        <button class="w3-blue w3-button w3-margin-left" onclick="addTranslationToProduct()">Add</button>
    </div>


</div>
<div class="w3-row">
  <div id="translationTable">
      <%--<jsp:include page="components/productTranslationsTable.jsp"/>--%>
  </div>

</div>

<script>
    function onProductChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&languageId="+$('#languageSelector').val(), "translationTable");
    }
    function onLanguageChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&languageId="+$('#languageSelector').val(), "translationTable");
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
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&languageId="+$('#languageSelector').val(), "translationTable");
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
