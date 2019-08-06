package mx.edu.utez.sigea.docentes_materias.model;

public class DocentesMaterias {

    private int id_docente_materia;
    private int id_docente;
    private int id_Mat;

    public DocentesMaterias(){}


    public DocentesMaterias(int id_docente_materia, int id_docente, int id_Mat) {
        this.id_docente_materia = id_docente_materia;
        this.id_docente = id_docente;
        this.id_Mat = id_Mat;
    }

    public int getId_docente_materia() {
        return id_docente_materia;
    }

    public void setId_docente_materia(int id_docente_materia) {
        this.id_docente_materia = id_docente_materia;
    }

    public int getId_docente() {
        return id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public int getId_Mat() {
        return id_Mat;
    }

    public void setId_Mat(int id_Mat) {
        this.id_Mat = id_Mat;
    }

    @Override
    public String toString() {
        return "DocentesMaterias{" +
                "id_docente_materia=" + id_docente_materia +
                ", id_docente=" + id_docente +
                ", id_Mat=" + id_Mat +
                '}';
    }
}
