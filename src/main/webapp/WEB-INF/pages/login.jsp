<html>
<head>
    <script src="js/jQuery.js"></script>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/W3.css">

<style>
    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    /* Set a style for all buttons */
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }

    button:hover {
        opacity: 0.8;
    }

    /* Extra styles for the cancel button */
    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }

    /* Center the image and position the close button */
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        position: relative;
    }

    img.avatar {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 16px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }

    /* The Modal (background) */
    .modal {
        /*display: none; !* Hidden by default *!*/
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        padding-top: 60px;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 25px;
        top: 0;
        color: #000;
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: red;
        cursor: pointer;
    }

    /* Add Zoom Animation */
    .animate {
        -webkit-animation: animatezoom 0.6s;
        animation: animatezoom 0.6s
    }

    @-webkit-keyframes animatezoom {
        from {-webkit-transform: scale(0)}
        to {-webkit-transform: scale(1)}
    }

    @keyframes animatezoom {
        from {transform: scale(0)}
        to {transform: scale(1)}
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>

</head>
<body>
<p class="wid-id"></p>

<div id="id01" class="modal">

    <div class="modal-content animate" style="max-width: 388px;">
        <div class="w3-container w3-indigo">
            <h4>Mubasher Trade Labguage Portal</h4>
        </div>
        <div>
            <img src="img/logo2.png" style="
            width: 200px;
            height: 90px;
                margin-left: 76px;
    margin-top: 32px;
            /*border-radius: 50%;*/
            /*padding: 20px;*/
            /*margin-top: 44px;*/
            /*margin: auto;*/
            /*display: block;"*/
            >
        </div>

        <div class="container">
            <label><b>Username</b></label>
            <input id="userName" type="text" placeholder="Enter Username" name="uname" required>

            <label><b>Password</b></label>
            <input id="password" type="password" placeholder="Enter Password" name="psw" required>

            <button onclick="loginUser()">Login</button>
            <input type="checkbox" checked="checked"> Remember me
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
    </div>
</div>

<script>
    function loginUser() {
        $.post('Login', {
                userName: $('#userName').val(),
                password: $('#password').val()
            },
            function (result) {
                console.log(result)
                var resArr = result.split(",");
                if(resArr[0]==="OK"){
                    window.location.href = "index?sess="+resArr[1];
                }else{
                    alert("Invalid Username or Password")
                }

            }).fail(function (msg) {
                alert(msg);
            }
        );
    }

</script>


</body>

</html>
