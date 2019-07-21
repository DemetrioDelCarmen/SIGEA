package mx.edu.utez.sigea.materia.dao;

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
    public List<Materia> listarMaterias(int idCarrera) {

        List<Materia> materias = new ArrayList<>();

        String sp_materias = "{CALL sp_cargarMaterias(?)}";

        try {
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_materias);
            preparedStatement.setInt(1,idCarrera);
            ResultSet resultSet = preparedStatement.executeQuery();

            Materia materia;
                while(resultSet.next()){
                    materia = new Materia();


                        materia.setIdMat(resultSet.getInt(1));
                        materia.setNombreMateria(resultSet.getString(2));
                        materia.setCarreraId(resultSet.getInt(3));

                        materias.add(materia);

                }
                resultSet.close();
                preparedStatement.close();
                conexion.close();

        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }
        return new ArrayList<>();
    }
}
