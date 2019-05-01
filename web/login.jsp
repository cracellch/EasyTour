<%-- 
    Document   : login
    Created on : 20/03/2019, 03:54:07 PM
    Author     : usuario1
--%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page session="true"%>
<%@page import="Conexiones.Consultas"%>
<%
    Consultas con= new Consultas();
    String correo = request.getParameter("correoI");
    String contraseņa = request.getParameter("passwordI");
    try {
        String [] arr = con.Login(correo, contraseņa);
        int id = Integer.parseInt(arr[0]);
        String tipousuario = arr[1];
        if (tipousuario.equals("turista") || tipousuario.equals("guia") || tipousuario.equals("admin")) {
            HttpSession sesion = request.getSession(true); //esto es pa las sesiones ue
            sesion.setAttribute("autenticado", true);
            sesion.setAttribute("id", id);
            sesion.setAttribute("tipo", tipousuario);
            
            if(tipousuario.equals("turista")){
                sesion.setAttribute("email", correo);
                response.sendRedirect("planearRuta.jsp");
            } else if(tipousuario.equals("guia")){
                sesion.setAttribute("email", correo);
                //Redireccionar a donde corresponda
                response.sendRedirect("NuevosTour.jsp");
            } else {
                //Redireccionar a donde corresponda
                response.sendRedirect("planearRuta.jsp");
            }
            System.out.println("acceso concedido");
        } else {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e){
        System.out.println(e.toString());
        response.sendRedirect("index.jsp");
    }
   
%>
