package mx.edu.utez.sigea.estudiante.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.estudiante.model.EstudianteMatricula;

public interface IEstudianteDao {

            Estudiante obtenerEstudiante(Estudiante estudiante);

            EstudianteMatricula recuperarEstudianteByMatricula(String matricula);
}



