/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import Entidades.Guia;
import Entidades.Lugar;
import Entidades.Mark;
import Entidades.Tour;
import Entidades.Turista;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author usuario1
 */
public class ConsultasTest {
    
    public ConsultasTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of registrarGuia method, of class Consultas.
     */
//    @Test
//    public void testRegistrarGuia() {
//        System.out.println("registrarGuia");
//        Guia guia = new Guia();
//        Consultas instance = new Consultas();
//        String s = "pp";
//        guia.setNombre(s);
//        guia.setApellidoP(s);
//        guia.setApellidoM(s);
//        guia.setCURP(s);
//        guia.setRFC(s);
//        guia.setPassword(s);
//        guia.setDir(s);
//        guia.setTelefono(s);
//        guia.setEdad(20);
//        guia.setCorreo("strem@do.com");
//        
//        String expResult = "Ya existe un registro con ese correo";
//        String result = instance.registrarGuia(guia);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        
//        fail("The test case is a prototype.");
//        
//    }

    /**
     * Test of registrarTurista method, of class Consultas.
     */
//    @Test
//    public void testRegistrarTurista() {
//        System.out.println("registrarTurista");
//        Turista turista = new Turista();
//        Consultas instance = new Consultas();
//        String expResult = "Ya existe un registro con ese correo";
//        System.out.println("1");
//        turista.setNombre("porp");
//        System.out.println("2");
//        turista.setApellidoP("pppp");
//        turista.setApellidoM("pppp");
//        turista.setPassword("pppp");
//        turista.setCorreo("gerar@do.com");
//        String result = instance.registrarTurista(turista);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of Login method, of class Consultas.
     */
//    @Test
//    public void testLogin() {
//        System.out.println("Login");
//        String correo = "";
//        String contraseña = "";
//        Consultas instance = new Consultas();
//        String[] expResult = null;
//        String[] result = instance.Login(correo, contraseña);
//        assertArrayEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of lugares method, of class Consultas.
//     */
//    @Test
//    public void testLugares() {
//        System.out.println("lugares");
//        String ubicacion = "";
//        Consultas instance = new Consultas();
//        ArrayList<Lugar> expResult = null;
//        ArrayList<Lugar> result = instance.lugares(ubicacion);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of asigGuia method, of class Consultas.
//     */
//    @Test
//    public void testAsigGuia() {
//        System.out.println("asigGuia");
//        String fecha = "";
//        Consultas instance = new Consultas();
//        Guia expResult = null;
//        Guia result = instance.asigGuia(fecha);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of saveTour method, of class Consultas.
//     */
//    @Test
//    public void testSaveTour() {
//        System.out.println("saveTour");
//        String ruts = "";
//        Tour tour = null;
//        Consultas instance = new Consultas();
//        instance.saveTour(ruts, tour);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of saveRuta method, of class Consultas.
//     */
//    @Test
//    public void testSaveRuta() {
//        System.out.println("saveRuta");
//        int id = 0;
//        String ruts = "";
//        Consultas instance = new Consultas();
//        instance.saveRuta(id, ruts);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of cambDatos method, of class Consultas.
//     */
    @Test
    public void testCambDatos() {
        System.out.println("cambDatos");
        String cor = "lptm@pr.com";
        String pas = "cc";
        int id = 30;
        String npas = "";
        Consultas instance = new Consultas();
        String expResult = "cambio guardado";
        String result = instance.cambDatos(cor, pas, id, npas);
        if (result.equals(expResult)) {
            System.out.println("Muy bien broda");
        }
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

//    /**S provider o golden providers
//     * Test of gmarks method, of class Consultas.
//     */
//    @Test
//    public void testGmarks() {
//        System.out.println("gmarks");
//        Consultas instance = new Consultas();
//        ArrayList<Mark> expResult = null;
//        ArrayList<Mark> result = instance.gmarks();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    
}
