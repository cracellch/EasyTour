<%-- 
    Document   : apiLogin
    Created on : 12/05/2019, 09:34:42 PM
    Author     : usuario1
--%>
<%@page import="Conexiones.ConApi"%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

    String correo = request.getParameter("correoI");
    String contrase�a = request.getParameter("passwordI");
    try {
        ConApi con= new ConApi();
        String ret = con.Login(correo,contrase�a);
        response.getWriter().write(ret);
    } catch (Exception e){
        System.out.println(e.toString());
        response.getWriter().write("Error");
    }
   
%>