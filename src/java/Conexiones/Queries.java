/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import Entidades.Guia;
import Entidades.Lugar;
import Entidades.Tour;
import Entidades.Turista;
import Entidades.miniGuia;
import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author usuario1
 */
public class Queries extends Conexion{
    public Queries(){
        super();
    }
    
    public void confirmTour(int idT){
        PreparedStatement pst= null;
        int c;
        String exp="update tour set id_stt =2 where id_tou="+idT;
            try {
                pst = con.prepareStatement(exp);
                c=pst.executeUpdate();
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
            }
    }
    
    public void changeStatusTurista(int idU, String status){
        PreparedStatement pst= null;
        int c;
        String nst="";
        if (status.equals("activo")) {
            nst = "bloqueado";
        } else {
            nst = "activo";
        }
        String exp="update usuario set status_usu ='"+ nst +"' where id_usu="+idU;
            try {
                pst = con.prepareStatement(exp);
                c=pst.executeUpdate();
                System.out.println("update bien");
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
            }
    }
    
    public void changeStatusGuia(int idU, String status){
        CallableStatement cl = null;
        int c;
        String nst="";
        if (status.equals("activo")) {
            nst = "bloqueado";
        } else {
            nst = "activo";
        }
        
        try {
            cl = con.prepareCall("{call updateStatusGuia(?,?)}");
                    cl.setInt(1, idU);
                    cl.setString(2, nst);
            cl.executeUpdate();
            System.out.println("update bien");
        } catch (Exception e) {
            System.err.println("error: " + e.getCause());
            System.err.println("error 1: "+ e.toString());
        }
        finally{
            try {
                if(cl != null) cl.close();
                if(getConexion() != null) getConexion().close();
            } catch (Exception ex) {
                System.err.println("error: " + ex.toString());
                System.err.println("error: " + ex.getCause());
                }
        }
    }
    
    public ArrayList<Tour> getNTour(int id){
       ArrayList<Tour> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select id_tou,fec_tou,dur_tou,nom_usu,cor_usu from tour natural join usuario where id_gui="+ id+" and id_stt=1";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Tour t = new Tour();
                   t.setId(rs.getInt(1));
                   t.setFecha(rs.getString(2));
                   t.setDuracion(rs.getInt(3));
                   t.setNomTur(rs.getString(4));
                   t.setCorTur(rs.getString(5));
                   t.setRuta(getRuta(rs.getInt(1)));
                   arr.add(t);
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
    
    public ArrayList<Tour> getTourCon(int id){
       ArrayList<Tour> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select id_tou,fec_tou,dur_tou,nom_usu,cor_usu from tour natural join usuario where id_gui="+ id+" and id_stt=2";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Tour t = new Tour();
                   t.setId(rs.getInt(1));
                   t.setFecha(rs.getString(2));
                   t.setDuracion(rs.getInt(3));
                   t.setNomTur(rs.getString(4));
                   t.setCorTur(rs.getString(5));
                   t.setRuta(getRuta(rs.getInt(1)));
                   arr.add(t);
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
    
    private String getRuta(int idT){
        Gson gson= new Gson();
        String ret="";
        PreparedStatement pst = null;
        ResultSet rs = null;
        String exp="select nom_lug from ruta natural join lugar where id_tou="+idT;
        ArrayList<String> arr= new ArrayList<String>();
        try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   arr.add(rs.getString(1));
                }
                ret= gson.toJson(arr);
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
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
        return ret;
    }
    
    public ArrayList<Tour> getHistorialGuia(int id){
       ArrayList<Tour> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select fec_tou,dur_tou,nom_usu,cor_usu,nom_stt from tour natual join statusTour where id_gui="+ id+" and id_stt=3 or id_stt=4";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Tour t = new Tour();
                   t.setFecha(rs.getString(1));
                   t.setDuracion(rs.getInt(2));
                   t.setNomTur(rs.getString(3));
                   t.setCorTur(rs.getString(4));
                   t.setStatus(rs.getString(5));
                   //t.setRuta(getRuta(rs.getInt(1)));
                   arr.add(t);
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
    
    public ArrayList<Turista> getTuristas(){
        Cifrado cipher = new Cifrado();
       ArrayList<Turista> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select * from usuario where id_tpu=3";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Turista t = new Turista();
                   t.setId(rs.getInt(1));
                   t.setNombre(rs.getString(2));
                   t.setApellidoP(rs.getString(3));
                   t.setApellidoM(rs.getString(4));
                   t.setCorreo(rs.getString(5));
                   t.setStatus(rs.getString(7));
                   //t.setRuta(getRuta(rs.getInt(1)));
                   t=cipher.decTurista(t);
                   arr.add(t);
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
    
    public ArrayList<Guia> getGuias(){
       Cifrado cipher = new Cifrado();
       ArrayList<Guia> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select * from guia natural join usuario where id_usu NOT IN (select id_usu from guia where id_gui=1 and id_gui=2 and id_gui=3 and id_gui=4)";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Guia g = new Guia();
                   g.setId(rs.getInt(2));
                   g.setTelefono(rs.getString(3));
                   g.setDir(rs.getString(4));
                   g.setEdad(rs.getInt(5));
                   g.setCURP(rs.getString(6));
                   g.setRFC(rs.getString(7));
                   g.setCalificacion(rs.getInt(8));
                   g.setNombre(rs.getString(9));
                   g.setApellidoP(rs.getString(10));
                   g.setApellidoM(rs.getString(11));
                   g.setCorreo(rs.getString(12));
                   g.setStatus(rs.getString(14));
                   //t.setRuta(getRuta(rs.getInt(1)));
                   g=cipher.decGuia(g);
                   arr.add(g);
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
    
    public ArrayList<Tour> getTours(int id){
       Cifrado cf = new Cifrado();
       ArrayList<Tour> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select id_tou,fec_tou,dur_tou,nom_usu,app_usu,apm_usu,cor_usu,id_gui from tour natural join usuario where id_stt="+id;
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Tour t = new Tour();
                   String nom, app, apm;
                   t.setId(rs.getInt(1));
                   t.setFecha(rs.getString(2));
                   t.setDuracion(rs.getInt(3));
                   nom = cf.dCadena(rs.getString(4));
                   app = cf.dCadena(rs.getString(5));;
                   apm = cf.dCadena(rs.getString(6));;
                   t.setNomTur(nom+ " "+app+" "+apm);
                   t.setCorTur(rs.getString(7));
                   t.setRuta(getRuta(rs.getInt(1)));
                   t.setG(getGuiaTour(rs.getInt(8)));
                   arr.add(t);
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
    
    public ArrayList<Tour> getToursC(){
       Cifrado cf = new Cifrado();
       ArrayList<Tour> arr= new ArrayList<>();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select id_tou,fec_tou,dur_tou,nom_usu,app_usu,apm_usu,cor_usu,id_gui,com_can from cancelacion natural join tour natural join usuario where id_stt=3";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   Tour t = new Tour();
                   String nom, app, apm;
                   t.setId(rs.getInt(1));
                   t.setFecha(rs.getString(2));
                   t.setDuracion(rs.getInt(3));
                   nom = cf.dCadena(rs.getString(4));
                   app = cf.dCadena(rs.getString(5));;
                   apm = cf.dCadena(rs.getString(6));;
                   t.setNomTur(nom+ " "+app+" "+apm);
                   t.setCorTur(rs.getString(7));
                   t.setRuta(getRuta(rs.getInt(1)));
                   t.setG(getGuiaTour(rs.getInt(8)));
                   t.setComentario(rs.getString(9));
                   arr.add(t);
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
    
    private miniGuia getGuiaTour(int id){
        miniGuia g = new miniGuia();
        Cifrado cipher = new Cifrado();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String exp="select nom_usu,app_usu,apm_usu,cor_usu from guia natural join usuario where id_gui="+id;
        try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   g.setNombre(cipher.dCadena(rs.getString(1)));
                   g.setApellidoP(cipher.dCadena(rs.getString(2)));
                   g.setApellidoM(cipher.dCadena(rs.getString(3)));
                   g.setCorreo(rs.getString(4));
                }
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
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
            return g;
    }
    
    public String [] getDatosRuta(String ruta){
        int costo = 0;
        int duracion = 0;
        String [] datos = new String[4];
        datos [0] = "iniciamos";
        String[] array= ruta.split(":");
        PreparedStatement pst = null;
        ResultSet rs = null;
        String exp="select nom_lug, dur_lug, cos_lug, nom_ubi from lugar natural join ubicacion where id_lug = "+array[0];
        for (int i = 1; i < array.length; i++) {
            exp += " or id_lug= "+array[i];
        }
        System.out.println("exp: "+exp);
        try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   datos[0] += ","+rs.getString(1);
                   duracion += rs.getInt(2);
                   costo += rs.getInt(3);
                   datos[3] = rs.getString(4);
                }
                datos[1] = String.valueOf(duracion);
                datos[2] = String.valueOf(costo);
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
        return datos;
    }
    
    public Tour getDatosTour(int id){
       Tour t = new Tour();
       PreparedStatement pst = null;
            ResultSet rs = null;
            String exp="select id_tou,fec_tou,dur_tou,cos_tou,nom_stt,id_gui from tour natural join statustour where id_usu="+id+" and id_stt = 1 union select id_tou,fec_tou,dur_tou,cos_tou,nom_stt,id_gui from tour natural join statustour where id_usu="+id+" and id_stt = 2";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {
                   t.setId(rs.getInt(1));
                   t.setFecha(rs.getString(2));
                   t.setDuracion(rs.getInt(3));
                   t.setCosto(rs.getInt(4));
                   t.setStatus(rs.getString(5));
                   t.setG(getGuiaTour(rs.getInt(6)));
                }
            } catch (Exception e) {
                System.err.println("error: " + e.getCause());
                System.err.println("error 1: "+ e.toString());
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
            return t;
    }
    
    public ArrayList<Lugar> getLugares (int idTour){
        ArrayList<Lugar> lugares = new ArrayList<Lugar>();
        PreparedStatement ps= null;
        ResultSet rs= null;
        try {
           String exp = "select nom_lug,img_lug,dur_lug,cos_lug,nom_ubi from ruta natural join lugar natural join ubicacion where id_tou="+idTour;
            System.out.println("exp: "+exp);
            ps= con.prepareStatement(exp);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Lugar l = new Lugar();
                //l.setId(rs.getInt(2));
                l.setNombre(rs.getString(1));
                //System.out.println(l.getNombre());
                //l.setDescripcion(rs.getString(4));
                l.setImagen(rs.getString(2));
                l.setDuracion(rs.getString(3));
                l.setCosto(rs.getInt(4));
                l.setUbicacion(rs.getString(5));

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

        return lugares;
    }
    
        public String cancelarTour(int id, int tour, String pass, String comen){
        String ret = "Contraseña incorrecta";
        CallableStatement cl = null;
        Consultas consultas = new Consultas();
        if (consultas.verfContraseña(pass, id)) {
            return ret;
        }
         try {
            cl = con.prepareCall("{call cancelarTour(?,?)}");
                    cl.setInt(1, tour);
                    cl.setString(2, comen);
            cl.executeUpdate();
            ret = "cancelado";
            System.out.println("update bien");
        } catch (Exception e) {
            ret = "Ha ocurrido un error";
            System.err.println("error: "+e.toString());
        }
        finally{
                try {
                    if(cl != null) cl.close();
                    if(getConexion() != null) getConexion().close();
                } catch (Exception ex) {
                    ret = "Ha ocurrido un error";
                    System.err.println("error: " + ex.toString());
                    System.err.println("error: " + ex.getCause());
                    }
        }
        return ret;
    }
    
}