package mx.edu.utez.sigea.asesoriaestudiante.dao;

import mx.edu.utez.sigea.asesoriaestudiante.model.AsesoriaEstudiante;

import java.util.List;

public interface IAsesoriaEstudianteDao {

    List<AsesoriaEstudiante> obtenerAsesoriasRegistradas(String participante);

    String obtenerUsuarioByID(int idEstudiante);
}
