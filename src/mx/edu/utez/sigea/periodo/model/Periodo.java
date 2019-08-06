package mx.edu.utez.sigea.periodo.model;

public class Periodo {

    private int id_periodo;
    private String nombre_periodo;

    public Periodo(){}

    public Periodo(int id_periodo, String nombre_periodo) {
        this.id_periodo = id_periodo;
        this.nombre_periodo = nombre_periodo;
    }

    public int getId_periodo() {
        return id_periodo;
    }

    public void setId_periodo(int id_periodo) {
        this.id_periodo = id_periodo;
    }

    public String getNombre_periodo() {
        return nombre_periodo;
    }

    public void setNombre_periodo(String nombre_periodo) {
        this.nombre_periodo = nombre_periodo;
    }

    @Override
    public String toString() {
        return "Periodo{" +
                "id_periodo=" + id_periodo +
                ", nombre_periodo='" + nombre_periodo + '\'' +
                '}';
    }
}
