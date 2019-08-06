package mx.edu.utez.sigea.estudiante.model;

public class Estudiante {

    private int id_estudiante;
    private String nombre_estudiante;
    private String primerApellido_estudiante;
    private String segundoApellido_estudiante;
    private int division_id_division;
    private int usuario_id_User;
    private int idCarrera;
    private int idGenero;


    public Estudiante (){}

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public String getNombre_estudiante() {
        return nombre_estudiante;
    }

    public void setNombre_estudiante(String nombre_estudiante) {
        this.nombre_estudiante = nombre_estudiante;
    }

    public String getPrimerApellido_estudiante() {
        return primerApellido_estudiante;
    }

    public void setPrimerApellido_estudiante(String primerApellido_estudiante) {
        this.primerApellido_estudiante = primerApellido_estudiante;
    }

    public String getSegundoApellido_estudiante() {
        return segundoApellido_estudiante;
    }

    public void setSegundoApellido_estudiante(String segundoApellido_estudiante) {
        this.segundoApellido_estudiante = segundoApellido_estudiante;
    }

    public int getDivision_id_division() {
        return division_id_division;
    }

    public void setDivision_id_division(int division_id_division) {
        this.division_id_division = division_id_division;
    }

    public int getUsuario_id_User() {
        return usuario_id_User;
    }

    public void setUsuario_id_User(int usuario_id_User) {
        this.usuario_id_User = usuario_id_User;
    }

    public int getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(int idCarrera) {
        this.idCarrera = idCarrera;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }


    @Override
    public String toString() {
        return "Estudiante{" +
                "id_estudiante=" + id_estudiante +
                ", nombre_estudiante='" + nombre_estudiante + '\'' +
                ", primerApellido_estudiante='" + primerApellido_estudiante + '\'' +
                ", segundoApellido_estudiante='" + segundoApellido_estudiante + '\'' +
                ", division_id_division=" + division_id_division +
                ", usuario_id_User=" + usuario_id_User +
                ", idCarrera=" + idCarrera +
                ", idGenero=" + idGenero +
                '}';
    }
}
