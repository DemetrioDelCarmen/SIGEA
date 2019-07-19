package mx.edu.utez.sigea.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public Connection obtenerConexion (){
        String cadenaConexion =  "jdbc:mysql://localhost:3306/sigea?user=root&password=pupi123$root" +
                "&serverTimezone=America/Mexico_City&useSSL=false&allowPublicKeyRetrieval=true";



        try{
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            return DriverManager.getConnection(cadenaConexion);
        } catch (SQLException ex) {
            System.out.println(this.getClass().getCanonicalName() + "@" + ex.getMessage());

        }
        return null;
    }

    /*public static void main(String[] args) {
        Connection conexion = new Conexion().obtenerConexion();
            if(conexion==null){
                System.out.println("Algo pasó");
            }else{
                System.out.println("Conectado");
        }
    }*/

}
