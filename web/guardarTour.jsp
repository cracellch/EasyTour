<%-- 
    Document   : guardarTour
    Created on : 31/03/2019, 02:17:02 PM
    Author     : usuario1
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="Entidades.Tour"%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%
    
    HttpSession sesion = request.getSession();
    
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST"){
        response.setContentType("text/plain");
        Consultas con = new Consultas();
        String ruta;
        Tour tour = new Tour();
        try {
            ruta = request.getParameter("important");
            System.out.println("1"+ruta);
            tour.setDuracion(Integer.parseInt(request.getParameter("tiempo"))); 
            System.out.println("2"+tour.getDuracion());
            tour.setCosto(Integer.parseInt(request.getParameter("costo")));
            System.out.println("3"+tour.getCosto());
            tour.setFecha(request.getParameter("date"));
            System.out.println("4"+tour.getFecha());
            tour.setTurista(Integer.parseInt(sesion.getAttribute("id").toString()));
            System.out.println("5"+tour.getTurista());
            tour.setGuia(Integer.parseInt(request.getParameter("guia").trim()));
            System.out.println("6"+tour.getGuia());
            con.saveTour(ruta, tour);
            out.println("Tour guardado con éxito");
            } catch (Exception e) {
               System.err.println(e.toString());
               out.println("Ha ocurrido un error");
            }
    }
    else{
        response.sendRedirect("logout.jsp");
    }
    /*
    if(sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST"){
        String ruts;
        Tour tour = new Tour();
        //Recupera ids de los lugares
        //Consultas con= new Consultas();
        Enumeration paramaterNames = request.getParameterNames();
        while(paramaterNames.hasMoreElements() ) {
        System.out.println(paramaterNames.nextElement());
        }        
            ruts = request.getParameter("important");
            System.out.println("1"+ruts);
            tour.setDuracion(Integer.parseInt(request.getParameter("tiempo"))); 
            System.out.println("2"+tour.getDuracion());
            tour.setCosto(Integer.parseInt(request.getParameter("costo")));
            System.out.println("3"+tour.getCosto());
            tour.setFecha(request.getParameter("fecha"));
            System.out.println("4"+tour.getFecha());
            tour.setTurista(Integer.parseInt(sesion.getAttribute("id").toString()));
            System.out.println("5"+tour.getTurista());
            tour.setGuia(Integer.parseInt(request.getParameter("guia")));
            System.out.println("6"+tour.getGuia());
        try {
            con.saveTour(ruts, tour); 
       } catch (Exception e) {
           System.err.println(e.toString());
        }
    }
    else{
    response.sendRedirect("logout.jsp");
    }
    */
%>
