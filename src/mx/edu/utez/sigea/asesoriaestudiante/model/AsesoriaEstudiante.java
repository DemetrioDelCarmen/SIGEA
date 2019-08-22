package mx.edu.utez.sigea.asesoriaestudiante.model;

public class AsesoriaEstudiante {

    String materia, dia, hora,nombreDocente,comentario,estado,participantes;
    public AsesoriaEstudiante(){}

    public AsesoriaEstudiante(String materia, String dia, String hora, String nombreDocente, String comentario, String estado, String participantes) {
        this.materia = materia;
        this.dia = dia;
        this.hora = hora;
        this.nombreDocente = nombreDocente;
        this.comentario = comentario;
        this.estado = estado;
        this.participantes = participantes;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getParticipantes() {
        return participantes;
    }

    public void setParticipantes(String participantes) {
        this.participantes = participantes;
    }

    @Override
    public String toString() {
        return "AsesoriaEstudiante{" +
                "materia='" + materia + '\'' +
                ", dia='" + dia + '\'' +
                ", hora='" + hora + '\'' +
                ", nombreDocente='" + nombreDocente + '\'' +
                ", comentario='" + comentario + '\'' +
                ", estado='" + estado + '\'' +
                ", participantes='" + participantes + '\'' +
                '}';
    }
}
