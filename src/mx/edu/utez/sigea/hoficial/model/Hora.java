package mx.edu.utez.sigea.hoficial.model;

public class Hora {

    private int idHorario;
    private String horaAsesoria;


    public Hora(){}

    public Hora(int idHorario, String horaAsesoria) {
        this.idHorario = idHorario;
        this.horaAsesoria = horaAsesoria;
    }


    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public String getHoraAsesoria() {
        return horaAsesoria;
    }

    public void setHoraAsesoria(String horaAsesoria) {
        this.horaAsesoria = horaAsesoria;
    }

    @Override
    public String toString() {
        return "Hora{" +
                "idHorario=" + idHorario +
                ", horaAsesoria='" + horaAsesoria + '\'' +
                '}';
    }
}
