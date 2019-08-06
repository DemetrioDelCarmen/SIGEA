package mx.edu.utez.sigea.administrador.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.docente.model.DocenteAsesoria;
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

            Connection conexion = new Conexion().obtenerConexion();
            PreparedStatement preparedStatement = conexion.prepareCall(sp_listadoAsesoriasDocente);
            ResultSet resultSet = preparedStatement.executeQuery();

            DocenteAsesoria  docenteAsesoria;
            while (resultSet.next()){

                docenteAsesoria = new DocenteAsesoria();

                docenteAsesoria.setId_Docente(resultSet.getInt("id_Docente"));
                docenteAsesoria.setNombreDocente(resultSet.getString("nombreDocente"));
                docenteAsesoria.setNombre_Mat(resultSet.getString("Nombre_Mat"));
                docenteAsesoria.setAsesoriasImpartidas(resultSet.getInt("asesoriasImpartidas"));
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
    }
