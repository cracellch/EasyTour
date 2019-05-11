<%-- 
    Document   : datosTour
    Created on : 8/05/2019, 04:09:24 PM
    Author     : usuario1
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Lugar"%>
<%@page import="Entidades.Tour"%>
<%@page import="Conexiones.Queries"%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Tour actual</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/datosTour.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.0/dist/leaflet.css" />

  </head>
  <body>
<%
    HttpSession sesion = request.getSession();
    System.out.println(sesion.getAttribute("autenticado").toString());
    System.out.println(sesion.getAttribute("tipo").toString());
    System.out.println(request.getMethod().toString());
    if(sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "GET"){
      try{
        Queries queries = new Queries();
        String correo = sesion.getAttribute("email").toString();
        int id = Integer.parseInt(sesion.getAttribute("id").toString());
        Tour tour = queries.getDatosTour(id);
        ArrayList<Lugar> array = queries.getLugares(tour.getId());

%>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li><a href="planearRuta.jsp"><i class="material-icons left">room</i>Planear Ruta</a></li>
          <li class="active"><a href=""><i class="material-icons left">mode_edit</i>Tour actual</a></li>
          <li><a href="ViewModificarDatos.jsp"><i class="material-icons left">mode_edit</i>Modificar Datos</a></li>

          <li><a class="dropdown-trigger" href="#!" data-target="uldrop"><i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>

        <ul id="slide-out" class="sidenav">
           <li><div class="user-view">
             <div class="background">
            </div>
             <a href="#"><img class="circle" src="RESOURCE/iconos/account.png"></a>
             <a href="#"><span class="email" id="spemail"><%= correo%></span></a>
           </div></li>
           <li><div class="divider"><div class="divider"><div class="divider"></div></div></div></li>
           <li><a href="planearRuta.jsp" id="wa"><i class="material-icons left orange-text">room</i>Planear Ruta</a></li>
           <li class="active"><a href="#" id="wa"><i class="material-icons left orange-text">mode_edit</i>Tour actual</a></li>
           <li><a href="ViewModificarDatos.jsp" id="wa"><i class="material-icons left orange-text">mode_edit</i>Modificar cuenta</a></li>

           <li><div class="divider"><div class="divider"><div class="divider"></div></div></div></li>
           <li><a href="logout.jsp" id="wa"><i class="material-icons left orange-text">exit_to_app</i>Cerrar Sesión</a></li>
         </ul>
        <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      </div>
    </nav>

    <ul id="uldrop" class="dropdown-content">
      <li id="liOfUlDrop"><a href="#" class="right"><i class="material-icons left orange-text">arrow_drop_up</i></a></li>
      <li class="divider" id="liOfUlDrop"></li>
      <li id="liOfUlDrop"><a href="#" id="wa"><i class="material-icons left orange-text" >account_circle</i><%= correo%></a></li>
      <li class="divider" id="liOfUlDrop"></li>
      <li id="liOfUlDrop"><a href="logout.jsp" id="wa"><i class="material-icons left orange-text">exit_to_app</i>Cerrar Sesión</a></li>
    </ul>
    <div class="row">
      <div class="col s12 m12 l8">
        <div class="container">
          <div class="row">
            <h2 class="center col s12 m12 l12" id="Ptitle">Tour actual</h2>
          </div>
          <div class="divider"></div>
          <div class="row">
            <div class="col s12 m12 l12">
              <div class="card">
                <blockquote class="text-align center">
                    Aquí te aparecerá cuando tu tour se confirme. <br>
                    
                </blockquote>
                <div class="card-tabs">
                  <ul class="tabs tabs-fixed-width tabs-transparent" id="ctabs">
                    <li class="tab" id="tcor"><a href="#test1" class="active">Zocalo</a></li>
                    <li class="tab" id="tpass"><a href="#test2">Ver ruta en mapa</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div id="test1" class="col s12">
              <ul class="collection with-header">
                <li class="collection-header"><h4>Datos:</h4></li>
                <li class="collection-item">Duración: <%= tour.getDuracion()%></li>
                <li class="collection-item">Costo: <%= tour.getCosto()%></li>
                <li class="collection-item">Fecha: <%= tour.getFecha()%></li>
                <li class="collection-item">Guía: <%= tour.getG().getNombre()+" "+tour.getG().getApellidoP()+" "+tour.getG().getApellidoM()%></li>
                <li class="collection-item">Correo guía: <%= tour.getG().getCorreo()%></li>
              </ul>
              <p>
                    <label>
                        <input type="checkbox" onclick="document.getElementById('form').style.display='block'"/>
                      <span>¿Cancelar tour?</span>
                    </label>
              </p>
              <form id="form">
                  <div class="row">
                      <h3>Necesitamos que nos digas por qué quieres cancelar. :(</h3>
                      <div class="input-field col s12">
                        <textarea id="textarea1" class="materialize-textarea" data-length="100"></textarea>
                        <label for="textarea1">Dinos la razón.</label>
                      </div>
                      <div class="input-field col s12 ">
                        <i class="material-icons prefix">https</i>
                        <input type="password" id="pass">
                        <label for="pass">Password</label>
                      </div>
                      <button class="right btn waves-effect waves-light" id="bttn1" type="button" onclick="cancelar(<%=tour.getId()%>)">Cancelar
                        <i class="material-icons right">send</i>
                      </button>
                  </div>
              </form>
          </div>
          <div id="test2" class="col s12">
                 <article id="mapaid"></article>
          </div>
        </div>
      </div>
      <div class="col m12 l4 s12" id="card">
           <div class="card hoverable">
             <div class="card-content">
                 <div class="card-tabs">
                   <ul class="tabs tabs-fixed-width tabs-transparent">
                     <li class="tab" id="tpass"><a href="#test4">Tu tour:</a></li>
                   </ul>
                 </div>
                 <div class="card-content">
                   <h6 id="Ptitle">Ruta:</h6>
                   <ul class="collection" id="collap">
                   <%
                       int i = 0;
                       for (Lugar l : array){
                   %>
                      <li class="collection-item avatar">
                        <img src="<%=l.getImagen()%>" alt="" class="circle">
                        <span class="title" id="nombrelugar<%=i%>"><%=l.getNombre()%></span>
                        <p>Duración: <%=l.getDuracion()%><br>
                           Costo: <%=l.getCosto()%><br>
                           Ubicación:  <%=l.getUbicacion()%>
                        </p>
                        <a class="secondary-content"><i class="material-icons">grade</i></a>
                      </li>
                   <% 
                            i++;
                       }
                   %>
                       
                   </ul>
                </div>
             </div>
             <div class="divider"></div><div class="divider"></div><div class="divider"></div>
          </div>
        </div>
      </div>
<!--  Scripts-->
    
<!--    <script src="JS/insertRutaMap.js"></script>-->
    <script src="https://unpkg.com/leaflet@1.5.0/dist/leaflet.js"></script>
<!--    <script src="JS/insertRutaMap.js"></script>-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/datosTour.js"></script>
    <script src="JS/markers.json"></script>
    <%
            }catch (Exception e){
                   System.err.println("error: "+e.toString());
    %>
    <script>
        alert("Ha ocurrido un error, recarga la página.");
    </script>
    <%
            }
    } else {
        response.sendRedirect("logout.jsp");
    }

    %>

  </body>
</html>

