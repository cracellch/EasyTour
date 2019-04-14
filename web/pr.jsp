<%-- 
    Document   : pr
    Created on : 8/04/2019, 04:35:09 PM
    Author     : usuario1
--%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="Entidades.Lugar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("tipo").equals("turista") && request.getParameter("ubicacion") != null && request.getMethod() == "POST") {
        response.setContentType("text/html");
        
        Consultas con = new Consultas();
        
        String ubicacion = request.getParameter("ubicacion");
        System.out.println("ub " +ubicacion);
        ArrayList<Lugar> list = con.lugares(ubicacion);
        System.out.println("list "+list);
        Gson gson = new Gson();
        String data = gson.toJson(list);
        //JsonArray jsonArray = new JsonParser().parse(data).getAsJsonArray();  Para volver a JSON
        //System.out.println("ja "+jsonArray);
        System.out.println("data "+data);
//        Guia g= con.asigGuia(date);
        //String reg = con.asigGuia(date);
        //System.out.println(reg);
        //out.println(reg);
        //Gson gson = new Gson();
//        String json = gson.toJson(g);
          response.getWriter().write(data);
    }
%>