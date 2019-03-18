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
    //Constriuctor
    Validaciones valids;
    Cifrado cipher;
    public Consultas (){
        super();
        valids= new Validaciones();
        cipher = new Cifrado();
    }
    
    //Boolean por si no se valida bien y así
    public boolean registrarGuia(Guia guia){
        if (valids.validarGuia(guia)) {
            PreparedStatement pst = null;
            int c= 0;
            String exp = "insert into guia values (0, s)";
            guia = cipher.cifGuia(guia);
            try {
                pst = con.prepareStatement(exp);
                    c = pst.executeUpdate();
                    System.out.println("cont: "+c);
                    System.out.println("Guia registrado");
                    return true;
            } catch (Exception e) {
                System.err.println("error: "+ e.getMessage());
            }
            finally{
                try {
                    if(pst != null) pst.close();
                    if(getConexion() != null) getConexion().close();
                    return true;
                } catch (Exception ex) {
                    System.err.println("error: " + ex.getMessage());
                }
            }
        } else {
            return false;
        }
        return false;
    }
    
}
