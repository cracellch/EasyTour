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
import Entidades.Lugar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
            guia = cipher.cifGuia(guia);
            String exp = "insert into guia values (0,'"+ guia.getNombre() +"','"+ guia.getApellidoP()
                    +"','"+guia.getApellidoM()+"','"+guia.getTelefono()+"','"+guia.getDir()+"','"+guia.getCorreo()
                    +"','"+guia.getEdad()+"','"+guia.getCURP()+"','"+guia.getRFC()+"','"+guia.getPassword()
                    +"',null ,'bloqueado', null)";
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
                    +"', 'activo', null)";
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
    
    public boolean Login (String correo, String contraseña, String tpusu){
        Validaciones  valids = new Validaciones();
        Cifrado cipher = new Cifrado();
        if (valids.validarString(correo) && valids.validarString(contraseña) && valids.validarString(tpusu)){
            PreparedStatement pst = null;
            ResultSet rs = null;
            try {
               contraseña = cipher.encrypt(contraseña);
            } catch (Exception e) {
                System.err.println(e.toString());
            }
            String exp = "select * from "+tpusu+" where cor_"+tpusu.charAt(0)+tpusu.charAt(1)
                    +tpusu.charAt(2)+" = '"+correo+"' and pas_"+tpusu.charAt(0)+tpusu.charAt(1)
                    +tpusu.charAt(2)+" = '"+contraseña+"'";
         
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                if (rs.next()) {
                    return true;
                }
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(rs != null) rs.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
            }
        }
        return false;
    }
    
    public ArrayList<Lugar> lugares (String ubicacion){
        ArrayList<Lugar> lugares = new ArrayList<Lugar>();
        PreparedStatement ps= null;
        ResultSet rs= null;
        try {
           String exp = "select * from lugar where ubi_lug = '"+ubicacion+"'";
            System.out.println("exp: "+exp);
            System.out.println(ubicacion);
            ps= con.prepareStatement(exp);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Lugar l = new Lugar();
                l.setId(Integer.parseInt(rs.getString(1)));
                l.setNombre(rs.getString(2));
                System.out.println(l.getNombre());
                l.setUbicacion(rs.getString(3));
                l.setDescripcion(rs.getString(4));
                l.setImagen(rs.getString(5));
                l.setDuracion(rs.getString(6));
                lugares.add(l);
            }
        } catch (Exception e) {
            System.err.println("error: "+e.toString());
        }
        finally{
                try {
                    if(ps != null) ps.close();
                    if(rs != null) rs.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
        }
        return lugares;
    }
 
    
}
