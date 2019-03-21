<%-- 
    Document   : jsp
    Created on : 20/03/2019, 03:13:06 PM
    Author     : usuario1
--%>

<%@page import="Conexiones.Consultas"%>
<%@page import="Entidades.Guia"%>
<%@page import="Entidades.Turista"%>
<%
    if (request.getMethod() == "POST") {
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
    }else {
            response.sendRedirect("index.jsp");
    }
%>