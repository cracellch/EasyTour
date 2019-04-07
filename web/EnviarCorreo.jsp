<%-- 
    Document   : EnviarCorreo
    Created on : 07-abr-2019, 15:31:08
    Author     : crace
--%>


<%@page import="Conexiones.ControladorCorreo"%>
<%@page import="Entidades.Correo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%
    if (request.getMethod() == "POST") {
       Correo c = new Correo();
        c.setContrasenia("sfutsmugrwvsvonx");
        c.setUsuarioCorreo("maydasaempr@gmail.com");
        c.setAsunto("Prueba Contraseña");
        c.setMensaje("Enviar Mensaje");
        c.setDestino(request.getParameter("correoI"));
        ControladorCorreo co=new ControladorCorreo();
        if(co.enviarCorreo(c)){
            System.out.println("Correo Enviado");
%>
            alert("Correo Enviado con exito");
<%           
        }else{
            System.out.println("Error al enviar el correo");
}
%>          
            alert("Error al enviar correo");
<%
        }
%>