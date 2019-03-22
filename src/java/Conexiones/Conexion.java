/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    Connection con;
    
    public Conexion()
        {
        String cadena="jdbc:mysql://localhost:3306/et_bd"; 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(cadena,"root","n0m3l0");
            System.out.println("conex");
        } catch (ClassNotFoundException ex) {
            System.out.println("error en conex");
            System.out.println(ex.getMessage());
            //Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            System.out.println("error en conex 2");
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }    
        }
    public Connection getConexion(){
        return con;
    }   
}
