<%--<input id="textFileEN" placeholder="EN">--%>
<%--<input id="textFileAR" placeholder="AR">--%>
<button  class="w3-button w3-blue w3-right" onclick="upload()">Upload</button>
<textarea id="textFileEN" rows="20" cols="50" placeholder="English Text"></textarea>
<textarea id="textFileAR" rows="20" cols="50" placeholder="Arabic Text"></textarea>



<script>

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

