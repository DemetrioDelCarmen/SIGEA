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
    public List<Hora> obtenerHoras(int idDocente) {

        List<Hora> horas = new ArrayList<>();


        String sp_obtenerHoraAsesoria = "CALL sp_obtenerHoraAsesoria(?);";

        try {

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_obtenerHoraAsesoria);

            preparedStatement.setInt(1, idDocente);
            ResultSet resultSet = preparedStatement.executeQuery();
            Hora hora;

            while (resultSet.next()) {
                hora = new Hora();
                hora.setIdHorario(resultSet.getInt("id_HOficial"));
                hora.setHoraAsesoria(resultSet.getString("horario"));

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
