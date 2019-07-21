package mx.edu.utez.sigea.materia.model;

public class Materia {
             private  int idMat;
             private String nombreMateria;
             private int carreraId;


             public Materia(){}

    public Materia(int idMat, String nombreMateria, int carreraId) {
        this.idMat = idMat;
        this.nombreMateria = nombreMateria;
        this.carreraId = carreraId;
    }


    public int getIdMat() {
        return idMat;
    }

    public void setIdMat(int idMat) {
        this.idMat = idMat;
    }

    public String getNombreMateria() {
        return nombreMateria;
    }

    public void setNombreMateria(String nombreMateria) {
        this.nombreMateria = nombreMateria;
    }

    public int getCarreraId() {
        return carreraId;
    }

    public void setCarreraId(int carreraId) {
        this.carreraId = carreraId;
    }

    @Override
    public String toString() {
        return "Materia{" +
                "idMat=" + idMat +
                ", nombreMateria='" + nombreMateria + '\'' +
                ", carreraId=" + carreraId +
                '}';
    }
}
