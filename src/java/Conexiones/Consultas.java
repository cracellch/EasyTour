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
import Entidades.Mark;
import Entidades.Tour;
import java.sql.Array;
import java.sql.CallableStatement;
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
    public String registrarGuia(Guia guia){
        Validaciones valids = new Validaciones();;
        Cifrado cipher= new Cifrado();
        String ret="";

        if (valids.validarGuia(guia)) {
            CallableStatement cl = null;
            ResultSet rs= null;
            int id = 0;
            
            guia = cipher.cifGuia(guia);
//            String exp = "call addUser('"+guia.getNombre()+"','"+guia.getApellidoP()+"','" 
//                    + guia.getApellidoM()+"','"+guia.getCorreo()+"','"+guia.getPassword()+"','bloqueado'," 
//                    + "2)";
//            System.out.println("exp: "+exp);
//            String exp= "insert into usuario values (0,'"+guia.getNombre()+"','"+guia.getApellidoP()+"','"
//                    + guia.getApellidoM()+"','"+guia.getCorreo()+"','"+guia.getPassword()+"','bloqueado',"
//                    + "null,2)";
//            String exp = "insert into guia values (0,'"+ guia.getNombre() +"','"+ guia.getApellidoP()
//                    +"','"+guia.getApellidoM()+"','"+guia.getTelefono()+"','"+guia.getDir()+"','"+guia.getCorreo()
//                    +"','"+guia.getEdad()+"','"+guia.getCURP()+"','"+guia.getRFC()+"','"+guia.getPassword()
//                    +"',null ,'bloqueado', null)";
            try {
                    
                    cl = con.prepareCall("{call addGuia(?,?,?,?,?,?,?,?,?,?)}");
                    cl.setString(1, guia.getNombre());
                    cl.setString(2, guia.getApellidoP());
                    cl.setString(3, guia.getApellidoM());
                    cl.setString(4, guia.getCorreo());
                    cl.setString(5, guia.getPassword());
                    cl.setString(6, guia.getTelefono());
                    cl.setString(7, guia.getDir());
                    cl.setInt(8, guia.getEdad());
                    cl.setString(9, guia.getCURP());
                    cl.setString(10, guia.getRFC());
                    
                    //cl.registerOutParameter(1 , Types.INTEGER);  

                    rs= cl.executeQuery();
                    while (rs.next()){
                        id =rs.getInt(1);
                        System.out.println("id: "+id);
                    }

                    if (id == 1) {
                        ret = "guia registrado";
                        System.out.println("usuario registrado");
                        
                    } else if (id == 2){
                        ret= "Ya existe un registro con ese correo";
                        System.out.println("Ya existe un registro con ese correo");
                    }

                
            } catch (Exception e) {
                System.err.println("error: "+ e.getCause());
                return "Algo salió mal";
            }
            finally {
                try {
                    if(cl != null) cl.close();
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
    
    
    public String registrarTurista(Turista turista){
        Validaciones valids = new Validaciones();;
        Cifrado cipher= new Cifrado();
        System.out.println("tur pas: "+ turista.getPassword());
        String ret = "";
        
        if (valids.validarTurista(turista)) {
            CallableStatement cl = null;
            ResultSet rs= null;
            int c = 0;
            try {
                turista = cipher.cifTurista(turista);
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
                return "Algo salió mal";
            }
            
            System.out.println(turista.getCorreo());
//            String exp = "insert into usuario values (0, '"+ turista.getNombre() +"', '"+ turista.getApellidoP()
//                    +"', '"+ turista.getApellidoM() +"', '"+ turista.getCorreo()+"','"+ turista.getPassword() 
//                    +"', 'activo', null, 3)";
//            String exp = "{call addUser('"+turista.getNombre()+"','"+turista.getApellidoP()+"','" 
//                    + turista.getApellidoM()+"','"+turista.getCorreo()+"','"+turista.getPassword()+"','activo'," 
//                    + "3)}";
//            System.out.println("exp: "+exp);
            try {
                
                cl = con.prepareCall("{call addUser(?,?,?,?,?)}");
                cl.setString(1, turista.getNombre());
                cl.setString(2, turista.getApellidoP());
                cl.setString(3, turista.getApellidoM());
                cl.setString(4, turista.getCorreo());
                cl.setString(5, turista.getPassword());
                //cl.registerOutParameter(1 , Types.INTEGER);  
                
                rs= cl.executeQuery();
                while (rs.next()){
                    c =rs.getInt(1);
                    System.out.println("c: "+c);
                }
                
                if (c == 1 ) {
                    ret= "turista registrado";
                    System.out.println("Turista registrado");
                } else if (c == 2){
                    ret= "Ya existe un registro con ese correo";
                    System.out.println("Ya existe un registro con ese correo");
                }
//                System.out.println("cont: "+ c);
                    
                    
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
                return "Algo salió mal";
            }
            finally{
                try {
                    if(cl != null) cl.close();
                    if(rs != null) rs.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    return "Algo salió mal";
                }
            }
        } else {
            return "Datos inválidos";
        }
        return ret;
    }
    
    public String [] Login (String correo, String contraseña){
        String [] arr= new String [3];
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
            String exp="select id_usu, cor_usu, nom_tpu from usuario natural join tipousuario where cor_usu ='"+
                    correo+"' and pas_usu='"+contraseña+"'";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {                    
                    arr[0] = rs.getString(1);
                    System.out.println("arr1 "+arr[0]);
                    arr[1] = rs.getString(3);
                    System.out.println("arr2 "+arr[1]);
                    arr[2] = rs.getString(2);
                    System.out.println("arr3 "+arr[2]);
                }
                if (arr[1].equals("guia")) {
                    System.out.println("Adentro");
                    //Obtenemos el ID del guía
                    exp="select id_gui from guia natural join usuario where id_usu="+arr[0];
                    pst = con.prepareStatement(exp);
                    rs = pst.executeQuery();
                    while (rs.next()) {                    
                        arr[0] = rs.getString(1);
                    }
                    //Obtenemos sus solicitudes nuevas (el número nada más); porque se ocupa para el front
                    exp="select count(*) from tour where id_gui="+arr[0];
                    pst = con.prepareStatement(exp);
                    rs = pst.executeQuery();
                    while (rs.next()) {                    
                        arr[2] = rs.getString(1);
                    }
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
            int id = 0;
            if (ubicacion.equals("Zocalo")) {
                id=1;
            } else {
                id=2;
            }
            try {
               String exp = "select * from lugar natural join ubicacion where id_ubi = "+id+"";
                System.out.println("exp: "+exp);
                System.out.println(ubicacion);
                ps= con.prepareStatement(exp);
                rs = ps.executeQuery();
                while (rs.next()) {                
                    Lugar l = new Lugar();
                    l.setId(rs.getInt(2));
                    l.setNombre(rs.getString(3));
                    System.out.println(l.getNombre());
                    l.setDescripcion(rs.getString(4));
                    l.setImagen(rs.getString(5));
                    l.setDuracion(rs.getString(6));
                    l.setCosto(Integer.parseInt(rs.getString(7)));
                    l.setUbicacion(rs.getString(10));
                    
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
            String exp = "select id_gui, nom_usu, app_usu, apm_usu, cor_usu from usuario natural join guia where status_usu ='activo' and id_gui NOT IN "
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
                    +","+tour.getGuia()+","+tour.getTurista()+",1)";
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
    
    public String cambDatos (String cor, String pas, int id, String npas){
        String er="Ha ocurrido un error";
        String ret="La contraseña actual no es correcta";
        System.out.println("C pas: "+pas);
        if (verfContraseña(pas, id)) {
            System.out.println("La contraseña actual no es correcta");
            return ret;
        }
        
        int c = 0;
        CallableStatement cl = null;
        
        if (!cor.equals("")){
            ResultSet rs= null;
            try {
               cl = con.prepareCall("{call updateCor(?,?)}");
                        cl.setInt(1, id);
                        cl.setString(2, cor);
                        
                        //cl.registerOutParameter(1 , Types.INTEGER);  

                rs= cl.executeQuery();
                while (rs.next()){
                    c =rs.getInt(1);
                    System.out.println("c: "+c);
                }
                
                if (c == 1 ) {
                    ret= "cambio guardado";
                    System.out.println("cor cambio guardado");
                } else if (c == 2){
                    ret= "Ya existe un registro con ese correo";
                    System.out.println("Ya existe un registro con ese correo");
                }
                        
            } catch (Exception e) {
               System.err.print(e.toString());
               return er;
            } finally{
                try {
                    if(cl != null) cl.close();
                    if(rs != null) rs.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
            }
            
        } else if (!npas.equals("")){
            Cifrado cipher = new Cifrado();
            try {
                npas= cipher.eCadena(npas);
               cl = con.prepareCall("{call updatePass(?,?)}");
                        cl.setInt(1, id);
                        cl.setString(2, npas);
                        
                        //cl.registerOutParameter(1 , Types.INTEGER);  

                cl.executeQuery();
                ret= "cambio guardado";
                System.out.println("psw cambio guardado");
                
                        
            } catch (Exception e) {
               System.err.print(e.toString());
               return er;
            } finally{
                try {
                    if(cl != null) cl.close();
                    
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
            }
            
        }
        
        return ret;
    }
    
    private boolean verfContraseña(String pas, int id){
        boolean flag = true;
        Validaciones valids = new Validaciones();
        Cifrado cipher = new Cifrado();
        if (valids.validarString(pas)){
            PreparedStatement pst = null;
            ResultSet rs = null;
            try {
               pas = cipher.eCadena(pas);
            } catch (Exception e) {
                System.err.println(e.toString());
                return flag;
            }
//              String exp = "select * from "+tpusu+" where cor_"+tpusu.charAt(0)+tpusu.charAt(1)
//                    +tpusu.charAt(2)+" = '"+correo+"' and pas_"+tpusu.charAt(0)+tpusu.charAt(1)
//                    +tpusu.charAt(2)+" = '"+contraseña+"'";
            String exp="select id_usu from usuario where id_usu ='"+
                    id+"' and pas_usu='"+pas+"'";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                if (rs.next()) {
                    flag=false;
                }
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
                return flag;
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(rs != null) rs.close();
                    //if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
            }
        }
        return flag;
    }
    
    public ArrayList<Mark> gmarks (){
       ArrayList<Mark> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select nom_lug,lat_lug,lon_lug from lugar";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Mark mark = new Mark();
                   mark.setName(rs.getString(1));
                   mark.setLat(rs.getString(2));
                   mark.setLon(rs.getString(3));
                   arr.add(mark);
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
            return arr;
    }
    
    
}


