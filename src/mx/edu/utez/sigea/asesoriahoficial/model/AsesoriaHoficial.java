package mx.edu.utez.sigea.asesoriahoficial.model;

public class AsesoriaHoficial  {

    private int id_asesoriaHOficial;
    private int asesoria_id_asesorias;
    private int HOficial_id_HOficial;


    public AsesoriaHoficial (){}

    public AsesoriaHoficial(int id_asesoriaHOficial, int asesoria_id_asesorias, int HOficial_id_HOficial) {
        this.id_asesoriaHOficial = id_asesoriaHOficial;
        this.asesoria_id_asesorias = asesoria_id_asesorias;
        this.HOficial_id_HOficial = HOficial_id_HOficial;
    }

    public int getId_asesoriaHOficial() {
        return id_asesoriaHOficial;
    }

    public void setId_asesoriaHOficial(int id_asesoriaHOficial) {
        this.id_asesoriaHOficial = id_asesoriaHOficial;
    }

    public int getAsesoria_id_asesorias() {
        return asesoria_id_asesorias;
    }

    public void setAsesoria_id_asesorias(int asesoria_id_asesorias) {
        this.asesoria_id_asesorias = asesoria_id_asesorias;
    }

    public int getHOficial_id_HOficial() {
        return HOficial_id_HOficial;
    }

    public void setHOficial_id_HOficial(int HOficial_id_HOficial) {
        this.HOficial_id_HOficial = HOficial_id_HOficial;
    }

    @Override
    public String toString() {
        return "AsesoriaHoficial{" +
                "id_asesoriaHOficial=" + id_asesoriaHOficial +
                ", asesoria_id_asesorias=" + asesoria_id_asesorias +
                ", HOficial_id_HOficial=" + HOficial_id_HOficial +
                '}';
    }
}
