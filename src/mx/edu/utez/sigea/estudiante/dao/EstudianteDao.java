package mx.edu.utez.sigea.estudiante.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EstudianteDao implements IEstudianteDao {

    @Override
    public Estudiante obtenerEstudiante(Estudiante estudiante) {

        String  sqlNombreEstudiante = "select Nombre_estudiante,PrimerApellido_estudiante,SegundoApellido_estudiante  from estudiante  \n" +
                "\t\tinner join  usuario u on usuario_id_User = id_User where usuario_id_User = ?;";

        try{

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareStatement(sqlNombreEstudiante);

                    preparedStatement.setInt(1,estudiante.getId_estudiante());
                    ResultSet resultSet =  preparedStatement.executeQuery();
                    resultSet.next();

                    estudiante.setNombre_estudiante(resultSet.getString(1));
                    estudiante.setPrimerApellido_estudiante(resultSet.getString(2));
                    estudiante.setSegundoApellido_estudiante(resultSet.getString(3));

        }catch (SQLException ex){
            System.out.println(this.getClass().getCanonicalName()+ "@"+ ex.getMessage());
        }
        return estudiante;
    }

  /* public static void main(String[] args) {
        EstudianteDao estudianteDao = new EstudianteDao();
        //int idEstudiante =1;

        Estudiante estudiante = new Estudiante();
        estudiante.setId_estudiante(14);
        estudiante = estudianteDao.obtenerEstudiante(estudiante);

        System.out.println("id del estudiante  = "+ estudiante.getId_estudiante());
        System.out.println(estudiante.getNombre_estudiante() +" "+ estudiante.getPrimerApellido_estudiante()
        +" "+ estudiante.getSegundoApellido_estudiante());
    }

   */


}
