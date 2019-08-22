package mx.edu.utez.sigea.hoficial.controller;

import com.google.gson.Gson;
import mx.edu.utez.sigea.hoficial.dao.HoficialDao;
import mx.edu.utez.sigea.hoficial.model.HOficial;
import mx.edu.utez.sigea.hoficial.model.Hora;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@MultipartConfig
@WebServlet(name = "HoficialServlet", urlPatterns = "HoficialServlet")
public class HoficialServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "obtenerHorario": {

                int idDocente = Integer.parseInt(request.getParameter("idDocente"));



                HoficialDao hofDao = new HoficialDao();
                List<Hora> horas = hofDao.obtenerHoras(idDocente);

                Gson gson = new Gson();

                PrintWriter out =  response.getWriter();
                out.print(gson.toJson(horas));


                break;
            }
            default:
                System.out.println("Nelson");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
