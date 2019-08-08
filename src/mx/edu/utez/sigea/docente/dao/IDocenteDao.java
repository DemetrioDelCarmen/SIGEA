package mx.edu.utez.sigea.docente.dao;

import mx.edu.utez.sigea.docente.model.Docente;
import mx.edu.utez.sigea.docente.model.DocenteMateria;

import java.util.List;

public interface IDocenteDao {


    List<DocenteMateria> obtenerDocenteMateria(int idMat);

}
