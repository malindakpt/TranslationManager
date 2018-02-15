
<div id="editTranslationContainer">

</div>

<div id="addTranslationWidget">
    <%--<jsp:include page="AddTranslation.jsp"/>--%>
</div>
<div class="w3-row w3-bottombar w3-border-indigo " >
    <div class="w3-col s3  w3-margin-top">
        <button class="w3-indigo w3-button" onclick="showAddTranslation()" ><i class="fa fa-plus-circle"></i> Add New Translation</button>
    </div>

    <div class="w3-col s4 w3-right ">
            <div class="w3-row w3-right">
                <label>Keys</label>
                <input id="idKey" class="w3-radio" type="radio" name="gender" value="key">

                <label>Words</label>
                <input id="idLan" class="w3-radio" type="radio" name="gender" value="lan" checked>
            </div>
            <div>
                <input class="w3-input w3-margin-bottom" id="searchInputValue" onfocus="showSearch()" onblur="hideTimeout()" onkeyup="searchKey()" placeholder="Search..."/>
                <div id="searchResultContainer"></div>
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
                <button class="w3-button w3-indigo  w3-right " onclick="downloadFile()"><i class="fa fa-download"></i>  Download</button>
            </div>
            <div class="w3-col s8  w3-right ">
                <jsp:include page="components/languageSelector.jsp"/>
            </div>
        </div>
    </div>

<br>
<br>

<div class="w3-row">
  <div id="translationTable">
      <jsp:include page="components/emptyTable.jsp"/>
  </div>

</div>

</div>

<script>
    function hideTimeout() {
        setTimeout(function(){
            $('#searchResultContainer').hide();
            $('#searchInputValue').val("");
        }, 300);
    }

    function showSearch() {
        setTimeout(function(){ $('#searchResultContainer').show(); }, 300);
    }

    function searchKey() {
        var key = $('#searchInputValue').val();
        var searchKey;
        if(key!="") {
            console.log(key);
            if($('#idKey').is(':checked')){
                searchKey = key;
            }else{
                searchKey = toUnicode(key);
            }
            $('#searchResultContainer').show()
            getAndSetPage("PageSearchKey?key=" +  searchKey+"&lan=" + $('#idLan').is(':checked'), "searchResultContainer");
        } else{
            $('#searchResultContainer').hide();
        }
    }
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
            swal("Error", "Select a language", "error");
        }
    }
    function showAddTranslation() {
        var productId = $('#productSelector').val();
        if(productId>-1) {
            getAndSetPage("PageAddTranslation?productId=" + productId, "addTranslationWidget");

        } else{
            swal("Error", "Please select a product", "error");
        }
    }
    function onProductChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&showEmpty="+$('#fileterSelector').val(), "translationTable");
    }
    function onLanguageChange() {
        getAndSetPage("PageProTransTable?productId=" + $('#productSelector').val()+"&showEmpty="+$('#fileterSelector').val(), "translationTable");
    }


    function editProdTrans(ele) {

        $.post('PageEditTranslation', {
                id: ele.id,
                sess: sess
            },
            function (result) {
                console.log("Response received");
                if (result === "") {
                    swal("Success", "Translation edited", "success");
                    getAndSetPage("PageProTransTable?showEmpty="+$('#fileterSelector').val()+"&productId=" + $('#productSelector').val(), "translationTable");

                } else {
                    swal("Error", result, "error");
                }

            }).fail(function () {
                swal("Error", "Unexpected error occured", "error");
            }
        );
    }
    function removeProdTrans(ele) {
        swal({
            title: "Are you sure you need to remove this ?",
            type: "warning",
            showCancelButton: true
        }, function() {
            $.post('RemoveTranslationToProduct', {
                    key: ele.dataset.key,
                    productId: $('#productSelector').val(),
                    sess: sess
                },
                function (result) {
                    console.log("Response received");
                    if (result === "") {
//                        swal("Success", "Translation removed from product", "success");
                        alert("Translation removed from product")
                        getAndSetPage("PageProTransTable?showEmpty="+$('#fileterSelector').val()+"&productId=" + $('#productSelector').val(), "translationTable");
                    } else {
//                        swal("Error", result, "error");
                        alert("Operation not permited")
                    }

                }).fail(function () {
                    swal("Error", "Unexpected error occured", "error");
                }
            );
        });

    }
    function addTranslationToProduct(event) {
        console.log("Asdasdasd");
        if($('#productSelector').val() < 0){
            swal("Error", "Please select aproduct", "error");
        } else {
            $.post('AddTranslationToProduct', {
                    enText: toUnicode(event.dataset.txt),
//                    enText: toUnicode($('#searchInputValue').val()),
                    languageArr: [1, 2],
                    productId: $('#productSelector').val(),
                    sess: sess
                },
                function (result) {
                    if (result === "") {

                        swal("Success", "Translation added to product", "success");
                        getAndSetPage("PageProTransTable?showEmpty="+$('#fileterSelector').val()+"&productId=" + $('#productSelector').val() + "&languageId=" + $('#languageSelector').val(), "translationTable");

                    } else {
                        swal("Error", result, "error");
                    }

                }).fail(function () {
                    swal("Error", "Unexpected error occured", "error");
                }
            );
        }
    }
</script>

