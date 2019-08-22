package mx.edu.utez.sigea.estudiante.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.estudiante.model.EstudianteMatricula;
import mx.edu.utez.sigea.estudiantegrupo.model.EstudianteGrupo;
import mx.edu.utez.sigea.materia.dao.MateriaDao;
import mx.edu.utez.sigea.materia.model.Materia;
import mx.edu.utez.sigea.utility.Conexion;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class EstudianteDao implements IEstudianteDao {

    @Override
    public Estudiante obtenerEstudiante(Estudiante estudiante) {

        String sqlNombreEstudiante = "select Nombre_estudiante,PrimerApellido_estudiante,SegundoApellido_estudiante,idCarrera, idGenero from estudiante\n" +
                "                inner join  usuario u on usuario_id_User = id_User where usuario_id_User = ?;";

        try {

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareStatement(sqlNombreEstudiante);

            preparedStatement.setInt(1, estudiante.getId_estudiante());
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            estudiante.setNombre_estudiante(resultSet.getString(1));
            estudiante.setPrimerApellido_estudiante(resultSet.getString(2));
            estudiante.setSegundoApellido_estudiante(resultSet.getString(3));
            estudiante.setIdCarrera(resultSet.getInt(4));
            estudiante.setIdGenero(resultSet.getInt("idGenero"));
            resultSet.close();
            preparedStatement.close();
            conexion.close();
        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }
        return estudiante;
    }

    @Override
    public EstudianteMatricula recuperarEstudianteByMatricula(String matricula) {

        String sp_loadStudentByMatricula = "CALL sp_loadStudentByMatricula(?);";
        EstudianteMatricula estudiante = new EstudianteMatricula();
        try {

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_loadStudentByMatricula);
            preparedStatement.setString(1,matricula);


            ResultSet resultSet=  preparedStatement.executeQuery();
            resultSet.next();



            estudiante.setIdEstudiante(resultSet.getInt("id_estudiante"));
            estudiante.setNombre(resultSet.getString("nombre"));
            estudiante.setIdCarrera(resultSet.getInt("idCarrera"));
            estudiante.setIdGenero(resultSet.getInt("idGenero"));
            estudiante.setIdGrupo(resultSet.getInt("grupo"));

            resultSet.close();
            preparedStatement.close();
            conexion.close();


        }catch (SQLException ex){
            System.out.println(this.getClass().getCanonicalName() +"@"+ ex.getMessage());
        }

        return estudiante;
    }

    @Override
    public EstudianteGrupo obtenerEstudianteById(int idEstudiante) {
        EstudianteGrupo estudiante = new EstudianteGrupo();

        String loadStudentById = "CALL loadStudentById(?);";
        try{

            Connection conexion = new  Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(loadStudentById);
            preparedStatement.setInt(1,idEstudiante);
            ResultSet  resultSet = preparedStatement.executeQuery();
            resultSet.next();

            estudiante.setId_estudiante(idEstudiante);
            estudiante.setGrupo_id_grupo(resultSet.getInt("grupo"));


            resultSet.close();
            preparedStatement.close();
            conexion.close();
        }catch (SQLException ex){
            System.out.println(this.getClass().getCanonicalName() +"@"+ ex.getMessage());
        }


        return estudiante;
    }


}
