/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import Entidades.Guia;
import Entidades.Turista;
import Conexiones.Validaciones;
import Conexiones.Cifrado;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author crace
 */
public class Consultas extends Conexion{
    //Constructor
  
    public Consultas (){
        super();
    }
    
    //Boolean por si no se valida bien y así
    public boolean registrarGuia(Guia guia){
        Validaciones valids = new Validaciones();;
        Cifrado cipher= new Cifrado();
        if (valids.validarGuia(guia)) {
            PreparedStatement pst = null;
            int c= 0;
            String exp = "insert into guia values (0,'"+ guia.getNombre() +"','"+ guia.getApellidoP()
                    +"','"+guia.getApellidoM()+"','"+guia.getTelefono()+"','"+guia.getDir()+"','"+guia.getCorreo()
                    +"','"+guia.getEdad()+"','"+guia.getCURP()+"','"+guia.getRFC()+"','"+guia.getPassword()
                    +"',null ,'bloqueado')";
            guia = cipher.cifGuia(guia);
            try {
                pst = con.prepareStatement(exp);
                    c = pst.executeUpdate();
                    System.out.println("cont: "+c);
                    System.out.println("Guia registrado");
                    
            } catch (Exception e) {
                System.err.println("error: "+ e.getCause());
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(getConexion() != null) getConexion().close();
                    return true;
                } catch (Exception ex) {
                    System.err.println("error: " + ex.getCause());
                }
            }
        } else {
            return false;
        }
        return false;
    }
    
    //Boolean por si no se valida bien y así
    public boolean registrarTurista(Turista turista){
        Validaciones valids = new Validaciones();;
        Cifrado cipher= new Cifrado();
        if (valids.validarTurista(turista)) {
            PreparedStatement pst = null;
            int c= 0;
            turista = cipher.cifTurista(turista);
            System.out.println(turista.getCorreo());
            String exp = "insert into turista values (0, '"+ turista.getNombre() +"', '"+ turista.getApellidoP()
                    +"', '"+ turista.getApellidoM() +"', '"+ turista.getCorreo()+"','"+ turista.getPassword() 
                    +"', 'activo')";
            System.out.println("sout: "+ exp);
            try {
                pst = con.prepareStatement(exp);
                    c = pst.executeUpdate();
                    System.out.println("cont: "+c);
                    System.out.println("Guia registrado");
                    
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(getConexion() != null) getConexion().close();
                    return true;
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    
                }
            }
        } else {
            return false;
        }
        return false;
    }
    
}
