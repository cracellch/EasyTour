<%-- 
    Document   : buscarguia
    Created on : 29/03/2019, 02:15:40 AM
    Author     : usuario1
--%>
<%@page session="true"%>
<%
    if (request.getParameter("date") != null && request.getMethod() == "POST") {
        response.setContentType("text/plain");
        String date = request.getParameter("date");
        out.println("Se ha recibido la fecha" + date);
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