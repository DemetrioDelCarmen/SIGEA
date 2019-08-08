package mx.edu.utez.sigea.dia.model;

public class Dia {

    private int id_dia;
    private  String dia_dia;

    public Dia(){}

    public Dia(int id_dia, String dia_dia) {
        this.id_dia = id_dia;
        this.dia_dia = dia_dia;
    }

    public int getId_dia() {
        return id_dia;
    }

    public void setId_dia(int id_dia) {
        this.id_dia = id_dia;
    }

    public String getDia_dia() {
        return dia_dia;
    }

    public void setDia_dia(String dia_dia) {
        this.dia_dia = dia_dia;
    }

    @Override
    public String toString() {
        return "Dia{" +
                "id_dia=" + id_dia +
                ", dia_dia='" + dia_dia + '\'' +
                '}';
    }
}
