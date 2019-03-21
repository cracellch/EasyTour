<%-- 
    Document   : login
    Created on : 20/03/2019, 03:54:07 PM
    Author     : usuario1
--%>
<%@page session="true"%>
<%@page import="Conexiones.Consultas"%>
<%
    Consultas con= new Consultas();
    String correo = request.getParameter("correoI");
    String contraseña = request.getParameter("passwordI");
    String tipousuario= "turista";
    try {
        if (con.Login(correo, contraseña, tipousuario)) {
            HttpSession sesion = request.getSession(true); //esto es pa las sesiones ue
            sesion.setAttribute("autenticado", true);
            sesion.setAttribute("tipo", tipousuario);
            response.sendRedirect("planearRuta.jsp");                                 //esto redireccona a la pagina de incio
            System.out.println("acceso concedido");
        } else {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e){
        System.out.println(e.toString());
        response.sendRedirect("index.jsp");
    }
   
%>
