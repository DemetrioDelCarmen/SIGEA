package mx.edu.utez.sigea.usuario.model;

public class Usuario {
    private int id_User;
    private String usuario;
    private String contrasena;
    private int rol_id_rol;

    public Usuario() {
    }


    public Usuario(int id_User, String usuario, String contrasena, int rol_id_rol) {
        this.id_User = id_User;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.rol_id_rol = rol_id_rol;
    }


    public int getId_User() {
        return id_User;
    }

    public void setId_User(int id_User) {
        this.id_User = id_User;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getRol_id_rol() {
        return rol_id_rol;
    }

    public void setRol_id_rol(int rol_id_rol) {
        this.rol_id_rol = rol_id_rol;
    }

    @Override
    public String toString() {
        return  "Usuario{"+
                "id_User" +id_User+'\''+
                "usuario"+usuario+'\''+
                "contrasena"+contrasena+
                "rol"+rol_id_rol+'\''+
                "}";

    }
}
