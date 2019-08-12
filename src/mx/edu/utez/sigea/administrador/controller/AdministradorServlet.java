package mx.edu.utez.sigea.administrador.controller;

import mx.edu.utez.sigea.administrador.dao.AdministradorDao;
import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.docente.model.DocenteAsesoria;
import mx.edu.utez.sigea.docente.model.DocenteMateria;
import mx.edu.utez.sigea.hoficial.model.HOficial;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet(name = "AdministradorServlet", urlPatterns = "AdministradorServlet")
public class AdministradorServlet extends HttpServlet {

    AdministradorDao administradorDao = new AdministradorDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
        HttpSession sesion = request.getSession();
        int idAdmin = (int) sesion.getAttribute("idAdministrador");


        Docente docente = new Docente();


        docente.setId_Docente(idAdmin);
        docente = administradorDao.obtenerNombreDocente(docente);


        switch (accion) {
            case "Estadistica": {
                request.setAttribute("nombreDocente", docente.getNombre_docente());
                request.setAttribute("primerApellidoDocente", docente.getPrimerApellido_Docente());
                request.setAttribute("segundoApellidoDocente", docente.getSegundoApellido_Docente());
                request.getRequestDispatcher("/Administrador/dashboardAdmin.jsp").forward(request, response);

                break;
            }
            case "ListarDocentes": {
                List<DocenteAsesoria> listadoDocentes = administradorDao.obtenerDocentes();
                request.setAttribute("listadoDocentes", listadoDocentes);


                request.setAttribute("nombreDocente", docente.getNombre_docente());
                request.setAttribute("primerApellidoDocente", docente.getPrimerApellido_Docente());
                request.setAttribute("segundoApellidoDocente", docente.getSegundoApellido_Docente());
                request.getRequestDispatcher("/Administrador/docentes.jsp").forward(request, response);
                break;
            }

            case "DocentesGenerales": {


                List<DocenteMateria> docentesMaterias = administradorDao.obtenerDocentesGenerales();
                request.setAttribute("docentesMaterias", docentesMaterias);

                request.setAttribute("nombreDocente", docente.getNombre_docente());
                request.setAttribute("primerApellidoDocente", docente.getPrimerApellido_Docente());
                request.setAttribute("segundoApellidoDocente", docente.getSegundoApellido_Docente());

                request.getRequestDispatcher("/Administrador/DocentesGenerales.jsp").forward(request, response);

                break;
            }

            case "asignarHorario": {

                int idDocente = Integer.parseInt(request.getParameter("idDocente"));
                int idDia = Integer.parseInt(request.getParameter("dia"));
                String horaInicio = request.getParameter("horaInicio");
                String horaFin = request.getParameter("horaFinal");



                HOficial hof  = new HOficial();

                hof.setDocente_id_docente(idDocente);
                hof.setDia_id_dia(idDia);
                hof.setHoraFin(horaInicio);
                hof.setHoraFin(horaFin);

                AdministradorDao adminDao = new AdministradorDao();

                boolean inserto  = adminDao.registrarHorario(hof);
                PrintWriter out = response.getWriter();
                if (inserto)
                    out.print("true");
                else
                    out.print("false");


                break;


            }
            default:
                System.out.println("Nel");
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





