<%-- 
    Document   : asigValRuta
    Created on : 7/05/2019, 08:17:54 PM
    Author     : usuario1
--%>

<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page session="true"%>
<%
    
    //response.getWriter().write("Res aplicación");
    HttpSession sesion = request.getSession();
    System.out.println("1");
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST") {
        System.out.println("2");
        if (request.getParameter("ruta").equals(null) || request.getParameter("ruta").equals("")) {
            response.sendRedirect("planearRuta.jsp");
        }
        System.out.println("3");
        try {
                response.setContentType("text/html");
                System.out.println("ruta: "+request.getParameter("ruta"));
                sesion.setAttribute("ruta", request.getParameter("ruta"));
                System.out.println("4");
                response.getWriter().write("Todo bien");
                //out.println(reg);
        } catch (Exception e) {
                System.err.println("error: "+e.toString());
                response.getWriter().write("Error");
        }
        
    }
    else{
        response.sendRedirect("logout.jsp");
    }
%>