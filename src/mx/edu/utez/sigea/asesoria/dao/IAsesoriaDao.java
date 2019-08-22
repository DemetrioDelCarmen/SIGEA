package mx.edu.utez.sigea.asesoria.dao;

public interface IAsesoriaDao {

    boolean registrarAsesoria(int statusAsesoria, int idMateria, int idDocente,
                              String tema, String comentario, int idHoficial,
                              int idGrupo, int asistio, int idEstudiante);



}
