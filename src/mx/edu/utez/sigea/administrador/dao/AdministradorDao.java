package mx.edu.utez.sigea.administrador.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdministradorDao implements IAdminDao {
    @Override
    public Docente obtenerNombreDocente(Docente docente) {

        String sp_ObtenerInfoDocente = "call  sp_obtenerInfoDocente(?);";
        try{
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement  preparedStatement = conexion.prepareCall(sp_ObtenerInfoDocente);
            preparedStatement.setInt(1,docente.getId_Docente());

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            docente.setNombre_docente(resultSet.getString("Nombre_docente"));
            docente.setPrimerApellido_Docente(resultSet.getString("PrimerApellido_docente"));
            docente.setSegundoApellido_Docente(resultSet.getString("PrimerApellido_docente"));
            //cerramos las conexiones
            resultSet.close();
            preparedStatement.close();
            conexion.close();


        }catch (SQLException ex){
            System.out.println(this.getClass().getCanonicalName() +"@"+ ex.getMessage());
        }

        return docente;
    }

    @Override
    public List<Docente> obtenerDocentes() {
        List<Docente> docentes = new ArrayList<>();




        return docentes;
    }
}
