/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author usuario1
 */
public class ConApi extends Conexion{
     public ConApi (){
        super();
    }
    private Cifrado cipher = new Cifrado();
    public String Login (String correo, String contraseña){
        String ret = "Ha ocurrido un error";
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
            String exp="select nom_usu, app_usu, apm_usu,cor_usu,nom_tpu from usuario natural join tipousuario where cor_usu ='"+
                    correo+"' and pas_usu='"+contraseña+"'";
            try {
                pst = con.prepareStatement(exp);
                rs = pst.executeQuery();
                while (rs.next()) {                    
                    ret = rs.getString(1);
                    ret += ","+cipher.dCadena(rs.getString(2));
                    ret += ","+cipher.dCadena(rs.getString(3));
                    ret += ","+cipher.dCadena(rs.getString(4));
                    ret += ","+cipher.dCadena(rs.getString(5));
                }
                System.out.println("ret: "+ret);
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
        return ret;
    }
}
