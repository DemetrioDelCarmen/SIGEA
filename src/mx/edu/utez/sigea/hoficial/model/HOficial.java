package mx.edu.utez.sigea.hoficial.model;

import java.time.LocalTime;

public class HOficial {

    private int id_HOficial;
    private int docente_id_docente;
    private int dia_id_dia;
    private LocalTime horaInicio;
    private LocalTime horaFin;

    public HOficial () {}

    public HOficial(int id_HOficial, int docente_id_docente, int dia_id_dia, LocalTime horaInicio, LocalTime horaFin) {
        this.id_HOficial = id_HOficial;
        this.docente_id_docente = docente_id_docente;
        this.dia_id_dia = dia_id_dia;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public int getId_HOficial() {
        return id_HOficial;
    }

    public void setId_HOficial(int id_HOficial) {
        this.id_HOficial = id_HOficial;
    }

    public int getDocente_id_docente() {
        return docente_id_docente;
    }

    public void setDocente_id_docente(int docente_id_docente) {
        this.docente_id_docente = docente_id_docente;
    }

    public int getDia_id_dia() {
        return dia_id_dia;
    }

    public void setDia_id_dia(int dia_id_dia) {
        this.dia_id_dia = dia_id_dia;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }


    @Override
    public String toString() {
        return "HOficial{" +
                "id_HOficial=" + id_HOficial +
                ", docente_id_docente=" + docente_id_docente +
                ", dia_id_dia=" + dia_id_dia +
                ", horaInicio=" + horaInicio +
                ", horaFin=" + horaFin +
                '}';
    }
}
