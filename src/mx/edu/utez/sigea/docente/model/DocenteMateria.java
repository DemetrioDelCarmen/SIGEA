package mx.edu.utez.sigea.docente.model;

public class DocenteMateria {
    private  int idDocente;
    private  String nombreDocente;
    private String primerApellidoDocente;
    private String segundoApellidoDocente;
    private String nombreMat;

    public DocenteMateria(){}


    public DocenteMateria(int idDocente, String nombreDocente, String primerApellidoDocente, String segundoApellidoDocente, String nombreMat) {
        this.idDocente = idDocente;
        this.nombreDocente = nombreDocente;
        this.primerApellidoDocente = primerApellidoDocente;
        this.segundoApellidoDocente = segundoApellidoDocente;
        this.nombreMat = nombreMat;
    }

    public int getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(int idDocente) {
        this.idDocente = idDocente;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getPrimerApellidoDocente() {
        return primerApellidoDocente;
    }

    public void setPrimerApellidoDocente(String primerApellidoDocente) {
        this.primerApellidoDocente = primerApellidoDocente;
    }

    public String getSegundoApellidoDocente() {
        return segundoApellidoDocente;
    }

    public void setSegundoApellidoDocente(String segundoApellidoDocente) {
        this.segundoApellidoDocente = segundoApellidoDocente;
    }

    public String getNombreMat() {
        return nombreMat;
    }

    public void setNombreMat(String nombreMat) {
        this.nombreMat = nombreMat;
    }

    @Override
    public String toString() {
        return "DocenteMateria{" +
                "idDocente=" + idDocente +
                ", nombreDocente='" + nombreDocente + '\'' +
                ", primerApellidoDocente='" + primerApellidoDocente + '\'' +
                ", segundoApellidoDocente='" + segundoApellidoDocente + '\'' +
                ", nombreMat='" + nombreMat + '\'' +
                '}';
    }

}
