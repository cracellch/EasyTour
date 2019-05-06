<%-- 
    Document   : buscarguia
    Created on : 29/03/2019, 02:15:40 AM
    Author     : usuario1
--%>

<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Entidades.miniGuia"%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getParameter("date") != null && request.getMethod() == "POST") {
        response.setContentType("text/html");
        Consultas con = new Consultas();
        String date = request.getParameter("date");
        miniGuia g = con.asigGuia(date);
        Gson gson = new Gson();
        String data = gson.toJson(g);
        System.out.println("data: "+data);
        response.getWriter().write(data);
        //out.println(reg);
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