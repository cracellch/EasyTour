<%-- 
    Document   : buscarguia
    Created on : 29/03/2019, 02:15:40 AM
    Author     : usuario1
--%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getParameter("date") != null && request.getMethod() == "POST") {
        response.setContentType("text/plain");
        Consultas con = new Consultas();
        String date = request.getParameter("date");
        String reg = con.asigGuia(date);
        System.out.println(reg);
        out.println(reg);
        
    }
%>

<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
--%>