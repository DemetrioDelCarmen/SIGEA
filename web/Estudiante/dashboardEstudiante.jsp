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
            <a href="#">

                <li style="background-color: rgb(48, 117, 103)">
                    <img src="resources/IMG/asesoria.png" alt="" class="iclog"/>ASESORIAS
                </li>
            </a>
            <a href="estudianteAgendadas.html">
                <li><img src="resources/IMG/agenda.png" alt="" class="iclog"/>AGENDADAS</li>
            </a>
            <a href="estudianteConcluidas.html">
                <li><img src="resources/IMG/asesoriaconcluida.png" alt="" class="iclog"/>CONCLUIDAS</li>
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
        <h4>AGENDA UNA ASESORIAS</h4>
    </div>
    <div class="container-fluid">


        <!-- materias -->
        <div class="container-fluid">
            <div class="row justify-content-around">


            <div class="row justify-content-around">

                <div class="col-6 col-md-8">
                    <c:forEach items="${materias}" var="materia">
                        <button value="${materia.idMat}" type="button" class="col-6  col-sm-4 materiaasesoria">
                            <div class="nombreasesoria">
                                    ${materia.nombreMateria}
                            </div>

                        </button>
                    </c:forEach>
                </div>

            </div>












                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content" id="">
                            <div class="modal-cabeza">
                                <button type="button" class="close" data-dismiss="modal"></button>
                                <div class="row">

                                    <div class="col col-md-3"></div>
                                    <div class="col col-md-6 titleModal">
                                        <h4>Cálculo diferencial</h4>
                                        <h6>Con quién y cuándo</h6>
                                    </div>

                                    <div class="col col-md-3"></div>


                                </div>


                            </div>

                            <div class="modal-body">

                                <form>
                                    <div class="form-group">
                                        <label for="docente">Docente</label>
                                        <select class="form-control" id="docente">
                                            <option value="0">Selecciona un Docente</option>
                                            <option value="1">Mario Alberto Nava Diaz</option>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="horario">Horario</label>
                                        <select class="form-control" id="horario">
                                            <option value="0">Selecciona un Horario</option>
                                            <option value="1">Lunes 3:00 - 4:00</option>

                                        </select>
                                    </div>
                                </form>
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
                                                   onkeyup="myFunction(this)"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-success mx-1" value=" + "
                                                   id="agregar"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
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
