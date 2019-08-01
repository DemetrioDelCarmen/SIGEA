package mx.edu.utez.sigea.administrador.controller;

import mx.edu.utez.sigea.administrador.dao.AdministradorDao;
import mx.edu.utez.sigea.docente.model.Docente;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet(name = "AdministradorServlet", urlPatterns = "AdministradorServlet")
public class AdministradorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
        HttpSession sesion = request.getSession();
        int idAdmin = (int) sesion.getAttribute("idAdministrador");


        Docente docente = new Docente();
        AdministradorDao administradorDao = new AdministradorDao();

        docente.setId_Docente(idAdmin);
        docente = administradorDao.obtenerNombreDocente(docente);


        switch(accion){
            case "Estadistica":{



                request.setAttribute("nombreDocente", docente.getNombre_docente());
                request.setAttribute("primerApellidoDocente", docente.getPrimerApellido_Docente());
                request.setAttribute("segundoApellidoDocente", docente.getSegundoApellido_Docente());
                request.getRequestDispatcher("/Administrador/dashboardAdmin.jsp").forward(request, response);

                break;
            }
            case "ListarDocentes":{


                /*
                trabajando sobre modulo listarDocentes, para el admin,
                 se requiere de un beanEspecializado para modelar el
                 resultado de la consulta esperada, y esa mostrarla en la tabla

                 */
                request.setAttribute("nombreDocente", docente.getNombre_docente());
                request.setAttribute("primerApellidoDocente", docente.getPrimerApellido_Docente());
                request.setAttribute("segundoApellidoDocente", docente.getSegundoApellido_Docente());
                request.getRequestDispatcher("/Administrador/docentes.jsp").forward(request,response);
                break;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("idAdministrador") == null) {

            response.sendRedirect("iniciarSesion.jsp");
        } else {

            int idAdmin = (int) sesion.getAttribute("idAdministrador");


            Docente docente = new Docente();
            AdministradorDao administradorDao = new AdministradorDao();

            docente.setId_Docente(idAdmin);
            docente = administradorDao.obtenerNombreDocente(docente);

            request.setAttribute("nombreDocente", docente.getNombre_docente());
            request.setAttribute("primerApellidoDocente", docente.getPrimerApellido_Docente());
            request.setAttribute("segundoApellidoDocente", docente.getSegundoApellido_Docente());
            request.getRequestDispatcher("/Administrador/dashboardAdmin.jsp").forward(request, response);

        }


    }


}





