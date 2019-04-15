<%-- 
    Document   : EnviarCorreo
    Created on : 07-abr-2019, 15:31:08
    Author     : crace
--%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>

<%@page import="Conexiones.ControladorCorreo"%>
<%@page import="Entidades.Correo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%
    SecureRandom random = new SecureRandom();
    String text = new BigInteger(41, random).toString(32);
    
    if (request.getMethod() == "POST") {
       Correo c = new Correo();
        c.setContrasenia("sfutsmugrwvsvonx");
        c.setUsuarioCorreo("maydasaempr@gmail.com");
        c.setAsunto("EASY TOUR Recupera tu contraseña");
        c.setMensaje(text);
        c.setDestino(request.getParameter("correoI"));
        ControladorCorreo co=new ControladorCorreo();
        if(co.enviarCorreo(c)){
            System.out.println("Correo Enviado");
            
%>
            <script>alert("Correo Enviado con exito. Por favor revisa tu correo");</script>
<%          
        }else{
            System.out.println("Error al enviar el correo intentalo de nuevo");
            
%>          
            <script>alert("Error al enviar correo");</script>
<%          
        }
    } 
%>