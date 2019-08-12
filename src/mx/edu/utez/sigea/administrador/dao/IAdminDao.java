package mx.edu.utez.sigea.administrador.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.docente.model.DocenteAsesoria;
import mx.edu.utez.sigea.docente.model.DocenteMateria;
import mx.edu.utez.sigea.hoficial.model.HOficial;

import java.util.List;

public interface IAdminDao {

    Docente obtenerNombreDocente(Docente docente);

    List<DocenteAsesoria> obtenerDocentes();

    List<DocenteMateria> obtenerDocentesGenerales();

    boolean registrarHorario(HOficial horario);

}
