<jsp:include page="components/productSelector.jsp"/>
<br><br>
<label>Key</label>
<div class="w3-row">
    <div class="w3-col s3">
        <jsp:include page="components/keySelector.jsp"/>
    </div>
    <div class="w3-col s2">
        <button class="w3-blue w3-button w3-margin-left" onclick="addTranslationToProduct()">Add</button>
    </div>


</div>
<div class="w3-row">
  <jsp:include page="components/productTranslationsTable.jsp"/>
</div>

<script>
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
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>
