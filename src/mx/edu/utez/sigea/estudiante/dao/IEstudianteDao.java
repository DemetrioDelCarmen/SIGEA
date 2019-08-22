package mx.edu.utez.sigea.estudiante.dao;

import mx.edu.utez.sigea.estudiante.model.Estudiante;
import mx.edu.utez.sigea.estudiante.model.EstudianteMatricula;
import mx.edu.utez.sigea.estudiantegrupo.model.EstudianteGrupo;

public interface IEstudianteDao {

            Estudiante obtenerEstudiante(Estudiante estudiante);

            EstudianteMatricula recuperarEstudianteByMatricula(String matricula);

            EstudianteGrupo obtenerEstudianteById(int idEstudiante);
}



