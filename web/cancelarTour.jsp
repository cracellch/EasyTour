<%-- 
    Document   : cancelarTour
    Created on : 10/05/2019, 09:47:02 PM
    Author     : usuario1
--%>

<%@page import="Conexiones.Queries"%>
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
    
    //response.getWriter().write("Esta perro");
   HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST") {
        response.setContentType("text/html");
        if (request.getParameter("tour").equals(null) && request.getParameter("tour").equals("")) {
        } else try{
            Queries quer = new Queries();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
            int tour = Integer.parseInt(request.getParameter("tour"));
            String comen = request.getParameter("why");
            String pass = request.getParameter("pass");
            String res = quer.cancelarTour(id,tour, pass, comen);
            response.getWriter().write(res);
        } catch(Exception e){
            System.err.println("error: "+e.toString());
        }
        //out.println(reg);
    }
%>
