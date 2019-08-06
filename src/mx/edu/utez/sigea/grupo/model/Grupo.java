package mx.edu.utez.sigea.grupo.model;

public class Grupo {
    private int id_grupo;
    private int periodo_id_periodo;
    private String  nombre_grupo;

    public Grupo (){}

    public Grupo(int id_grupo, int periodo_id_periodo, String nombre_grupo) {
        this.id_grupo = id_grupo;
        this.periodo_id_periodo = periodo_id_periodo;
        this.nombre_grupo = nombre_grupo;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public int getPeriodo_id_periodo() {
        return periodo_id_periodo;
    }

    public void setPeriodo_id_periodo(int periodo_id_periodo) {
        this.periodo_id_periodo = periodo_id_periodo;
    }

    public String getNombre_grupo() {
        return nombre_grupo;
    }

    public void setNombre_grupo(String nombre_grupo) {
        this.nombre_grupo = nombre_grupo;
    }

    @Override
    public String toString() {
        return "Grupo{" +
                "id_grupo=" + id_grupo +
                ", periodo_id_periodo=" + periodo_id_periodo +
                ", nombre_grupo='" + nombre_grupo + '\'' +
                '}';
    }
}
