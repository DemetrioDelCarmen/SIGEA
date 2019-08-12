package mx.edu.utez.sigea.administrador.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.docente.model.DocenteAsesoria;
import mx.edu.utez.sigea.docente.model.DocenteMateria;
import mx.edu.utez.sigea.hoficial.model.HOficial;
import mx.edu.utez.sigea.utility.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdministradorDao implements IAdminDao {
    @Override
    public Docente obtenerNombreDocente(Docente docente) {

        String sp_ObtenerInfoDocente = "call  sp_obtenerInfoDocente(?);";
        try {
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_ObtenerInfoDocente);
            preparedStatement.setInt(1, docente.getId_Docente());

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            docente.setNombre_docente(resultSet.getString("Nombre_docente"));
            docente.setPrimerApellido_Docente(resultSet.getString("PrimerApellido_docente"));
            docente.setSegundoApellido_Docente(resultSet.getString("SegundoApellido_docente"));
            //cerramos las conexiones
            resultSet.close();
            preparedStatement.close();
            conexion.close();


        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }

        return docente;
    }

    @Override
    public List<DocenteAsesoria> obtenerDocentes() {
        List<DocenteAsesoria> docentesAsesorias = new ArrayList<>();

        String sp_listadoAsesoriasDocente = "call sp_listadoAsesoriasDocente;";

        try {


            //Bernardo Huicochea Naranjo	Integradora I	Lunes	07:00:00	08:00:00
            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_listadoAsesoriasDocente);
            ResultSet resultSet = preparedStatement.executeQuery();

            DocenteAsesoria docenteAsesoria;
            while (resultSet.next()) {

                docenteAsesoria = new DocenteAsesoria();

                docenteAsesoria.setId_Docente(resultSet.getInt("id_Docente"));
                docenteAsesoria.setNombreDocente(resultSet.getString("nombreDocente"));
                docenteAsesoria.setNombre_Mat(resultSet.getString("Nombre_Mat"));
                docenteAsesoria.setDia(resultSet.getString("dia"));
                //docenteAsesoria.setAsesoriasImpartidas(resultSet.getInt("asesoriasImpartidas"));
                docenteAsesoria.setHorario(resultSet.getString("horario"));

                docentesAsesorias.add(docenteAsesoria);

                System.out.println(docenteAsesoria.getId_Docente());
                System.out.println(docenteAsesoria.getNombreDocente());
                System.out.println(docenteAsesoria.getHorario());

            }


            resultSet.close();
            preparedStatement.close();
            conexion.close();
        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());

        }
        return docentesAsesorias;
    }

    @Override
    public List<DocenteMateria> obtenerDocentesGenerales() {

        List<DocenteMateria> docenteMaterias = new ArrayList<>();
        String sp_DocentesGenerales = "CALL sp_docentesGenerales();";

        Connection conexion = new Conexion().obtenerConexion();

        try {
            PreparedStatement preparedStatement = conexion.prepareCall(sp_DocentesGenerales);
            ResultSet resultSet = preparedStatement.executeQuery();

            DocenteMateria docenteMateria;
            while (resultSet.next()) {

                docenteMateria = new DocenteMateria();
                docenteMateria.setIdDocente(resultSet.getInt("id_Docente"));
                docenteMateria.setNombreDocente(resultSet.getString("nombreDocente"));
                docenteMateria.setNombreMat(resultSet.getString("materia"));

                docenteMaterias.add(docenteMateria);

            }

            preparedStatement.close();
            resultSet.close();
            conexion.close();

        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());
        }

        return docenteMaterias;

    }

    @Override
    public boolean registrarHorario(HOficial horario) {

        String sp_insertarHorario = "CALL sp_insertarHorario(?,?,?,?);";

        Connection conexion = new Conexion().obtenerConexion();

        try{

            PreparedStatement preparedStatement = conexion.prepareCall(sp_insertarHorario);
            preparedStatement.setInt(1,horario.getDocente_id_docente());
            preparedStatement.setInt(2,horario.getDia_id_dia());
            preparedStatement.setString(3,horario.getHoraInicio());
            preparedStatement.setString(4,horario.getHoraFin());

            preparedStatement.execute();
            return true;
        }catch(SQLException ex){
            System.out.println(this.getClass().getCanonicalName()  +"@"+ex.getMessage());
        }

        return false;
    }
}
