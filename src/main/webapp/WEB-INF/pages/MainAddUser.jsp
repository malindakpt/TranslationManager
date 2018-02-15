<%@ page import="entity.User" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="util.Constants" %>
<!DOCTYPE html>
<html>
<title>Mubasher Trade</title>
<%--<meta charset="UTF-8">--%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/W3.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/sweetalert.css">
<script src="js/jQuery.js"></script>
<script src="js/FileSaver.js"></script>
<script src="js/sweetAlert.js"></script>
<%@ page pageEncoding="UTF-8" %>
<style>
    body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
    .w3-row-padding img {margin-bottom: 12px}
    /* Set the width of the sidebar to 120px */
    .w3-sidebar {width: 120px;background: #222;}
    /* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
    #main {margin-left: 120px}
    /* Remove margins from "page content" on small screens */
    @media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>



<body class="w3-text-black">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center w3-indigo">
    <!-- Avatar image in top left corner -->
    <img src="img/logo1.png" style="width:100%" class="logo">

</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">

</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
    <!-- Header/Home -->
    <header class="w3-container w3-padding-32 w3-center w3-indigo" id="home">
        <span><h2>Mubasher Trade Language Portal</h2> </span>

        <span></span>
        <span class="w3-right w3-margin-right" onclick="window.location.href='/PageLogin'"><i class="fa fa-power-off w3-xxlarge"></i></span>
    </header>

    <!-- About Section -->
    <div class="w3-content w3-justify w3-text-grey w3-padding-32" id="about">

        <div id="home-middle">
            <jsp:include page="AddUser.jsp"/>
        </div>

    </div>

    <!-- Portfolio Section -->
    <div class="w3-padding-64 w3-content" id="photos">

    </div>

    <!-- Contact Section -->
    <div class="w3-padding-64 w3-content w3-text-grey" id="contact">

        <!-- End Contact Section -->
    </div>

    <!-- Footer -->
    <footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge" style="position: fixed;  bottom: -44px;  right: 27px;">
        <div class="w3-row">
            <%--<i class="fa fa-facebook-official w3-hover-opacity w3-right"></i>--%>
            <%--<i class="fa fa-twitter w3-hover-opacity w3-right"></i>--%>
            <%--<i class="fa fa-linkedin w3-hover-opacity w3-right"></i>--%>

        </div>
        <div class="w3-row">
            <span class="w3-medium w3-right">Powered by </span>
        </div>
        <div class="w3-row">
            <span class="w3-medium w3-right">MubasherTrade 2018</span>
        </div>


        <!-- End footer -->
    </footer>

    <!-- END PAGE CONTENT -->
</div>

</body>
</html>

<script>
    var sess = "";
    function getHash(s){
        return s.split("").reduce(function(a,b){a=((a<<5)-a)+b.charCodeAt(0);return a&a},0);
    }

</script>

