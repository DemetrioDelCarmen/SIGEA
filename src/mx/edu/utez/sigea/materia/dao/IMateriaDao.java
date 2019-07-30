package mx.edu.utez.sigea.materia.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.materia.model.Materia;

import java.util.List;

public interface IMateriaDao {

            List<Materia> listarMaterias(Estudiante estudiante);



}
