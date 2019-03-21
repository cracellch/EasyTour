<%-- 
    Document   : planearRuta
    Created on : 20/03/2019, 11:52:37 PM
    Author     : usuario1
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista")) {
        
    %>

    <a href="logout.jsp">cerrar sesión</a>
    
    <%        
        } else {
            response.sendRedirect("index.jsp");
        }
    
    %>
    </body>
</html>
