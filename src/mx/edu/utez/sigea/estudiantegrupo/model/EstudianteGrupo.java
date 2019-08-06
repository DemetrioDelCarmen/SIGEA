package mx.edu.utez.sigea.estudiantegrupo.model;

public class EstudianteGrupo {


    private int id_estudianteGrupo;
    private int id_estudiante;
    private int grupo_id_grupo;

    public EstudianteGrupo (){}

    public EstudianteGrupo(int id_estudianteGrupo, int id_estudiante, int grupo_id_grupo) {
        this.id_estudianteGrupo = id_estudianteGrupo;
        this.id_estudiante = id_estudiante;
        this.grupo_id_grupo = grupo_id_grupo;
    }

    public int getId_estudianteGrupo() {
        return id_estudianteGrupo;
    }

    public void setId_estudianteGrupo(int id_estudianteGrupo) {
        this.id_estudianteGrupo = id_estudianteGrupo;
    }

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public int getGrupo_id_grupo() {
        return grupo_id_grupo;
    }

    public void setGrupo_id_grupo(int grupo_id_grupo) {
        this.grupo_id_grupo = grupo_id_grupo;
    }

    @Override
    public String toString() {
        return "EstudianteGrupo{" +
                "id_estudianteGrupo=" + id_estudianteGrupo +
                ", id_estudiante=" + id_estudiante +
                ", grupo_id_grupo=" + grupo_id_grupo +
                '}';
    }
}
