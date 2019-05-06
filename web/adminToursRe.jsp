<%-- 
    Document   : adminToursRe
    Created on : 4/05/2019, 09:03:32 PM
    Author     : usuario1
--%>

<%@page import="Entidades.miniGuia"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Entidades.Turista"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Conexiones.Queries"%>
<%@page import="Entidades.Tour"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("admin") && request.getMethod() == "GET") {
        try {
          int id = Integer.parseInt(sesion.getAttribute("id").toString());
          String correo = sesion.getAttribute("email").toString();
          Queries con = new Queries();
          ArrayList<Tour> array = con.getTours(4);
          Gson gson = new Gson();
 %>


  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Tours realizados</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/adminTours.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  </head>
  <body>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li><a href="adminTuristas.jsp"><i class="material-icons left">account_circle</i>Turistas</a></li>
          <li><a href="adminGuias.jsp"><i class="material-icons left">account_circle</i>Guias</a></li>
          <li class="active"><a href="#"><i class="material-icons left">room</i>Tour</a></li>
          <li><a class="dropdown-trigger" href="#!" data-target="uldrop"><i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>

        <ul id="slide-out" class="sidenav">
           <li><div class="user-view">
             <div class="background">
            </div>
             <a href="#"><img class="circle" src="account.png"></a>
             <a href="#"><span class="email" id="spemail"><%= correo%></span></a>
           </div></li>
           <li><div class="divider"><div class="divider"><div class="divider"></div></div></div></li>
           <li><a href="adminTuristas.jsp" id="wa"><i class="material-icons left orange-text">account_circle</i>Turistas</a></li>
           <li><a href="adminGuias.jsp" id="wa"><i class="material-icons left orange-text">account_circle</i>Guias</a></li>
           <li class="active"><a href="#" id="wa"><i class="material-icons left orange-text">room</i>Tour</a></li>


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
            <h2 class="center col s12 m12 l12" id="Ptitle">Tours Realizados</h2>
          </div>
          <div class="row">
               <div class="col s12">
                 <ul class="tabs tabs-fixed-width tabs-transparent" id="ctabs">
                   <li class="tab col s3" id="bgt"><a href="adminTours.jsp" id="tt">Tours por confirmar</a></li>
                   <li class="tab col s3" id="bgt"><a href="adminToursCo.jsp" id="tt">Tours confirmados</a></li>
                   <li class="tab col s3" id="bgt"><a href="adminToursCa.jsp" id="tt">Tours cancelados</a></li>
                   <li class="tab col s3" id="bgt"><a href="#" class="active" id="tta">Tours realizados</a></li>
                 </ul>
               </div>
          </div>
          <div class="divider"></div>
          <ul class="collapsible">
             <%
                 for(Tour t : array){
                   miniGuia g = t.getG();
                   System.out.println("json: "+t.getRuta());
                   String [] ruta= gson.fromJson(t.getRuta(), String[].class);
                   System.out.println("ruta: "+ruta);
             %>
                   <li>
                        <div class="collapsible-header hoverable">
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
                                      <th>Nombre del guia</th>
                                      <th>Correo del guia</th>
                                      <th></th>
                                  </tr>

                                </thead>
                                <tbody id="tbody">
                                         <tr>
                                             <td><%= t.getFecha()%></td>
                                             <td><%= t.getDuracion()%>  minutos</td>
                                             <td><%= t.getNomTur()%></td>
                                             <td><%= t.getCorTur()%></td>
                                             <td><%= g.getNombre() + " " + g.getApellidoP() + " " + g.getApellidoM()%></td>
                                             <td><%= g.getCorreo()%></td>
                                         </tr>
                               </tbody>
                              </table>
                              <div class="row">
                                    <div class="col s12">
                                      <div class="card">
                                        <div class="card-content">
                                          
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
                                      </div>
                                    </div>
                              </div>
                           </div>
                     </li>
              <%
                 }
             %>
           </ul>


        </div>
      </div>
    </div>

<!--  Scripts-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/adminTours.js"></script>
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
