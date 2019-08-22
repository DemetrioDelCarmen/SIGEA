package mx.edu.utez.sigea.asesoriaestudiante.dao;

import mx.edu.utez.sigea.asesoriaestudiante.model.AsesoriaEstudiante;
import mx.edu.utez.sigea.periodo.model.Periodo;
import mx.edu.utez.sigea.usuario.model.Usuario;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AsesoriaEstudianteDao implements IAsesoriaEstudianteDao {
    @Override
    public List<AsesoriaEstudiante> obtenerAsesoriasRegistradas(String participante) {
        List<AsesoriaEstudiante> estudiantesAsesorias = new ArrayList<>();

        String sp_listarAsesoriasRegistradas = "CALL sp_listarAsesoriasRegistradas(?);";
        try {

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_listarAsesoriasRegistradas);
            preparedStatement.setString(1, participante);
            ResultSet resultSet = preparedStatement.executeQuery();

            AsesoriaEstudiante asesoriaEstudiante;

            while (resultSet.next()) {
                asesoriaEstudiante = new AsesoriaEstudiante();

                asesoriaEstudiante.setMateria(resultSet.getString("materia"));
                asesoriaEstudiante.setDia(resultSet.getString("dia"));
                asesoriaEstudiante.setHora(resultSet.getString("hora"));
                asesoriaEstudiante.setNombreDocente(resultSet.getString("nombreDocente"));
                asesoriaEstudiante.setComentario(resultSet.getString("comentario"));
                asesoriaEstudiante.setEstado(resultSet.getString("estado"));
                asesoriaEstudiante.setParticipantes(resultSet.getString("participantes"));
                estudiantesAsesorias.add(asesoriaEstudiante);

            }


            resultSet.close();
            preparedStatement.close();
            conexion.close();

        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }


        return estudiantesAsesorias;
    }

    @Override
    public String obtenerUsuarioByID(int idEstudiante) {

        String usuario ="";

        String loadUserByID = "CALL loadUserByID(?)";
        try {

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(loadUserByID);
            preparedStatement.setInt(1, idEstudiante);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            Usuario user = new Usuario();
            user.setUsuario(resultSet.getString("usuario"));

            usuario = user.getUsuario();


            resultSet.close();
            preparedStatement.close();
            conexion.close();

        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }

        return usuario;
    }
}
