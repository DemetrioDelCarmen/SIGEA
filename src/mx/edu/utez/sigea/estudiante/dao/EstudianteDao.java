package mx.edu.utez.sigea.estudiante.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.materia.dao.MateriaDao;
import mx.edu.utez.sigea.materia.model.Materia;
import mx.edu.utez.sigea.utility.Conexion;

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

      /*  public static void main(String[] args) {
        EstudianteDao estudianteDao = new EstudianteDao();
        //int idEstudiante =1;

        Estudiante estudiante = new Estudiante();
        estudiante.setId_estudiante(11);
        estudiante = estudianteDao.obtenerEstudiante(estudiante);

        System.out.println("id del estudiante  = "+ estudiante.getId_estudiante());
        System.out.println(estudiante.getNombre_estudiante() +" "+ estudiante.getPrimerApellido_estudiante()
        +" "+ estudiante.getSegundoApellido_estudiante());

            System.out.println("carrera id"  +estudiante.getIdCarrera());


            MateriaDao materiaDao = new MateriaDao();
            List<Materia> materias = materiaDao.listarMaterias(3);

            for (Materia lts : materias){
                System.out.println("--> "+materias);
            }
    }


       */



}
