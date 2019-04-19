

<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Mark"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Conexiones.Consultas"%>
<%
    Consultas con = new Consultas();
    Gson gson = new Gson();
    String res;
    ArrayList<Mark> arr= con.gmarks();
    res= gson.toJson(arr);
    System.out.println(res);
%>