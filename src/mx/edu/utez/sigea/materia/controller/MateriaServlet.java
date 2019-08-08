package mx.edu.utez.sigea.materia.controller;

import com.google.gson.Gson;
import mx.edu.utez.sigea.docente.dao.DocenteDao;
import mx.edu.utez.sigea.docente.model.DocenteMateria;

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
@WebServlet(name = "MateriaServlet", urlPatterns = "MateriaServlet")
public class MateriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String load = request.getParameter("load");
            switch (load){

                case "loadDocByMat":{
                        int idMateria = Integer.parseInt(request.getParameter("idMat"));

                    DocenteDao  docenteDao = new DocenteDao();
                    List<DocenteMateria> docentesMaterias = docenteDao.obtenerDocenteMateria(idMateria);

                    PrintWriter out = response.getWriter();

                    Gson gson = new Gson();

                    out.print(gson.toJson(docentesMaterias));

                    break;
                }
                default:
                    System.out.println("Nel");

            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
