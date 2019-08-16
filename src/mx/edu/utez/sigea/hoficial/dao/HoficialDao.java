package mx.edu.utez.sigea.hoficial.dao;

import mx.edu.utez.sigea.hoficial.model.HOficial;
import mx.edu.utez.sigea.hoficial.model.Hora;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HoficialDao implements IHoficialDao {
    @Override
    public List<Hora> obtenerHoras(int idDocente, int idDia) {

        List<Hora> horas = new ArrayList<>();


        String sp_obtenerHoraAsesoria = "CALL sp_obtenerHoraAsesoria(?,?);";

        try {

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_obtenerHoraAsesoria);

            preparedStatement.setInt(1, idDocente);
            preparedStatement.setInt(2, idDia);

            ResultSet resultSet = preparedStatement.executeQuery();

            Hora hora;

            while (resultSet.next()) {
                hora = new Hora();

                hora.setHoraAsesoria(resultSet.getString("hora"));

                horas.add(hora);

                System.out.println(hora.getHoraAsesoria());


            }
            resultSet.close();
            preparedStatement.close();
            conexion.close();


        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());

        }


        return horas;

    }
}
