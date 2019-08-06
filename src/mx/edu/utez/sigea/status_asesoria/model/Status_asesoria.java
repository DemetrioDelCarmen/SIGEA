package mx.edu.utez.sigea.status_asesoria.model;

public class Status_asesoria {

    private int id_status_asesoria;
    private String status_asesoria;


    public  Status_asesoria(){}

    public Status_asesoria(int id_status_asesoria, String status_asesoria) {
        this.id_status_asesoria = id_status_asesoria;
        this.status_asesoria = status_asesoria;
    }

    public int getId_status_asesoria() {
        return id_status_asesoria;
    }

    public void setId_status_asesoria(int id_status_asesoria) {
        this.id_status_asesoria = id_status_asesoria;
    }

    public String getStatus_asesoria() {
        return status_asesoria;
    }

    public void setStatus_asesoria(String status_asesoria) {
        this.status_asesoria = status_asesoria;
    }

    @Override
    public String toString() {
        return "Status_asesoria{" +
                "id_status_asesoria=" + id_status_asesoria +
                ", status_asesoria='" + status_asesoria + '\'' +
                '}';
    }
}
