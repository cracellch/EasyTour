/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import Entidades.Guia;
import Entidades.Turista;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import static org.apache.commons.codec.binary.Base64.decodeBase64;
import static org.apache.commons.codec.binary.Base64.encodeBase64;

public class Cifrado {
        private final static String alg = "AES";
        private final static String cI = "AES/CBC/PKCS5Padding";
        private final static String key = "MSJCYEBFOPVESHFZ"; // llave ovi :p
        private final static String iv = "0123456789ABCDEF"; // vector de inicialización
    
    public static String decrypt(String textoACifrar) throws Exception {
        Cipher cipher = Cipher.getInstance(cI);
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), alg);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
        byte[] enc = decodeBase64(textoACifrar);
        cipher.init(Cipher.DECRYPT_MODE, skeySpec, ivParameterSpec);
        byte[] decrypted = cipher.doFinal(enc);
        return new String(decrypted);
    }

    // esto depende de si conservamos el inicio o lo medificamos
    public static String encrypt(String textoADescifrar) throws Exception {
        Cipher cipher = Cipher.getInstance(cI);
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), alg);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, ivParameterSpec);
        byte[] encrypted = cipher.doFinal(textoADescifrar.getBytes());
        return new String(encodeBase64(encrypted));
    }
    
    
    public Guia cifGuia(Guia guia) {
        try {
            guia.setNombre(encrypt(guia.getNombre()));
            System.out.println("pr cif 1");
            guia.setApellidoP(encrypt(guia.getApellidoP()));
            System.out.println("pr cif 2");
            guia.setApellidoM(encrypt(guia.getApellidoM()));
            System.out.println("pr cif 3");
            guia.setCURP(encrypt(guia.getCURP()));
            System.out.println("pr cif 4");
            guia.setDir(encrypt(guia.getDir()));
            System.out.println("pr cif 5");
            guia.setRFC(encrypt(guia.getRFC()));
            System.out.println("pr cif 6");
            guia.setPassword(encrypt(guia.getPassword()));
            
        } catch (Exception e) {
            System.err.println("error al cifrar: "+ e.toString());
            System.err.println("error al cifrar: "+ e.getMessage());
        }        
        return guia;
    }
    
    public Turista cifTurista(Turista turista) {
        try {
            turista.setNombre(encrypt(turista.getNombre()));
            turista.setApellidoP(encrypt(turista.getApellidoP()));
            turista.setApellidoM(encrypt(turista.getApellidoM()));
            turista.setPassword(encrypt(turista.getPassword()));
            
        } catch (Exception e) {
            System.err.println("error al cifrar: "+ e.toString());
        }        
        return turista;
    }
    
    public Guia decGuia(Guia guia) {
        try {
            guia.setNombre(decrypt(guia.getNombre()));
            System.out.println("pr dec 1");
            guia.setApellidoP(decrypt(guia.getApellidoP()));
            System.out.println("pr dec 2");
            guia.setApellidoM(decrypt(guia.getApellidoM()));
            System.out.println("pr dec 3");
            guia.setCURP(decrypt(guia.getCURP()));
            System.out.println("pr dec 4");
            guia.setDir(decrypt(guia.getDir()));
            System.out.println("pr dec 5");
            guia.setRFC(decrypt(guia.getRFC()));
            System.out.println("pr dec 6");
        } catch (Exception e) {
            System.err.println("error al cifrar: "+ e.toString());
            System.err.println("error al cifrar: "+ e.getMessage());
        }        
        return guia;
    }
    
    public Turista decTurista(Turista turista) {
        try {
            turista.setNombre(decrypt(turista.getNombre()));
            turista.setApellidoP(decrypt(turista.getApellidoP()));
            turista.setApellidoM(decrypt(turista.getApellidoM()));
            turista.setPassword(decrypt(turista.getPassword()));
            
        } catch (Exception e) {
            System.err.println("error al cifrar: "+ e.toString());
        }        
        return turista;
    }
    
    public String eCadena (String cadena){
        try {
            System.out.println("Cif pas: "+cadena);
            cadena = encrypt(cadena);
            System.out.println(cadena);
        } catch (Exception e) {
            System.err.println("error al cifrar: "+ e.toString());
        }
        return cadena;
    }
    public String dCadena (String cadena){
        try {
            System.out.println("Cif pas: "+cadena);
            cadena = decrypt(cadena);
            System.out.println(cadena);
        } catch (Exception e) {
            System.err.println("error al cifrar: "+ e.toString());
        }
        return cadena;
    }
}