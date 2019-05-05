<%-- 
    Document   : cambStatusUsu
    Created on : 2/05/2019, 05:48:45 PM
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
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("admin") && request.getMethod() == "POST") {
        if (request.getParameter("idu") == null && request.getParameter("status") == null && request.getParameter("tpu") == null) {
          response.sendRedirect("logout.jsp");
        } else try {
           response.setContentType("text/html");
           Queries q = new Queries();
           int idU = Integer.parseInt(request.getParameter("idu"));
           String status = request.getParameter("status");
           int tpu = Integer.parseInt(request.getParameter("tpu"));
           if (tpu == 1) {
               q.changeStatusTurista(idU, status);
           } else {
               q.changeStatusGuia(idU, status);
           }
           
           response.getWriter().write("cambio realizado");
        } catch (Exception e) {
            System.err.println("error: "+e.toString());                    
            response.getWriter().write("Error");
        }
            
        //out.println(reg);
    }
%>
