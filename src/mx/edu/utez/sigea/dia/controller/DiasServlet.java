package mx.edu.utez.sigea.dia.controller;

import com.google.gson.Gson;
import mx.edu.utez.sigea.dia.dao.DiaDao;
import mx.edu.utez.sigea.dia.model.Dia;

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
@WebServlet(name = "DiasServlet", urlPatterns = "DiasServlet")
public class DiasServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "loadDaysDoc": {

                int idDocente = Integer.parseInt(request.getParameter("idDocente"));
                DiaDao diaDao = new DiaDao();

                List<Dia> dias = diaDao.obtenerDiasHorarioDocente(idDocente);

                PrintWriter out = response.getWriter();

                Gson gson = new Gson();

                out.print(gson.toJson(dias));


                break;
            }
            default:
                System.out.println("nel");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
