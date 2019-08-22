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

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>ASESORIAS</title>

    <script src="js/jquery-3.4.1.min.js" type="application/javascript"></script>
    <script src="js/bootstrap.min.js" type="application/javascript"></script>
    <script src="js/dbEstudiante.js" type="application/javascript"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styleR.css">
    <!--sweet alert -->
    <script src="js/sweetalert.min.js"></script>
    <script src="js/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css">
    <!--sweet alert -->

</head>

<body>

<nav class="navbar navbar-fixed-top" id="navbar">
    <div class="container-fluid">
        <div class="row">
            <div class="col-2 mt-1">
                <button type="button" id="sidebarCollapse" class="btn btn-info">

                    <span>&#9776;</span>
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


    <div class="container-fluid" id="titulo">
        <h4>AGENDA UNA ASESORIAS</h4>
    </div>
    <div class="container-fluid">


        <!-- materias -->
        <div class="container-fluid">
            <div class="row justify-content-around">


                <div class="row justify-content-around">

                    <div class="col-6 col-md-8">
                        <c:forEach items="${materias}" var="materia">
                            <button value="${materia.idMat}" type="button"
                                    class="col-6
                                col-sm-4 materiaasesoria"
                                    data-toggle="modal"
                                    data-target="#modalRegistro">
                                <div class="nombreasesoria">
                                        ${materia.nombreMateria}
                                </div>

                            </button>
                        </c:forEach>
                    </div>

                </div>


                <!-- Modal -->
                <div class="modal fade" id="modalRegistro" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true" width="900px">
                    <div class="modal-dialog" id="anchoModal" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="nombreMateriaModal"></h5>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>


                            <div class="modal-body">
                                <div id="sec1">
                                    <form id="formularioAsesoria">

                                        <div class="form-group">
                                            <label for="docentes">Docente</label>

                                            <select class="form-control" name="docente" id="docentes">
                                                <option value="0">Selecciona un Docente</option>
                                            </select>
                                        </div>

                                        <div class="form-group">

                                            <label for="dia">Elije cuándo</label>

                                            <select class="form-control" name="dia" id="dia">
                                            </select>
                                        </div>


                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Tema</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Sizing example input"
                                                   aria-describedby="inputGroup-sizing-default"
                                                   name="tema"
                                                   placeholder="Ej. Javascript">
                                        </div>


                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Comentario</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Sizing example input"
                                                   aria-describedby="inputGroup-sizing-default"
                                                   name="comentario"
                                                   placeholder="Ej. Funciones Lambda">
                                        </div>


                                </div>
                                <div id="sec2">
                                    <table id="tablaestudianteasesoria">
                                        <thead>
                                        <tr>
                                            <th>Participantes</th>
                                            <th>&nbsp;</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <input type="text" class="form-control" id="participante"
                                                       PLACEHOLDER="Matricula"/>
                                            </td>
                                            <td>
                                                <input type="button" class="btn btn-success mx-1" value=" + "
                                                       id="agregar"/>
                                            </td>


                                        </tr>
                                        </tbody>
                                    </table>
                                    <div>
                                        <p>Nombres: </p>

                                        <select class="custom-select" multiple id="participantes" name="participantes">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="idGrupo" value="" id="idGrupo">
                            <input type="hidden" name="idMateria" id="idMateria" value="">
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal" id="cancelarRegistro">
                                    Cancelar
                                </button>
                                <button type="button" class="btn btn-success" id="registrar">Registrar</button>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>


    </div>
</div>

</body>
</html>
