<%@ page import="entity.User" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
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
<script src="js/jQuery.js"></script>
<script src="js/FileSaver.js"></script>
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

<%
    EntityManager entityManager = new EntityManager();
    String sessionId = request.getParameter("sess");
    User user = (User) entityManager.getFirstEntity1(User.class,"sessionId",sessionId);

    if(user==null) {
        response.sendRedirect("PageLogin");
    }else{
%>

<script>
    var sess = <%=sessionId%>;

</script>



<body class="">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center w3-indigo">
    <!-- Avatar image in top left corner -->
    <img src="img/logo1.png" style="width:100%" class="logo">
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hover-indigo" onclick="getAndSetPage('PageEditProduct')">
        <i class="fa fa-home w3-xxlarge"></i>
        <p>HOME</p>
    </a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hover-indigo" onclick="getAndSetPage('PageAddLanguage')">
        <i class="fa fa-plus-circle w3-xxlarge"></i>
        <p>ADD LANGUAGE</p>
    </a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hover-indigo" onclick="getAndSetPage('PageAllTranslations')">
        <i class="fa fa-bars w3-xxlarge"></i>
        <p>ALL ENTRIES</p>
    </a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hover-indigo" onclick="getAndSetPage('PageAddUser')">
        <i class="fa fa-user-plus w3-xxlarge"></i>
        <p>ADD USER</p>
    </a>

    <%--<a href="#" class="w3-bar-item w3-button w3-padding-large w3-hover-indigo">--%>
        <%--<i class="fa fa-envelope w3-xxlarge"></i>--%>
        <%--<p>CONTACT</p>--%>
    <%--</a>--%>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
    <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
        <a href="#" class="w3-bar-item w3-button" style="width:25% !important">HOME</a>
        <a href="#about" class="w3-bar-item w3-button" style="width:25% !important">ABOUT</a>
        <a href="#photos" class="w3-bar-item w3-button" style="width:25% !important">PHOTOS</a>
        <a href="#contact" class="w3-bar-item w3-button" style="width:25% !important">CONTACT</a>
    </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
    <!-- Header/Home -->
    <header class="w3-container w3-padding-32 w3-center w3-indigo" id="home">
        <span><h3>Mubasher Trade Language Portal</h3> </span>
        <span>Logged in : <%=user.getName()%></span>
        <span class="w3-right w3-margin-right"><i class="fa fa-power-off w3-xxlarge"></i></span>
    </header>

    <!-- About Section -->
    <div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">

            <div id="home-middle">

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
            <i class="fa fa-facebook-official w3-hover-opacity w3-right"></i>
            <i class="fa fa-twitter w3-hover-opacity w3-right"></i>
            <i class="fa fa-linkedin w3-hover-opacity w3-right"></i>
        </div>
        <div class="w3-row">
            <span class="w3-medium w3-right">Powered by </span>
        </div>
        <div class="w3-row">
            <span class="w3-medium w3-right">Mubasher Trade 2018</span>
        </div>


        <!-- End footer -->
    </footer>

    <!-- END PAGE CONTENT -->
</div>

</body>
</html>
<script>

    var sess = '';
    function w3_open() {
//        document.getElementById("mySidebar").style.display = "block";
//        document.getElementById("myOverlay").style.display = "block";
    }
    function w3_close() {
//        document.getElementById("mySidebar").style.display = "none";
//        document.getElementById("myOverlay").style.display = "none";
    }
    function busyOn() {
//        document.getElementById("myOverlay2").style.display = "block";
//        document.getElementById("busyIcon").style.display = "block";
    }
    function busyOff() {
//        document.getElementById("myOverlay2").style.display = "none";
//        document.getElementById("busyIcon").style.display = "none";
    }
    function showHideElement(id) {
        var x = document.getElementById(id);
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
    function openNav() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
    function getAndSetPage(page, to) {
        w3_close();
        busyOn();
        $.post(page, {},
            function (result) {
                if(to){
                    $('#'+to+'').html(result);
                }else{
                    $('#home-middle').html(result);
                }
                busyOff();
            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function toUnicode(theString) {
        var unicodeString = '';
        for (var i=0; i < theString.length; i++) {
            var theUnicode = theString.charCodeAt(i).toString(16).toUpperCase();
            while (theUnicode.length < 4) {
                theUnicode = '0' + theUnicode;
            }
            theUnicode = '\\u' + theUnicode;
            unicodeString += theUnicode;
        }
        return unicodeString;
    }
    getAndSetPage('PageEditProduct');
</script>



<% } %>