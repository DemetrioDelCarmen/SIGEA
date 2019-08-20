package mx.edu.utez.sigea.estudiante.model;

public class EstudianteMatricula {


    private int idEstudiante,idCarrera,idGenero, idGrupo;
    private  String nombre, matricula;


    public EstudianteMatricula(){}

    public EstudianteMatricula(int idEstudiante, int idCarrera, int idGenero, int idGrupo, String nombre, String matricula) {
        this.idEstudiante = idEstudiante;
        this.idCarrera = idCarrera;
        this.idGenero = idGenero;
        this.idGrupo = idGrupo;
        this.nombre = nombre;
        this.matricula = matricula;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
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

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }


    @Override
    public String toString() {
        return "EstudianteMatricula{" +
                "idEstudiante=" + idEstudiante +
                ", idCarrera=" + idCarrera +
                ", idGenero=" + idGenero +
                ", idGrupo=" + idGrupo +
                ", nombre='" + nombre + '\'' +
                ", matricula='" + matricula + '\'' +
                '}';
    }
}
