package mx.edu.utez.sigea.docente.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocenteDao implements IDocenteDao {
    @Override
    public List<Docente> obtenerDocenteMateria(int idMat) {
        List<Docente> docentes = new ArrayList<>();

            String sqlObtenerDocentes = "CALL sp_listarMateriasDocente(?)";
            try{

                Connection conexion = new Conexion().obtenerConexion();
                PreparedStatement preparedStatement = conexion.prepareCall(sqlObtenerDocentes);
                preparedStatement.setInt(1,idMat);
                ResultSet resultSet = preparedStatement.executeQuery();

                Docente docente;
                while (resultSet.next()){
                    docente = new Docente();

                    docente.setId_Docente(resultSet.getInt("id_Docente"));
                    docente.setNombre_docente(resultSet.getString("Nombre_docente"));
                    docente.setPrimerApellido_Docente(resultSet.getString("PrimerApellido_Docente"));
                    docente.setSegundoApellido_Docente(resultSet.getString("SegundoApellido_Docente"));
                    docente.setUsuario_id_User(resultSet.getInt("usuario_id_User"));

                    docentes.add(docente);
                    System.out.println(docente.getNombre_docente() + docente.getPrimerApellido_Docente());

                }
                resultSet.close();
                preparedStatement.close();
                conexion.close();


            }catch(SQLException ex){
                System.out.println(this.getClass().getCanonicalName() +"@"+ ex.getMessage());
            }


        return docentes;


    }

/*
        public static void main(String[] args) {

        DocenteDao docenteDao = new DocenteDao();

        List<Docente> docentes = docenteDao.obtenerDocenteMateria(3);



    }

 */
}
