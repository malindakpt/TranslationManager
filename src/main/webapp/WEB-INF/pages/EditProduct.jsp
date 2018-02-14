
<div id="editTranslationContainer">

</div>

<div id="addTranslationWidget">
    <%--<jsp:include page="AddTranslation.jsp"/>--%>
</div>
<div class="w3-row w3-bottombar w3-border-indigo " >
    <div class="w3-col s3  w3-margin-top">
        <button class="w3-indigo w3-button" onclick="showAddTranslation()" ><i class="fa fa-plus-circle"></i> Add New Translation</button>
    </div>

    <div class="w3-col s5 w3-right ">
        <div class="w3-row w3-panel w3-light-grey w3-leftbar w3-border-grey w3-padding">
            <div class="w3-col s5 w3-right ">
                <button class="w3-indigo w3-button w3-right" onclick="addTranslationToProduct()"><i class="fa fa-outdent"></i>  Add To Product</button>
            </div>
            <div class="w3-col s6 w3-right w3-margin-left " id="PageKeySelector">
                <jsp:include page="components/keySelector.jsp"/>
            </div>
        </div>

    </div>

</div>
<div class="w3-row">


    <div class="w3-col s7 w3-margin-top">
        <div class="w3-row">
            <div class="w3-col s4">
                <jsp:include page="components/productSelector.jsp"/>
            </div>
            <div class="w3-col s3">
                <select class="w3-select w3-margin-left" onchange="onProductChange()" id="fileterSelector" >
                    <option value="false" selected>All Entries</option>
                    <option value="true">Empty Entries</option>
                </select>
            </div>
        </div>

    </div>
    <div class="w3-col w3-right s5 w3-panel w3-light-grey w3-leftbar w3-border-grey w3-padding">
        <div class="w3-row">
            <div class="w3-col s4  w3-right ">
                <button class="w3-button w3-blue  w3-right " onclick="downloadFile()"><i class="fa fa-download"></i>  Download</button>
            </div>
            <div class="w3-col s8  w3-right ">
                <jsp:include page="components/languageSelector.jsp"/>
            </div>
        </div>
    </div>




<br><br>

<div class="w3-row">
  <div id="translationTable">
      <jsp:include page="components/emptyTable.jsp"/>
  </div>

</div>

</div>

<script>
    function downloadFile() {
        if($('#languageSelector').val() != "-1") {
            var lan = $('#languageSelector  option:selected').text();
            var str = "export const EN = {\n";
            $("#productTransTable span[rel=" + lan + "]").each(function () {
                str = str + ("\t"+this.dataset.key + " : '" + this.innerText + "',\n");
            });
            str = str + "\n}";
            var blob = new Blob([str], {type: "text/plain;charset=utf-8"});
            saveAs(blob, lan + ".ts");
        } else {
            swal({text: "Select a language", icon: "error", button: "OK", });
        }
    }
    function showAddTranslation() {
        var productId = $('#productSelector').val();
        if(productId>-1) {
            getAndSetPage("PageAddTranslation?productId=" + productId, "addTranslationWidget");

        } else{
            swal({text: "Please select a product", icon: "error", button: "OK", });
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
                    swal({text: "Translation Edited !", icon: "success", button: "OK", });
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");

                } else {
                    swal({text: result, icon: "error", button: "OK", });
                }

            }).fail(function () {
                swal({text: "Error", icon: "error", button: "OK", });
            }
        );
    }
    function removeProdTrans(ele) {
        $.post('RemoveTranslationToProduct', {
                key: ele.dataset.key,
                productId: $('#productSelector').val(),
                sess: sess
            },
            function (result) {
                console.log("Response received");
                if (result === "") {
                    getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val(), "translationTable");
                    swal({text: "Translation removed from product", icon: "success", button: "OK", });
                } else {
                    swal({text: result, icon: "error", button: "OK", });
                }

            }).fail(function () {
            swal({text: "Error", icon: "error", button: "OK", });
            }
        );
    }
    function addTranslationToProduct() {
        if($('#productSelector').val() < 0){
            swal({text: "Please select a product", icon: "error", button: "OK", });
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
                        swal({text: result, icon: "error", button: "OK", });
                    }

                }).fail(function () {
                    swal({text: "Error", icon: "error", button: "OK", });
                }
            );
        }
    }
</script>
