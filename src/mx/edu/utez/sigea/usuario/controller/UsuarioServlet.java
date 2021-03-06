package mx.edu.utez.sigea.usuario.controller;

import mx.edu.utez.sigea.estudiante.dao.EstudianteDao;
import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.materia.dao.MateriaDao;
import mx.edu.utez.sigea.materia.model.Materia;
import mx.edu.utez.sigea.rol.dao.RolDao;
import mx.edu.utez.sigea.rol.model.Rol;
import mx.edu.utez.sigea.usuario.dao.UsuarioDao;
import mx.edu.utez.sigea.usuario.model.Usuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsuarioServlet", urlPatterns = "UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");


        Usuario user = new Usuario();
        user.setUsuario(usuario);

        user.setContrasena(contrasena);

        UsuarioDao usuarioDao = new UsuarioDao();
        user = usuarioDao.obtenerUsuario(user);

        if (user.getId_User() == 0) {
            request.setAttribute("errorInicioSesion", "Usuario y/o contraseña erróneos");
            request.getRequestDispatcher("iniciarSesion.jsp").forward(request, response);

        } else {
            RolDao rolDao = new RolDao();
            int id = Integer.valueOf(user.getRol_id_rol());
            Rol rol = new Rol();
            rol.setId_rol(id);
            rol = rolDao.obtenerRol(rol);

            String tipoUsuario = rol.getNombre_rol();

            if (tipoUsuario.equalsIgnoreCase("Estudiante")) {


                System.out.println("Redirigido a estudianteServlet");

                System.out.println("Logeado " + user.getId_User() + " rol " + rol.getNombre_rol());
                HttpSession sesion = request.getSession();
                sesion.setAttribute("idEstudiante", user.getId_User());
                response.sendRedirect("EstudianteServlet");


            } else if (tipoUsuario.equalsIgnoreCase("Docente")) {
                System.out.println("Redirigir al dashboard docente");
                System.out.println("Logeado " + user.getId_User() + " rol " + rol.getNombre_rol());
                HttpSession sesion = request.getSession();
                sesion.setAttribute("idDocente", user.getId_User());
                response.sendRedirect("DocenteServlet");


            } else if (tipoUsuario.equalsIgnoreCase("Administrador")) {


                System.out.println("Redirigido a estudianteServlet");

                System.out.println("Logeado " + user.getId_User() + " rol " + rol.getNombre_rol());
                HttpSession sesion = request.getSession();
                sesion.setAttribute("idAdministrador", user.getId_User());
                response.sendRedirect("AdministradorServlet");

            }

        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}



