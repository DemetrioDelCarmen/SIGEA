<%--
  Created by IntelliJ IDEA.
  User: Demetrio Del Carmen
  Date: 21/08/2019
  Time: 02:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>ASESORIAS AGENDADAS</title>

    <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
    <script src="js/bootstrap.min.js" type="application/javascript"></script>
    <script src="js/dbEstudiante.js" type="application/javascript"></script>

    <script src="js/sweetalert.min.js"></script>
    <script src="js/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styleR.css">
</head>
<body>

<nav class="navbar navbar-fixed-top" id="navbar">
    <div class="container-fluid">
        <div class="row justify-content-start">
            <div class="col-2 pt-1">
                <button type="button" id="sidebarCollapse" class="btn btn-info">

                    &#9776
                </button>
            </div>
            <div class="col-1"> &nbsp;</div>
            <div class="pt-2">
                <h4>AGENDADAS</h4>
            </div>
        </div>
    </div>


</nav>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div id="nombre"> ${nombre} ${primerApellido} ${segundoApellido} </div>
        <ul>
            <div id="asesorias">

                <li style="background-color: rgb(48, 117, 103); cursor: pointer">
                    <img src="resources/IMG/asesoria.png" alt="" class="iclog"/>ASESORIAS
                </li>

            </div>

            <div id="agendadas">

                <li style="cursor:pointer;"><img src="resources/IMG/agenda.png" alt="" class="iclog"/>AGENDADAS</li>

            </div>
            <div id="concluidas">

                <li style="cursor:pointer;"><img src="resources/IMG/asesoriaconcluida.png" alt="" class="iclog"/>CONCLUIDAS</li>

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

    <div class="container-fluid" id="agendarasesoria">
        <h4>No tienes asesorías agendadas aún, agenda aquí</h4>
    </div>

    <form id="nav2">
        <input type="hidden" name="accion"/>
    </form>

    <div class="row justify-content-center">



            <div class="tablaDocentesAsesorias">
                <div class="row">

                        <table class="table  tListadoDocentes">
                            <thead class="th_listadoDocentes">
                            <tr>
                                <th>Día</th>
                                <th>Hora</th>
                                <th>Docente</th>
                                <th>Comentario</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                                <th>Participantes</th>
                            </tr>
                            </thead>
                            <tbody class="tb_listadoDocentes">
                            <c:forEach items="${asesorias}" var="asesoria">
                                <tr>
                                    <td class="tb_listadoDocentes">${asesoria.dia}</td>
                                    <td class="tb_listadoDocentes">${asesoria.hora}</td>
                                    <td class="tb_listadoDocentes">${asesoria.nombreDocente}</td>
                                    <td class="tb_listadoDocentes">${asesoria.comentario}</td>
                                    <c:if test="${asesoria.estado=='Solicitada'}">
                                        <td class="tb_listadoDocentes">
                                            <span class="badge badge-pill badge-primary">${asesoria.estado}</span>
                                        </td>
                                    </c:if>
                                    <c:if test="${asesoria.estado=='Reagendada'}">
                                        <td class="tb_listadoDocentes">
                                            <span class="badge badge-pill badge-warning">${asesoria.estado}</span>
                                        </td>
                                    </c:if>
                                    <td class="tb_listadoDocentes">
                                        <button class="btn btn-danger btn-sm btnEliminar" id="btnCancelar" value="${idEstudiante}" >Cancelar</button>
                                    </td>
                                    <td class="tb_listadoDocentes">${asesoria.participantes}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                </div>


            </div>


        </div>

    </div>



    <!--
        <a href="estudiante.html">
            <div class="container-fluid" id="agendarasesoria">
                <h4>No tienes asesorías agendadas aún, agenda aquí</h4>
            </div>
        </a>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="sinasesoria"></div>

            </div>
        </div>

        -->


</div>

</div>
</body>
</html>
