package mx.edu.utez.sigea.usuario.dao;

import mx.edu.utez.sigea.usuario.model.Usuario;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDao implements IUsuarioDao {
    @Override
    public Usuario obtenerUsuario(Usuario usuario) {
            //Consulta para obtener el usuario
            String sqlUsuarioValidacion = "SELECT id_User, usuario, contrasena, rol_id_rol " +
                    "FROM usuario WHERE  usuario = ? AND contrasena = ?";





            try{
                Connection conexion = new Conexion().obtenerConexion();
                PreparedStatement  preparedStatement = conexion.prepareStatement(sqlUsuarioValidacion);

                preparedStatement.setString(1,usuario.getUsuario());
                preparedStatement.setString(2,usuario.getContrasena());
                ResultSet resultSet =  preparedStatement.executeQuery();



                resultSet.next();
                usuario.setId_User(resultSet.getInt("id_User"));
                usuario.setRol_id_rol(resultSet.getInt("rol_id_rol"));

                resultSet.close();
                preparedStatement.close();
                conexion.close();
            } catch (SQLException ex) {
                System.out.println(this.getClass().getCanonicalName() +"@"+ex.getMessage());
            }
        return usuario;
    }
}
