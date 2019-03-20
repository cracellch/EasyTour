/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Conexiones.Consultas;
import Entidades.Guia;
import Entidades.Turista;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario1
 */
@WebServlet(name = "registros", urlPatterns = {"/registros"})
public class registros extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Consultas con = new Consultas();
        if (request.getParameter("Nombre_Guia") != null) {
            Guia guia = new Guia();
            guia.setNombre(request.getParameter("Nombre_Guia"));
            guia.setApellidoP(request.getParameter("ApellidoP"));
            guia.setApellidoM(request.getParameter("ApellidoM"));
            guia.setCURP(request.getParameter("CURP"));
            guia.setCorreo(request.getParameter("Correo_Guia"));
            guia.setPassword(request.getParameter("Password"));
            guia.setRFC(request.getParameter("RFC"));
            guia.setTelefono(Integer.parseInt(request.getParameter("Telefono_Guia")));
            guia.setDir(request.getParameter("Direccion_Guia"));
            if (con.registrarGuia(guia)) {
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("error");
                //response.sendRedirect("index.jsp");
            }
        } else {
            Turista turista = new Turista();
            turista.setNombre(request.getParameter("Nombre_Turista"));
            turista.setApellidoP(request.getParameter("ApellidoP_Turista"));
            turista.setApellidoM(request.getParameter("ApellidoM_Turista"));
            turista.setCorreo(request.getParameter("Correo_Turista"));
            turista.setPassword(request.getParameter("PSW_Confirmacion"));
            if (con.registrarTurista(turista)) {
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("error");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
