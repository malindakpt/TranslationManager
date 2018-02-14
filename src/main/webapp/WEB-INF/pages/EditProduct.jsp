
<div id="editTranslationContainer">

</div>

<div id="addTranslationWidget">
    <%--<jsp:include page="AddTranslation.jsp"/>--%>
</div>
<div class="w3-panel w3-leftbar w3-rightbar  w3-border-indigo w3-border w3-padding-16" >
    <div class="w3-col s3">
        <button class="w3-indigo w3-button" onclick="showAddTranslation()" >Add New Translation</button>
    </div>

    <div class="w3-col s2 w3-right ">
        <button class="w3-indigo w3-button w3-right" onclick="addTranslationToProduct()">Add To Product</button>
    </div>
    <div class="w3-col s3 w3-right " id="PageKeySelector">
        <jsp:include page="components/keySelector.jsp"/>
    </div>
</div>

<br>
<div class="w3-panel w3-leftbar w3-rightbar  w3-border-blue w3-border w3-padding-16">


    <div class="w3-col s2">
        <jsp:include page="components/productSelector.jsp"/>
    </div>
    <div class="w3-col s2">
        <select class="w3-select w3-margin-left" onchange="onProductChange()" id="fileterSelector" >
            <option value="false" selected>All Entries</option>
            <option value="true">Empty Entries</option>
        </select>
    </div>
    <div class="w3-col s2  w3-right">
        <button class="w3-button w3-blue  w3-right " onclick="downloadFile('English')">Download</button>
    </div>
    <div class="w3-col s3  w3-right w3-margin-right">
        <jsp:include page="components/languageSelector.jsp"/>
    </div>




<br><br>

<div class="w3-row">
  <div id="translationTable">
      <jsp:include page="components/emptyTable.jsp"/>
  </div>

</div>

</div>

<script>
    function showAddTranslation() {
        var productId = $('#productSelector').val();
        if(productId>-1) {
            getAndSetPage("PageAddTranslation?productId=" + productId, "addTranslationWidget");

        } else{
            alert("Please select a product");
        }
    }
    function onProductChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&showEmpty="+$('#fileterSelector').val(), "translationTable");
    }
    function onLanguageChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
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
                key: ele.dataset.key,
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
        if($('#productSelector').val() < 0){
            alert("Select a product");
        } else {
            $.post('AddTranslationToProduct', {
                    enText: toUnicode($('#searchKeyInput').val()),
                    languageArr: [1, 2],
                    productId: $('#productSelector').val(),
                    sess: sess
                },
                function (result) {
                    if (result === "") {
                        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val() + "&languageId=" + $('#languageSelector').val(), "translationTable");
                    } else {
                        alert(result);
                    }

                }).fail(function () {
                    alert("Error");
                }
            );
        }
    }
</script>
