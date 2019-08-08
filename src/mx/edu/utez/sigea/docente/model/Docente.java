package mx.edu.utez.sigea.docente.model;

public class Docente {



            private int id_Docente;
            private  String Nombre_docente;
            private String PrimerApellido_Docente;
            private  String SegundoApellido_Docente;
            private int usuario_id_User;


    public Docente(){}

    public Docente(int id_Docente, String nombre_docente, String primerApellido_Docente, String segundoApellido_Docente, int usuario_id_User) {
        this.id_Docente = id_Docente;
        Nombre_docente = nombre_docente;
        PrimerApellido_Docente = primerApellido_Docente;
        SegundoApellido_Docente = segundoApellido_Docente;
        this.usuario_id_User = usuario_id_User;
    }

    public int getId_Docente() {
        return id_Docente;
    }

    public void setId_Docente(int id_Docente) {
        this.id_Docente = id_Docente;
    }

    public String getNombre_docente() {
        return Nombre_docente;
    }

    public void setNombre_docente(String nombre_docente) {
        Nombre_docente = nombre_docente;
    }

    public String getPrimerApellido_Docente() {
        return PrimerApellido_Docente;
    }

    public void setPrimerApellido_Docente(String primerApellido_Docente) {
        PrimerApellido_Docente = primerApellido_Docente;
    }

    public String getSegundoApellido_Docente() {
        return SegundoApellido_Docente;
    }

    public void setSegundoApellido_Docente(String segundoApellido_Docente) {
        SegundoApellido_Docente = segundoApellido_Docente;
    }

    public int getUsuario_id_User() {
        return usuario_id_User;
    }

    public void setUsuario_id_User(int usuario_id_User) {
        this.usuario_id_User = usuario_id_User;
    }

    @Override
    public String toString() {
        return "Docente{" +
                "id_Docente=" + id_Docente +
                ", Nombre_docente='" + Nombre_docente + '\'' +
                ", PrimerApellido_Docente='" + PrimerApellido_Docente + '\'' +
                ", SegundoApellido_Docente='" + SegundoApellido_Docente + '\'' +
                ", usuario_id_User=" + usuario_id_User +
                '}';
    }
}
