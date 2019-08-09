package mx.edu.utez.sigea.docente.model;

import java.time.LocalTime;

public class DocenteAsesoria {

    private String nombreDocente;
    private String Nombre_Mat;
    private int id_Docente;
    private int asesoriasImpartidas;
    private String horario;


    public DocenteAsesoria(){

    }

    public DocenteAsesoria(String nombreDocente, String nombre_Mat, int id_Docente, int asesoriasImpartidas, String horario) {
        this.nombreDocente = nombreDocente;
        Nombre_Mat = nombre_Mat;
        this.id_Docente = id_Docente;
        this.asesoriasImpartidas = asesoriasImpartidas;
        this.horario = horario;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getNombre_Mat() {
        return Nombre_Mat;
    }

    public void setNombre_Mat(String nombre_Mat) {
        Nombre_Mat = nombre_Mat;
    }

    public int getId_Docente() {
        return id_Docente;
    }

    public void setId_Docente(int id_Docente) {
        this.id_Docente = id_Docente;
    }

    public int getAsesoriasImpartidas() {
        return asesoriasImpartidas;
    }

    public void setAsesoriasImpartidas(int asesoriasImpartidas) {
        this.asesoriasImpartidas = asesoriasImpartidas;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    @Override
    public String toString() {
        return "DocenteAsesoria{" +
                "nombreDocente='" + nombreDocente + '\'' +
                ", Nombre_Mat='" + Nombre_Mat + '\'' +
                ", id_Docente=" + id_Docente +
                ", asesoriasImpartidas=" + asesoriasImpartidas +
                ", horario='" + horario + '\'' +
                '}';
    }
}
