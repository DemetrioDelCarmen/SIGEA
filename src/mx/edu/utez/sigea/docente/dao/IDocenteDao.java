package mx.edu.utez.sigea.docente.dao;

import mx.edu.utez.sigea.docente.model.Docente;

import java.util.List;

public interface IDocenteDao {


    List<Docente> obtenerDocenteMateria(int idMat);

}
