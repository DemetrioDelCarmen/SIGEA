<%--
  Created by IntelliJ IDEA.
  User: Demetrio Del Carmen
  Date: 08/07/2019
  Time: 05:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<header>
    <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
    <script src="js/bootstrap.min.js" type="application/javascript"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
</header>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Inicio de Sesión</title>
</head>
<body>

<!-- Start navbar -->
<nav class="container-fluid" id="navbar">
    <div class="row justify-content-between">
        <div class="logodatic">
        </div>
        <div class="logoutez">
        </div>
    </div>
</nav>

<!-- End Navbar -->


<div class="container col-11 col-sm-6 col-md-4 col-lg-4 my-5 login-box ">
    <div class="row justify-content-center">

        <h1>Bienvenido(a)</h1>
    </div>
    <form>
        <!-- USERNAME INPUT -->
        <div class="row logintxt">
            <img src="resources/IMG/users.png" alt="" class="iclog">
            <input type="text" placeholder="Usuario">
        </div>

        <!-- PASSWORD INPUT -->
        <div class="row logintxt my-2 ">
            <img src="resources/IMG/locked-padlock.png" alt="" class="iclog">
            <input type="password" placeholder="Contraseña">
        </div>
        <div>
            <input type="submit" value="Ingresa">
        </div>

        <div class="row justify-content-center my-2">
            <h6><a href="#">¿Olvidaste tu contraseña?</a></h6>
        </div>

    </form>

</body>
</html>
