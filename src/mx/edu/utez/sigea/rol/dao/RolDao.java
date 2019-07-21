package mx.edu.utez.sigea.rol.dao;

import mx.edu.utez.sigea.rol.model.Rol;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RolDao implements IRolDao {


    @Override
    public Rol obtenerRol(Rol rol) {
        String queryObtenerRol = "select Nombre_rol from rol where id_rol = ?;";

        try {
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement  = conexion.prepareStatement(queryObtenerRol);

            preparedStatement.setInt(1,rol.getId_rol());

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            rol.setNombre_rol(resultSet.getString("Nombre_rol"));

            resultSet.close();
            preparedStatement.close();
            conexion.close();
        } catch (SQLException e) {
            System.out.println(this.getClass().getCanonicalName()  +"@" + e.getMessage());
        }

        return rol;
    }






}

