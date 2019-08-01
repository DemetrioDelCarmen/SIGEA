<%--
  Created by IntelliJ IDEA.
  User: Demetrio Del Carmen
  Date: 31/07/2019
  Time: 05:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.idAdministrador==null}">
    <c:redirect url="../iniciarSesion.jsp"></c:redirect>
</c:if>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Docentes Activos</title>

    <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
    <script src="js/bootstrap.min.js" type="application/javascript"></script>
    <script src="js/Administrador.js" type="application/javascript"></script>
    <script src="js/sweetalert.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styleR.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/docentes.css">

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

            <div id="centrado">
                <div class="col col-md-3"></div>
                <div class="col col-md-6"><h1>Docentes</h1></div>
                <div class="col col-md-3"></div>
            </div>


        </div>




</nav>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div id="nombre"> ${nombreDocente} ${primerApellidoDocente} ${segundoApellidoDocente}</div>
        <ul>
            <div id="estadistica">

                <li style="cursor:pointer; background-color: rgb(48, 117, 103)">
                    <img src="resources/IMG/estadistica.png" alt="" class="iclog"/>ESTADISTICAS
                </li>
            </div>
            <div id="docente">
                <li style="cursor:pointer;"><img src="resources/IMG/docentes.png" alt="" class="iclog"/>DOCENTES</li>
            </div>
            <form id="nav">
                <input type="hidden" name="accion"/>
            </form>


        </ul>
        <div class="row justify-content-center">

            <div id="salir"><input type="button" class="btn btn-info" value="Salir"></div>
        </div>
    </nav>
</div>
<!-- CONTENIDO DE LA PAGINA  -->
<div id="content">


    <div class="container-fluid " id="tituloApartado">
        <h2>Docentes</h2>
    </div>


        <div class="row centrar">

                <div class="col col-md-2"></div>
                <div class="col col-lg-12">

                    <div class="tablaDocentesAsesorias">
                        <div class="row">

                            <div class="col col-lg-8">
                                <table class="table  tListadoDocentes">
                                    <thead class="th_listadoDocentes">
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Materias</th>
                                        <th>Asesorías Realizadas</th>
                                        <th>Horario</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody class="tb_listadoDocentes">
                                    <tr>
                                        <c:forEach
                                        <td class="tb_listadoDocentes">Bernardo Huicochea Naranjo</td>
                                        <td class="tb_listadoDocentes">lorem</td>
                                        <td class="tb_listadoDocentes">lorem</td>
                                        <td class="tb_listadoDocentes">lorem</td>
                                        <td class="tb_listadoDocentes">
                                            <button class="btn btn-primary btn-sm btnAsignar">Asignar</button>
                                            <button class="btn btn-danger btn-sm btnEliminar">Eliminar</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>


                </div>




        </div>








</div>

</body>
</html>
