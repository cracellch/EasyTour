<%--
    Document   : Modificar cuenta
    Created on : 14/04/2019, 09:20:14 PM
    Author     : usuario1
--%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST") {
        response.setContentType("text/html");
        Consultas con = new Consultas();
        String res="";
        int id = Integer.parseInt(sesion.getAttribute("id").toString());
        if (request.getParameter("npass") != null) {
            String npass = request.getParameter("npass");
            System.out.println(npass);
            String pass = request.getParameter("pass");
            System.out.println(pass);
            res = con.cambDatos("", pass, id , npass);
        } else if (request.getParameter("ncorreo") != null){
            String correo = request.getParameter("ncorreo");
            System.out.println(correo);
            String pass = request.getParameter("pass");
            System.out.println(pass);
            res= con.cambDatos(correo, pass, id , "");
        }

        response.getWriter().write(res);

    }
    else{
        response.sendRedirect("logout.jsp");
    }
%>
