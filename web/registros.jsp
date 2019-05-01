<%-- 
    Document   : jsp
    Created on : 20/03/2019, 03:13:06 PM
    Author     : usuario1
--%>

<%@page import="Conexiones.Consultas"%>
<%@page import="Entidades.Guia"%>
<%@page import="Entidades.Turista"%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%
    if (request.getMethod() == "POST") {
        Consultas con = new Consultas();
        if (request.getParameter("info_Guia") != null) {
            Guia guia = new Guia();
            String [] info = request.getParameter("info_Guia").split(";");
            guia.setNombre(info[0]);
            guia.setApellidoP(info[1]);
            guia.setApellidoM(info[2]);
            guia.setCURP(info[3]);
            guia.setRFC(info[4]);
            guia.setTelefono(info[5]);
            guia.setDir(info[6]);
            guia.setCorreo(info[7]);
            guia.setPassword(info[8]);
            String msj =con.registrarGuia(guia);
            
                response.getWriter().write(msj);
            
        } else {
            Turista turista = new Turista();
            String [] info = request.getParameter("info_Turista").split(",");
            turista.setNombre(info[0]);
            turista.setApellidoP(info[1]);
            turista.setApellidoM(info[2]);
            turista.setCorreo(info[3]);
            turista.setPassword(info[4]);
            String msj=con.registrarTurista(turista);
            response.getWriter().write(msj);
        } 
    }else {
            response.sendRedirect("index.jsp");
    }
%>