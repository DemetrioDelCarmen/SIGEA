package mx.edu.utez.sigea.materia.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.materia.model.Materia;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MateriaDao implements IMateriaDao {
    @Override
    public List<Materia> listarMaterias(Estudiante estudiante) {

        List<Materia> materias = new ArrayList<>();

        String sp_materias = "SELECT  id_Mat, Nombre_Mat,Carrera_id from materia where Carrera_id  = ?;";


        try {
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_materias);
            preparedStatement.setInt(1, estudiante.getIdCarrera());
            ResultSet resultSet = preparedStatement.executeQuery();

            Materia materia;
            while (resultSet.next()) {
                materia = new Materia();


                materia.setIdMat(resultSet.getInt("id_Mat"));
                materia.setNombreMateria(resultSet.getString("Nombre_Mat"));
                materia.setCarreraId(resultSet.getInt("Carrera_id"));

                materias.add(materia);
                System.out.println(materia.getNombreMateria());

            }
            resultSet.close();
            preparedStatement.close();
            conexion.close();

        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }
        return materias;
    }


}
