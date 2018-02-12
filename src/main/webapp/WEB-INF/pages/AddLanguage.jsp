<div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <div class="w3-card-4">

        <div class="w3-container w3-green">
            <h4>Add Language</h4>
        </div>

        <div class="w3-container w3-padding-16">

            <label>Language Name</label>
            <input id="name" class="w3-input" type="text">

            <button class="w3-button w3-blue w3-right w3-margin" onclick="addLanguage()">Add Language</button>

        </div>

    </div>
</div>

<script>

    function addLanguage() {
        $.post('AddLanguage', {
                name: $('#name').val(),
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