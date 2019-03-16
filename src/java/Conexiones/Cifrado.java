/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import java.security.*;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.*;

public class Cifrado {
    private static final String Algo = "AES";
    private static final byte[] keyValue = new byte [] {'J','a','i','m','e','M','i',
    'n','o','r','G','o','m','e','z','1',};
    
    public static String cifrado(String Data) throws Exception{
        Key key = generateKey(keyValue); 
        // Este es para las subllaves del AES
        Cipher c = Cipher.getInstance(Algo);
        c.init(Cipher.ENCRYPT_MODE, key);
        //Aqui paso las subllaves para cifrar
        byte[] cifrarvalores = c.doFinal(Data.getBytes());
        /*La libreria Sun me sirve para poder codificar los bloques del cifrado en base 
        64*/
        String CifradoValor = new BASE64Encoder().encode(cifrarvalores);
        return CifradoValor;
    }
    
    public static String descifrado(String cifrado) throws Exception{
        Key key = generateKey(keyValue); 
        // Este es para las subllaves del AES
        Cipher c = Cipher.getInstance(Algo);
        c.init(Cipher.DECRYPT_MODE, key);
        //Aqui paso las subllaves para descifrar
        /*La libreria Sun me sirve para poder decodificar los bloques del DEScifrado en base 
        64*/
        
        byte[] decoficadorvalores = new BASE64Decoder().decodeBuffer(cifrado);
        byte[] descifradorValor = c.doFinal(decoficadorvalores);
        
        String descifrado = new String(descifradorValor);
        return descifrado;
    }
      
    private static Key generateKey(byte [] ll) throws Exception {
        Key key = new SecretKeySpec(ll, Algo);
        return key;
    }
}