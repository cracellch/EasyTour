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
import Entidades.Tour;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
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
    public String registrarGuia(Guia guia){
        Validaciones valids = new Validaciones();;
        Cifrado cipher= new Cifrado();
        String ret;
        String generatedColumns[] = { "ID" };
        if (valids.validarGuia(guia)) {
            PreparedStatement pst = null;
            ResultSet rs= null;
            int c= 0;
            guia = cipher.cifGuia(guia);
            String exp = "call addUser('"+guia.getNombre()+"','"+guia.getApellidoP()+"','" 
                    + guia.getApellidoM()+"','"+guia.getCorreo()+"','"+guia.getPassword()+"','bloqueado'," 
                    + "2)";
            System.out.println("exp: "+exp);
//            String exp= "insert into usuario values (0,'"+guia.getNombre()+"','"+guia.getApellidoP()+"','"
//                    + guia.getApellidoM()+"','"+guia.getCorreo()+"','"+guia.getPassword()+"','bloqueado',"
//                    + "null,2)";
//            String exp = "insert into guia values (0,'"+ guia.getNombre() +"','"+ guia.getApellidoP()
//                    +"','"+guia.getApellidoM()+"','"+guia.getTelefono()+"','"+guia.getDir()+"','"+guia.getCorreo()
//                    +"','"+guia.getEdad()+"','"+guia.getCURP()+"','"+guia.getRFC()+"','"+guia.getPassword()
//                    +"',null ,'bloqueado', null)";
            try {
                pst = con.prepareStatement(exp, generatedColumns);
                    c = pst.executeUpdate();
                    //System.out.println("cont: "+c);
                    System.out.println("usuario registrado");
                    rs= pst.getGeneratedKeys();
                    //System.out.println("c"+c);
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        System.out.println("Inserted ID -" + id); // muestra el ID insertado
                        pst= null;
                        exp = "insert into guia values (0,'"+guia.getTelefono()+"','"+guia.getDir()+"','"
                                +guia.getEdad()+"','"+guia.getCURP()+"','"+guia.getRFC()+"',"
                                +"null,"+id+")";
                        c= pst.executeUpdate(exp);
                        System.out.println("guia registrado");
                        ret="guia registrado";
                    } else{
                        ret="Ya existe un registro con este correo";
                    }
            } catch (Exception e) {
                System.err.println("error: "+ e.getCause());
                return "Algo salió mal";
            }
            finally {
                try {
                    if(pst != null) pst.close();
                    if(rs != null) rs.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.getCause());
                }
            }
        } else {
            return "Datos inválidos";
        }
        return ret;
    }
    
    //Boolean por si no se valida bien y así
    public String registrarTurista(Turista turista){
        Validaciones valids = new Validaciones();;
        Cifrado cipher= new Cifrado();
        String ret = "";
        if (valids.validarTurista(turista)) {
            PreparedStatement pst = null;
            int c= 0;
            ResultSet rs=null;
            String generatedColumns[] = { "ID" };
            turista = cipher.cifTurista(turista);
            System.out.println(turista.getCorreo());
//            String exp = "insert into usuario values (0, '"+ turista.getNombre() +"', '"+ turista.getApellidoP()
//                    +"', '"+ turista.getApellidoM() +"', '"+ turista.getCorreo()+"','"+ turista.getPassword() 
//                    +"', 'activo', null, 3)";
            String exp = "call addUser('"+turista.getNombre()+"','"+turista.getApellidoP()+"','" 
                    + turista.getApellidoM()+"','"+turista.getCorreo()+"','"+turista.getPassword()+"','activo'," 
                    + "3)";
            System.out.println("exp: "+exp);
            try {
                pst = con.prepareStatement(exp , generatedColumns);
                    c = pst.executeUpdate();
                    rs=pst.getGeneratedKeys();
                    if (rs.next()) {
                        ret= "turista registrado";
                    } else {
                        ret= "Ya existe un registro con ese correo";
                    }
                    System.out.println("cont: "+c);
                    System.out.println("Turista registrado");
                    
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
                return "Algo salió mal";
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
        } else {
            return "Datos inválidos";
        }
        return ret;
    }
    
    public String [] Login (String correo, String contraseña){
        String [] arr= new String [2];
        Validaciones  valids = new Validaciones();
        Cifrado cipher = new Cifrado();
        if (valids.validarString(correo) && valids.validarString(contraseña)){
            PreparedStatement pst = null;
            ResultSet rs = null;
            try {
               contraseña = cipher.encrypt(contraseña);
            } catch (Exception e) {
                System.err.println(e.toString());
            }
//              String exp = "select * from "+tpusu+" where cor_"+tpusu.charAt(0)+tpusu.charAt(1)
//                    +tpusu.charAt(2)+" = '"+correo+"' and pas_"+tpusu.charAt(0)+tpusu.charAt(1)
//                    +tpusu.charAt(2)+" = '"+contraseña+"'";
            String exp="select id_usu, nom_tpu from usuario natural join tipousuario where cor_usu ='"+
                    correo+"' and pas_usu='"+contraseña+"'";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {                    
                    arr[0] = rs.getString(1);
                    System.out.println("arr1 "+arr[0]);
                    arr[1] = rs.getString(2);
                    System.out.println("arr2 "+arr[1]);
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
        return arr;
    }
    
    public ArrayList<Lugar> lugares (String ubicacion){
        ArrayList<Lugar> lugares = new ArrayList<Lugar>();
        System.out.println("aif");
        if(ubicacion.equals("Zocalo") || ubicacion.equals("Bellas Artes")){
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
                    l.setId(rs.getInt(1));
                    l.setNombre(rs.getString(2));
                    System.out.println(l.getNombre());
                    l.setUbicacion(rs.getString(3));
                    l.setDescripcion(rs.getString(4));
                    l.setImagen(rs.getString(5));
                    l.setDuracion(rs.getString(6));
//                    l.setLat(rs.getInt(7));
//                    l.setLon(rs.getInt(8));
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
        }
        return lugares;
    }

    public Guia asigGuia (String fecha){
        PreparedStatement ps= null;
        ResultSet rs= null;
        Guia g = new Guia();
        try {
            String exp = "select id_gui, nom_usu, app_usu, apm_usu, cor_usu from usuario natural join guia where id_gui NOT IN "
                    + "(select id_gui from tour where fec_tou='" + fecha+"') limit 1";
            
            ps= con.prepareStatement(exp);
            rs = ps.executeQuery();
            while(rs.next()){
                g.setId(rs.getInt(1));
                g.setNombre(rs.getString(2));
                g.setApellidoP(rs.getString(3));
                g.setApellidoM(rs.getString(4));
                g.setCorreo(rs.getString(5));
            }
            //System.out.println("reg: "+reg);
        } catch (Exception e) {
            System.err.println("error: "+e.toString());
        }
        finally {
                try {
                    if(ps != null) ps.close();
                    if(rs != null) rs.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
        }
        return g;
    }
    
    public void saveTour(String ruts, Tour tour){
        PreparedStatement ps= null;
        ResultSet rs= null;
        int c = 0;
        String generatedColumns[] = { "ID" };
        try {
            String exp = "insert into tour values(0,'"+tour.getFecha()+"',"+tour.getCosto()+","+tour.getDuracion()
                    +","+tour.getGuia()+","+tour.getTurista()+")";
            ps= con.prepareStatement(exp, generatedColumns);
            c = ps.executeUpdate();
            rs= ps.getGeneratedKeys();
            //System.out.println("c"+c);
            if (rs.next()) {
                int id = rs.getInt(1);
                System.out.println("Inserted ID -" + id); // muestra el ID insertado
                saveRuta(id, ruts);
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
        
    }
    
    public void saveRuta(int id, String ruts){
        PreparedStatement ps= null;
        ResultSet rs= null;
        int c = 0;
        String [] ids= ruts.split(",");
        try {
            String exp = "insert into ruta values (0,"+ids[0]+","+id+")";
            for (int i = 1; i < ids.length; i++) {
                exp= exp + ", (0,"+ids[i]+","+id+")";
            }
            ps= con.prepareStatement(exp);
            c = ps.executeUpdate();
            
        } catch (Exception e) {
            System.err.println("error: "+e.toString());
        }
        finally{
                try {
                    if(ps != null) ps.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
        }
    }
    
    public String cambDatos (String cor, String pas, int id){
        String ret="";
        String er="Ha ocurrido un error";
        int c;
        PreparedStatement ps = null;
        Cifrado cipher= new Cifrado();
        String exp = null;
        if (cor.equals("")){
            try {
               pas= cipher.encrypt(pas);
            } catch (Exception e) {
               System.err.print(e.toString());
               return er;
            }
            exp = "call updatePass ("+id+",'"+pas+"')";
        } else if (pas.equals("")){
            exp = "call updateCor ("+id+",'"+cor+"')";
        } else{
            try {
               pas= cipher.encrypt(pas);
            } catch (Exception e) {
               System.err.print(e.toString());
               return er;
            }
            exp = "call updateCorPas ("+id+",'"+cor+"','"+pas+"')";
        }
        try {
            ps= con.prepareStatement(exp);
            c = ps.executeUpdate();
            if (c != 0) {
                ret = "Cambio guardado";
            } else {
                ret= "Error. Es posible que el correo ya esté en uso o que la contraseña ingresada sea igual a la actual";
            }
        } catch (Exception e) {
            System.err.println("error: "+e.toString());
            return er;
        }
        finally{
                try {
                    if(ps != null) ps.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
        }
        return ret;
    }
}


