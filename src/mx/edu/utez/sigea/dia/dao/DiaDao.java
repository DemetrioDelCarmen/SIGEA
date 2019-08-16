package mx.edu.utez.sigea.dia.dao;

import mx.edu.utez.sigea.dia.model.Dia;
import mx.edu.utez.sigea.utility.Conexion;

import java.net.CookieHandler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiaDao implements IDiaDao {
    @Override
    public List<Dia> obtenerDiasHorarioDocente(int idDocente) {
        List<Dia> listadoDias = new ArrayList<>();

        String sp_consultarDiasDocente = "CALL sp_consultarDiasDocente(?)";

        try {
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_consultarDiasDocente);
            preparedStatement.setInt(1,idDocente);
            ResultSet resultSet = preparedStatement.executeQuery();
            Dia dia;
            while (resultSet.next()){
                dia  = new Dia();

                dia.setId_dia(resultSet.getInt("idDia"));
                dia.setDia_dia(resultSet.getString("dia"));
                listadoDias.add(dia);
            }

            resultSet.close();
            preparedStatement.close();
            conexion.close();


        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }

        return listadoDias;

    }
}
