package mx.edu.utez.sigea.estudiante.Controller;

import com.google.gson.Gson;
import mx.edu.utez.sigea.asesoria.dao.AsesoriaDao;
import mx.edu.utez.sigea.asesoriaestudiante.dao.AsesoriaEstudianteDao;
import mx.edu.utez.sigea.asesoriaestudiante.model.AsesoriaEstudiante;
import mx.edu.utez.sigea.docente.dao.DocenteDao;
import mx.edu.utez.sigea.docente.model.DocenteMateria;
import mx.edu.utez.sigea.estudiante.dao.EstudianteDao;
import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.estudiante.model.EstudianteMatricula;
import mx.edu.utez.sigea.estudiantegrupo.model.EstudianteGrupo;
import mx.edu.utez.sigea.materia.dao.MateriaDao;
import mx.edu.utez.sigea.materia.model.Materia;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Es requisito indispensable que se ponga la diagonal en el nombre del servlet para
 * *  entrar al servlet
 */
@MultipartConfig
@WebServlet(name = "EstudianteServlet", urlPatterns = "EstudianteServlet")
public class EstudianteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "cargarMateria": {

                HttpSession sesion = request.getSession();
                if (sesion.getAttribute("idEstudiante") == null) {
                    response.sendRedirect("iniciarSesion.jsp");
                } else {
                    int idMateria = Integer.parseInt(request.getParameter("idMateria"));


                    DocenteDao docenteDao = new DocenteDao();
                    List<DocenteMateria> listaDocentesMaterias
                            = docenteDao.obtenerDocenteMateria(idMateria);
                    PrintWriter out = response.getWriter();

                    Gson gson = new Gson();

                    out.print(gson.toJson(listaDocentesMaterias));


                }

                break;
            }

            case "recuperarEstudiante": {
                String matricula = request.getParameter("matricula");
                EstudianteDao estudianteDao = new EstudianteDao();

                EstudianteMatricula estudiante = estudianteDao.recuperarEstudianteByMatricula(matricula);
                PrintWriter out = response.getWriter();
                if (estudiante != null) {

                    Gson gson = new Gson();


                    out.print(gson.toJson(estudiante));
                } else {
                    System.out.println("vacio");
                }


                break;


            }

            case "registrarAsesoria": {

                int idDocente = Integer.parseInt(request.getParameter("docente"));
                int idHorario = Integer.parseInt(request.getParameter("dia"));
                String tema = request.getParameter("tema");
                String comentario = request.getParameter("comentario");
                String[] estudiantes = request.getParameterValues("participantes");
                int idMateria = Integer.parseInt(request.getParameter("idMateria"));

                System.out.println(idMateria);
                boolean registrado = false;
                for (String idEstudiante : estudiantes) {

                    System.out.println("Id del estudiante " + idEstudiante);
                    //por cada idEstudiante voy a hacer una insercion en asesoria
                    EstudianteDao estudianteDao = new EstudianteDao();
                    EstudianteGrupo estudianteGrupo = estudianteDao.obtenerEstudianteById(Integer.parseInt(idEstudiante));
                    System.out.println("Grupo del estudiante " + estudianteGrupo.getGrupo_id_grupo());
                    int estudianteId = Integer.parseInt(idEstudiante);


                    AsesoriaDao asesoriaDao = new AsesoriaDao();
                    registrado = asesoriaDao.registrarAsesoria(1, idMateria, idDocente, tema, comentario, idHorario, estudianteGrupo.getGrupo_id_grupo(), 0, estudianteId);




                }

                if(registrado){
                    System.out.println(registrado);
                    PrintWriter out = response.getWriter();

                    out.print("true");
                }


                break;
            }

            case "Agendadas":{


                HttpSession sesion = request.getSession();
                int idEstudiante = (int) sesion.getAttribute("idEstudiante");
                AsesoriaEstudianteDao asesoriaDao = new AsesoriaEstudianteDao();
                String usuario = asesoriaDao.obtenerUsuarioByID(idEstudiante);
                List<AsesoriaEstudiante> asesorias = asesoriaDao.obtenerAsesoriasRegistradas(usuario);

                EstudianteDao estudianteDao = new EstudianteDao();
                Estudiante estudiante = new Estudiante();
                estudiante.setId_estudiante(idEstudiante);
                estudiante = estudianteDao.obtenerEstudiante(estudiante);



                request.setAttribute("nombre", estudiante.getNombre_estudiante());
                request.setAttribute("primerApellido", estudiante.getPrimerApellido_estudiante());
                request.setAttribute("segundoApellido", estudiante.getSegundoApellido_estudiante());
                request.setAttribute("genero", estudiante.getIdGenero());
                request.setAttribute("asesorias",asesorias);
                request.getRequestDispatcher("/Estudiante/asesoriasAgendadas.jsp").forward(request,response);



             break;
            }

            case "Asesorias":{

                HttpSession sesion = request.getSession();
                if (sesion.getAttribute("idEstudiante") == null) {

                    response.sendRedirect("iniciarSesion.jsp");
                }

                int idEstudiante = (int) sesion.getAttribute("idEstudiante");

                EstudianteDao estudianteDao = new EstudianteDao();
                Estudiante estudiante = new Estudiante();
                estudiante.setId_estudiante(idEstudiante);
                estudiante = estudianteDao.obtenerEstudiante(estudiante);

                int idCarrera = estudiante.getIdCarrera();
                MateriaDao materiaDao = new MateriaDao();

                List<Materia> materias = materiaDao.listarMaterias(estudiante);


                System.out.println("Estudiante " + estudiante.getNombre_estudiante());
                System.out.println("--> " + idCarrera);
                System.out.println("--> genero : " + estudiante.getIdGenero());
                request.setAttribute("materias", materias);
                request.setAttribute("nombre", estudiante.getNombre_estudiante());
                request.setAttribute("primerApellido", estudiante.getPrimerApellido_estudiante());
                request.setAttribute("segundoApellido", estudiante.getSegundoApellido_estudiante());
                request.setAttribute("genero", estudiante.getIdGenero());
                request.getRequestDispatcher("/Estudiante/dashboardEstudiante.jsp").forward(request, response);


                break;
            }

            case "Concluidas":{
                break;
            }
            default:
                System.out.println("Nel");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("idEstudiante") == null) {

            response.sendRedirect("iniciarSesion.jsp");
        }

        int idEstudiante = (int) sesion.getAttribute("idEstudiante");

        EstudianteDao estudianteDao = new EstudianteDao();
        Estudiante estudiante = new Estudiante();
        estudiante.setId_estudiante(idEstudiante);
        estudiante = estudianteDao.obtenerEstudiante(estudiante);

        int idCarrera = estudiante.getIdCarrera();
        MateriaDao materiaDao = new MateriaDao();

        List<Materia> materias = materiaDao.listarMaterias(estudiante);


        System.out.println("Estudiante " + estudiante.getNombre_estudiante());
        System.out.println("--> " + idCarrera);
        System.out.println("--> genero : " + estudiante.getIdGenero());
        request.setAttribute("materias", materias);
        request.setAttribute("nombre", estudiante.getNombre_estudiante());
        request.setAttribute("primerApellido", estudiante.getPrimerApellido_estudiante());
        request.setAttribute("segundoApellido", estudiante.getSegundoApellido_estudiante());
        request.setAttribute("genero", estudiante.getIdGenero());
        request.getRequestDispatcher("/Estudiante/dashboardEstudiante.jsp").forward(request, response);
    }
}
