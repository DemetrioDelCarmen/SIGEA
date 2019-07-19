package mx.edu.utez.sigea.estudiante.Controller;

import mx.edu.utez.sigea.estudiante.dao.EstudianteDao;
import mx.edu.utez.sigea.estudiante.model.Estudiante;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *Es requisito indispensable que se ponga la diagonal en el nombre del servlet para
 *  *  entrar al servlet
 */
@WebServlet(name = "EstudianteServlet", urlPatterns = "EstudianteServlet")
public class EstudianteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession sesion =  request.getSession();
        int idEstudiante  = (int) sesion.getAttribute("idEstudiante");

        EstudianteDao estudianteDao = new EstudianteDao();
        Estudiante estudiante = new Estudiante();
                estudiante.setId_estudiante(idEstudiante);
        estudiante = estudianteDao.obtenerEstudiante(estudiante);

        System.out.println("Estudiante " + estudiante.getNombre_estudiante());
            if(estudiante.getNombre_estudiante()!=null){
                request.setAttribute("nombre", estudiante.getNombre_estudiante());
                request.setAttribute("primerApellido",estudiante.getPrimerApellido_estudiante());
                request.setAttribute("segundoApellido",estudiante.getSegundoApellido_estudiante());

                request.getRequestDispatcher("/Estudiante/dashboardEstudiante.jsp").forward(request,response);

            }





    }
}
