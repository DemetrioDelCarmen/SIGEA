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

@MultipartConfig
@WebServlet(name = "AdministradorServlet", urlPatterns = "AdministradorServlet")
public class AdministradorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String accion = request.getParameter("accion");
        switch(accion){
            case "login":{

                HttpSession session = request.getSession();

                if(session.getAttribute("idDocente") == null){

                    response.sendRedirect("iniciarSesion.jsp");


                }

                int idDocente = (int )session.getAttribute("idDocente");

                Docente docente = new Docente();
                AdministradorDao  administradorDao =  new AdministradorDao();

                docente.setId_Docente(idDocente);
                docente = administradorDao.obtenerNombreDocente(docente);

                request.setAttribute("nombreDocente",docente.getNombre_docente());
                request.setAttribute("primerApellidoDocente",docente.getPrimerApellido_Docente());
                request.setAttribute("segundoApellidoDocente",docente.getSegundoApellido_Docente());

                request.getRequestDispatcher("/Administrador/dashboardAdmin.jsp")
                        .forward(request,response);






                break;
            }
            default:{
                System.out.println("No se reconoce la accion");
            }

        }


    }


}
