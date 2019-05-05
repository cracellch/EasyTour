<%-- 
    Document   : confirmar
    Created on : 1/05/2019, 01:08:06 AM
    Author     : usuario1
--%>

<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page import="Conexiones.Queries"%>
<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("guia") && request.getMethod() == "POST") {
        if (request.getParameter("idt") == null) {
          response.sendRedirect("logout.jsp");
        } else try {
           response.setContentType("text/html");
           Queries q = new Queries();
           int idT = Integer.parseInt(request.getParameter("idt"));
           q.confirmTour(idT);
           response.getWriter().write("tour confirmado");
        } catch (Exception e) {
            System.err.println("error: "+e.toString());                    
            response.getWriter().write("Error");
        }
            
        //out.println(reg);
    }
%>
