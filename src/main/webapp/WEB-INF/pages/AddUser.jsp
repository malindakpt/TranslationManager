<div class="w3-content w3-justify w3-text-grey w3-padding-16" id="about" style="    max-width: 400px;">
    <div class="w3-card-4">

        <div class="w3-container w3-indigo">
            <h4>Add User</h4>
        </div>

        <div class="w3-container w3-padding-16">

            <label>Name</label>
            <input id="name" class="w3-input" type="text">
            <label>User Name</label>
            <input id="userName" class="w3-input" type="text">
            <label>Password</label>
            <input id="password1" class="w3-input" type="password">
            <label>Confirm Password</label>
            <input id="password2" class="w3-input" type="password">

            <button class="w3-button w3-blue w3-right w3-margin" onclick="addUser()">Add User</button>

        </div>

    </div>
</div>

<script>
    function addUser() {

        $.post('AddUser', {
                name: $('#name').val(),
                userName: $('#userName').val(),
                password1: $('#password1').val(),
                password2: $('#password2').val(),
                sess: sess
            },
            function (result) {
                if (result === "") {
                    swal("Success", "User Added", "success");
                    getAndSetPage("PageAddUser");
                } else {
                    swal("Error", result, "error");
                }

            }).fail(function () {
                swal("Error", "Unexpected error occured", "error");
            }
        );
    }
</script>