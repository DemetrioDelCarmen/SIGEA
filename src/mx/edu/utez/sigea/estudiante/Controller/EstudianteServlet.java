package mx.edu.utez.sigea.estudiante.Controller;

import com.google.gson.Gson;
import mx.edu.utez.sigea.docente.dao.DocenteDao;
import mx.edu.utez.sigea.docente.model.DocenteMateria;
import mx.edu.utez.sigea.estudiante.dao.EstudianteDao;
import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.materia.dao.MateriaDao;
import mx.edu.utez.sigea.materia.model.Materia;

import javax.servlet.ServletException;
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
@WebServlet(name = "EstudianteServlet", urlPatterns = "EstudianteServlet")
public class EstudianteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion  = request.getParameter("accion");

        switch (accion){
            case "cargarMateria":{

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
