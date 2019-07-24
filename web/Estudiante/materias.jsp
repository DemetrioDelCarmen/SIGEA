<%--
  Created by IntelliJ IDEA.
  User: Demetrio Del Carmen
  Date: 21/07/2019
  Time: 03:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Materias</title>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>ASESORIAS</title>

        <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
        <script src="js/bootstrap.min.js" type="application/javascript"></script>
        <script src="js/index.js" type="application/javascript"></script>
        <script src="js/sweetalert.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/styleR.css">
        <link rel="stylesheet" href="css/sweetalert.css">
    </head>

<body>

<nav class="navbar navbar-fixed-top" id="navbar">
    <div class="container-fluid">
        <div class="row">
            <div class="col-2 mt-1">
                <button type="button" id="sidebarCollapse" class="btn btn-info">

                    <span>&#9776</span>
                </button>
            </div>
            <div class="col-1"></div>
            <div class="col-8 mt-2">
                <h4>ASESORIAS</h4>
            </div>
        </div>
    </div>

</nav>
<div class="wrapper">
    <!-- Sidebar  -->

</div>
<!-- CONTENIDO DE LA PAGINA  -->
<div id="content">


    <div class="container-fluid" id="titulo">
        <h4>AGENDA UNA ASESORIAS</h4>
    </div>
    <div class="container-fluid">

        <h5>${nombre}</h5>
        <!-- materias -->
        <div class="container-fluid">
            <div class="row justify-content-around">


                <table class="table table-striped">
                    <thead>
                    <th>Nombre Materia</th>
                    </thead>
                    <tbody>


                    <!--   expression languaje-->
                    <c:forEach var="materia" items="${materias}">
                        <tr>
                            <td>${materia.nombreMateria}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


            </div>
        </div>
    </div>
</div>
</body>
</html>
