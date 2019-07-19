<%--
  Created by IntelliJ IDEA.
  User: Demetrio Del Carmen
  Date: 15/07/2019
  Time: 07:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${sessionScope.idEstudiante==null}">
            <c:redirect url="../iniciarSesion.jsp"></c:redirect>
</c:if>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>ASESORIAS</title>

    <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
    <script src="js/bootstrap.min.js" type="application/javascript"></script>
    <script src="js/index.js" type="application/javascript"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styleR.css">
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
    <nav id="sidebar">

            <h5 id="nombre">
                ${nombre} &nbsp; ${primerApellido} &nbsp; ${segundoApellido}
            </h5>
        <ul>
            <a href="#">

                <li style="background-color: rgb(48, 117, 103)">
                    <img src="resources/IMG/asesoria.png" alt="" class="iclog" />ASESORIAS</li>
            </a>
            <a href="#">
                <li ><img src="resources/IMG/docentes.png" alt="" class="iclog" />AGENDA</li>
            </a>


        </ul>
        <div class="row justify-content-center">

            <div id="salir"><input type="button" class="btn btn-info" value="Salir"></div>
        </div>
    </nav>
</div>
<!-- CONTENIDO DE LA PAGINA  -->
<div id="content">


    <div class="container-fluid" id="titulo">
        <h4>ASESORIAS</h4>
    </div>
    <div class="container-fluid">
        <div class="row">



                        <div class="col-6 col-sm-4 col-md-3 TarjEst">
                            <div class="numeroest">15</div>
                            <p>Estudiantes Masculinos </p>
                        </div>

                        <div class="col-6 col-sm-4 col-md-3 TarjEst">
                            <div class="numeroest">15</div>
                            <p>Estudiantes Masculinos </p>
                        </div>

                        <div class="col-6 col-sm-4 col-md-3 TarjEst">
                            <div class="numeroest">15</div>
                            <p>Estudiantes Masculinos </p>
                        </div>

        </div>
    </div>




</div>

</div>


</body>
</html>
