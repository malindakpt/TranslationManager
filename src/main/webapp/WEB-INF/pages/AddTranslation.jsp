<div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <div class="w3-card-4 w3-padding">

        <div class="w3-container w3-green">
            <h4>Add New Translation</h4>
        </div>

        <div class="w3-container">

            <label>Language</label>
            <jsp:include page="components/languageSelector.jsp"/>

            <label>Default Key</label>
            <input id="defKey" class="w3-input" type="text">

            <label>Translation</label>
            <input id="translation" class="w3-input" type="text">

            <button class="w3-right w3-button w3-blue w3-margin" onclick="addTranslation()">Add Translation</button>

        </div>

    </div>
</div>

<script>
    function addTranslation() {
        $.post('AddTranslation', {
                language: $('#languageSelector').val(),
                defKey: $('#defKey').val(),
                translation: $('#translation').val(),
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