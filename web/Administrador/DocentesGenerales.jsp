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
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styleR.css">
    <link rel="stylesheet" href="css/docentes.css">


    <!-- Sweet alert data -->
    <script src="js/sweetalert.min.js"></script>
    <script src="js/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css">
    <!-- End sweet alert data -->


</head>
<body>


<nav class="navbar navbar-fixed-top" id="navbar">
    <div class="container-fluid">

        <div class="row col-2 mt-1">
            <button type="button" id="sidebarCollapse" class="btn btn-info">

                <span>&#9776</span>
            </button>
        </div>


        <div class="col-6"><h1>Docentes</h1></div>


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
            <div id="docentesGenerales">
                <li style="cursor:pointer;"><img src="resources/IMG/desk.png" alt="" class="iclog"/>DOCENTES</li>
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


    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12" id="tituloApartado">
                <h2>Docentes</h2>
            </div>


            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Buscar</span>
                </div>
                <input type="text" id="buscadorDocente" class="form-control" placeholder="Ej. Bernardo"
                       aria-describedby="basic-addon1">
            </div>


            <div class="col-10 col-sm-10" id="areaListado">
                <table class="table  tListadoDocentes" id="tablaDocentesGenerales">
                    <thead class="th_listadoDocentes">
                    <tr>
                        <th>Nombre</th>
                        <th>Materias</th>

                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody class="tb_listadoDocentes">
                    <c:forEach var="dg_materias" items="${docentesMaterias}">
                        <tr>

                            <td class="tb_listadoDocentes">${dg_materias.nombreDocente}</td>
                            <td class="tb_listadoDocentes">${dg_materias.nombreMat}</td>
                            <td class="tb_listadoDocentes">

                                <button class="btn btn-primary btn-sm btnAsignar"
                                        data-id="${dg_materias.idDocente}"
                                        data-toggle="modal"
                                        data-target="#modalAsignar">
                                    Asignar
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


        </div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalAsignar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Asignar Horario</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form role="form" action="AdministradorServlet" id="formHorario">

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="dia">Día</label>
                            </div>
                            <select class="custom-select" name="dia" id="dia">
                                <option selected>Seleccione</option>
                                <option value="1">Lunes</option>
                                <option value="2">Martes</option>
                                <option value="3">Miércoles</option>
                                <option value="4">Jueves</option>
                                <option value="5">Viernes</option>

                            </select>
                        </div>


                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Hora de Inicio</span>
                            </div>
                            <input type="text" class="form-control" id="horaInicio" name="horaInicio" placeholder="Ej. 14:00">
                            <div class="input-group-append">
                                <span class="input-group-text">HRS</span>
                            </div>
                        </div>


                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Hora Final</span>
                            </div>
                            <input type="text" class="form-control" id="horaFinal" name="horaFinal" placeholder="Ej. 15:00">
                            <div class="input-group-append">
                                <span class="input-group-text">HRS</span>
                            </div>
                        </div>

                        <input type="hidden" value="" name="idDocente" id="idDocente">
                </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success">Asginar horario</button>
                </div>
            </div>
        </div>
    </div>


</div>


</body>
</html>
