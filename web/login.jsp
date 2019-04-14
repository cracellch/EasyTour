<%-- 
    Document   : login
    Created on : 20/03/2019, 03:54:07 PM
    Author     : usuario1
--%>
<%@page session="true"%>
<%@page import="Conexiones.Consultas"%>
<%
    Consultas con= new Consultas();
    String correo = request.getParameter("correoI");
    String contraseña = request.getParameter("passwordI");
    try {
        String [] arr = con.Login(correo, contraseña);
        int id = Integer.parseInt(arr[0]);
        String tipousuario = arr[1];
        if (tipousuario.equals("turista") || tipousuario.equals("guia") || tipousuario.equals("admin")) {
            HttpSession sesion = request.getSession(true); //esto es pa las sesiones ue
            sesion.setAttribute("autenticado", true);
            sesion.setAttribute("id", id);
            sesion.setAttribute("tipo", tipousuario);
            if(tipousuario.equals("turista")){
                response.sendRedirect("planearRuta.jsp");
            } else if(tipousuario.equals("guia")){
                //Redireccionar a donde corresponda
                response.sendRedirect("planearRuta.jsp");
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
