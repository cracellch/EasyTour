<%-- 
    Document   : tourConfirmados
    Created on : 2/05/2019, 11:31:42 AM
    Author     : usuario1
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Tour"%>
<%@page import="Conexiones.Queries"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("guia") && request.getMethod() == "GET") {
        try{
            String correo = sesion.getAttribute("email").toString();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
            int nt = Integer.parseInt(sesion.getAttribute("nt").toString());
            Queries queries = new Queries();
            Gson gson= new Gson();
            ArrayList<Tour> array = queries.getTourCon(id);
        
%>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Nuevos Tour</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/nuevosTour.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  </head>
  <body>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li><div class="divider"><div class="divider"><div class="divider"></div></li>
          <li><a href="nuevosTour.jsp"><i class="material-icons left">room</i>Nuevos Tour<span class="new badge orange"><%= nt%></span></a></li>
          <li class="active"><a href="#.jsp"><i class="material-icons left">mode_edit</i>Tour Confirmados</a></li>
          <li><a href="HistorialTour.jsp"><i class="material-icons left">mode_edit</i>Historial</a></li>
          <li><a class="dropdown-trigger" href="#!" data-target="uldrop"><i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>

        <ul id="slide-out" class="sidenav">
           <li><div class="user-view">
             <div class="background">
            </div>
             <a href="#"><img class="circle" src="RESOURCE/iconos/account.png"></a>
             <a href="#"><span class="email" id="spemail"><%= correo%></span></a>
           </div>
           </li>
           <li><div class="divider"><div class="divider"><div class="divider"></div></div></div></li>
           <li><a href="nuevosTour.jsp" id="wa"><i class="material-icons left orange-text">room</i>Nuevos Tour<span class="new badge orange"><%= nt%></span></a></li>
           <li class="active"><a href="#" id="wa"><i class="material-icons left orange-text">mode_edit</i>Tour Confirmados</a></li>
           <li><a href="HistorialTour.jsp" id="wa"><i class="material-icons left orange-text">mode_edit</i>Historial</a></li>
           

           <li><div class="divider"><div class="divider"><div class="divider"></div></div></div></li>
           <li><a href="logout.jsp" id="wa"><i class="material-icons left orange-text">exit_to_app</i>Salir</a></li>
         </ul>
        <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      </div>
    </nav>

    <ul id="uldrop" class="dropdown-content">
      <li id="liOfUlDrop"><a href="#" class="right"><i class="material-icons left orange-text">arrow_drop_up</i></a></li>
      <li class="divider" id="liOfUlDrop"></li>
      <li id="liOfUlDrop"><a href="#" id="wa"><i class="material-icons left orange-text" >account_circle</i><%= correo%></a></li>
      <li class="divider" id="liOfUlDrop"></li>
      <li id="liOfUlDrop"><a href="logout.jsp" id="wa"><i class="material-icons left orange-text">exit_to_app</i>Salir</a></li>
    </ul>

    <div class="row">
      <div class="col s12 m12 l12">
        <div class="container">
          <div class="row">
            <h2 class="center col s12 m12 l12" id="Ptitle">Tour Confirmados</h2>
          </div>
          <div class="divider"></div>
          <div class="row">
             <div class="col s12 m12 l12">
               <ul class="collapsible">
                  <%
                      for(Tour t : array){
                        System.out.println("json: "+t.getRuta());
                        String [] ruta= gson.fromJson(t.getRuta(), String[].class);
                        System.out.println("ruta: "+ruta);
                  %>
                        <li>
                             <div class="collapsible-header">
                              <i class="material-icons">room</i>
                              <%= t.getCorTur()%>
                              <span class="new badge orange"></span></div>
                                <div class="collapsible-body">
                                  <table class="responsive-table striped">
                                     <thead id="thead">
                                       <tr>
                                           <th>Fecha</th>
                                           <th>Duración</th>
                                           <th>Nombre del turista</th>
                                           <th>Correo del turista</th>
                                           <th></th>
                                       </tr>

                                     </thead>
                                     <tbody id="tbody">
                                              <tr>
                                                  <td><%= t.getFecha()%></td>
                                                  <td><%= t.getDuracion()%>  minutos</td>
                                                  <td><%= t.getNomTur()%></td>
                                                  <td><%= t.getCorTur()%></td>
                                                  
                                              </tr>
                                    </tbody>
                                   </table>
                                   <ul class="collection with-header">
                                        <li class="collection-header"><h4>Ruta</h4></li>
                                        <%
                                            for(String place : ruta){
                                        %>
                                            <li class="collection-item"><%= place%></li>
                                        <%    
                                            }
                                        %>
                                   </ul>
                                </div>
                          </li>
                   <%
                      }
                  %>
                </ul>
             </div>
            </div>
          </div>
        </div>
      </div>

<!--  Scripts-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/tourGuia.js"></script>
  </body>
  <%
          } catch(Exception e) {
            System.err.println("error: "+e.toString());
  %>
          <script>
              alert("Ha ocurrido un error, recarga la página");
          </script>
<%
          }
    } else {
        response.sendRedirect("logout.jsp");
    }

%>

</html>

