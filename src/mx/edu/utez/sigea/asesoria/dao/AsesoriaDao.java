package mx.edu.utez.sigea.asesoria.dao;

import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AsesoriaDao implements IAsesoriaDao {


    @Override
    public boolean registrarAsesoria(int statusAsesoria, int idMateria, int idDocente,
                                     String tema, String comentario,
                                     int idHoficial,
                                     int idGrupo, int asistio,
                                     int idEstudiante) {

        String sp_registrarAsesoria = "CALL sp_registrarAsesoria(?,?,?,?,?,?,?,?,?);";

        try{

            Connection conexion = new Conexion().obtenerConexion();

            PreparedStatement preparedStatement = conexion.prepareCall(sp_registrarAsesoria);
            preparedStatement.setInt(1,statusAsesoria);
            preparedStatement.setInt(2,idMateria);
            preparedStatement.setInt(3,idDocente);
            preparedStatement.setString(4,tema);
            preparedStatement.setString(5,comentario);
            preparedStatement.setInt(6,idHoficial);
            preparedStatement.setInt(7,idGrupo);
            preparedStatement.setInt(8,asistio);
            preparedStatement.setInt(9,idEstudiante);
            preparedStatement.execute();
             return true;

        }catch (SQLException ex){
            System.out.println(this.getClass().getCanonicalName()+"@"+ex.getMessage());
        }

        return false;
    }
}
