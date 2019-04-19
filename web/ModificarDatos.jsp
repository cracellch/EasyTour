<%-- 
    Document   : Modificar cuenta
    Created on : 14/04/2019, 09:20:14 PM
    Author     : usuario1
--%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("tipo").equals("turista") && request.getParameter("ncorreo") != null 
            && request.getMethod() == "POST" && request.getParameter("npass") != null && request.getParameter("pass") != null) {
        response.setContentType("text/html");
        Consultas con = new Consultas();
        int id = Integer.parseInt(sesion.getAttribute("id").toString());
        String correo = request.getParameter("ncorreo");
        String npass = request.getParameter("npass");
        String pass = request.getParameter("pass");
        String res= con.cambDatos(correo, pass, id , npass);
        response.getWriter().write(res);
    }
%>