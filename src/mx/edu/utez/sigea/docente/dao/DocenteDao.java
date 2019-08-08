package mx.edu.utez.sigea.docente.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.docente.model.DocenteMateria;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocenteDao implements IDocenteDao {
    @Override
    public List<DocenteMateria> obtenerDocenteMateria(int idMat) {

        List<DocenteMateria> docentesMaterias = new ArrayList<>();

        String sp_listarMateriasDocente = "call sp_listarMateriasDocente(?);";
        try{
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_listarMateriasDocente);
            preparedStatement.setInt(1,idMat);
            ResultSet resultSet = preparedStatement.executeQuery();

            DocenteMateria docenteMateria;
            while (resultSet.next()){
                docenteMateria = new DocenteMateria();

                docenteMateria.setIdDocente(resultSet.getInt("id_Docente"));
                docenteMateria.setNombreDocente(resultSet.getString("Nombre_docente"));
                docenteMateria.setPrimerApellidoDocente(resultSet.getString("PrimerApellido_Docente"));
                docenteMateria.setSegundoApellidoDocente(resultSet.getString("SegundoApellido_Docente"));
                docenteMateria.setNombreMat(resultSet.getString("Nombre_Mat"));

                docentesMaterias.add(docenteMateria);

            }

            resultSet.close();
            preparedStatement.close();
            conexion.close();



        }catch(SQLException ex){
            System.out.println(this.getClass().getCanonicalName()  +"@"+ex.getMessage());
        }




        return docentesMaterias;


    }

}
