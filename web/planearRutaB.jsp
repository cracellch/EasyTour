<%-- 
    Document   : planearRutaB
    Created on : 6/05/2019, 11:44:20 AM
    Author     : usuario1
--%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Lugar"%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Planear Ruta</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/planRutaB.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  </head>
  <body>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista")) {
            try {
                    Consultas con = new Consultas();
                    String correo = sesion.getAttribute("email").toString();
                    String ubicacion = "Bellas Artes";
                    ArrayList<Lugar> lugares = con.lugares(ubicacion);

    %>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li class="active"><a href=""><i class="material-icons left">room</i>Planear Ruta</a></li>
          <li ><a href="datosTour.jsp"><i class="material-icons left">mode_edit</i>Tour actual</a></li>
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
           <li class="active"><a href="" id="wa"><i class="material-icons left orange-text">room</i>Planear Ruta</a></li>
           <li><a href="datosTour.jsp" id="wa"><i class="material-icons left orange-text">mode_edit</i>Tour actual</a></li>
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
            <h2 class="center col s12 m12 l12" id="Ptitle">Empecemos con tu ruta</h2>
          </div>
          <div class="divider"></div>
          <div class="row">
            <div class="col s12 m12 l12">
              <div class="card">
                <blockquote class="text-align center">
                  Te ofrecemos 2 zonas para tu tour; ¡elige la que más te guste! <br>
                  Da click en las tarjetas para saber más del sitio.
                </blockquote>
                <div class="card-tabs">
                  <ul class="tabs tabs-fixed-width tabs-transparent" id="ctabs">
                    <li class="tab" id="tcor"><a href="" onclick="location.replace('planearRuta.jsp')">Zocalo</a></li>
                    <li class="tab active" id="tpass"><a href="" class="active">Bellas Artes</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          
          <div id="test1" class="col s12">
            <div class="row">
                <ul id="ullug">
                    <%
                        int p = 1;
                        for(Lugar l : lugares){
                         String nom = l.getNombre();
                         String img = l.getImagen();
                         int idl= l.getId();
                         if (p == 1) {
                    %>
                  <li id="li<%= idl%>">
                    <div class="card col l5 m5 s12 hoverable" id="Lcard<%= idl%>">
                    <%
                          p=2;
                         } else {
                    %>
                  <li id="li<%= idl%>">
                    <div class="card col l5 m5 s12 align right hoverable" id="Lcard<%=idl%>">
                    <%
                          p=1;
                         }
                    %>

                       <div class="card-image waves-effect waves-block waves-light">
                          <img class="activator" src="<%=  img%>">
                       </div>
                       <div class="card-content">
                         <span class="card-title activator grey-text text-darken-4"><%= nom%><i class="material-icons right">more_vert</i></span>
                         <div class="divider"></div>
                       </div>
                       <div class="card-tabs">
                            <ul class="tabs tabs-fixed-width">
                              <li class="tab" id="tabAgg" onclick="addPlace('<%= nom%>','<%= img%>',<%= idl%>,<%= l.getDuracion()%>,<%= l.getCosto()%>)"><a class="waves-effect waves-light" id="txttab"><i class="material-icons center">check</i></a></li>
                              <li class="tab" id="tabQui<%= idl%>" onclick="delPlace(<%= idl%>)"><a class="waves-effect waves-light" id="txttab"><i class="material-icons center">clear</i></a></li>
                            </ul>
                       </div>
                       <div class="card-reveal">
                         <span class="card-title grey-text text-darken-4 text-align center"><%= nom%><i class="material-icons right">close</i></span>
                         <p><%= l.getDescripcion()%></p>
                         <p>Duracion: <%= l.getDuracion()%> min</p>
                         <p>Costo: $<%= l.getCosto()%></p>
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
                   <h6 id="Ptitle">Ruta en Bellas Artes:</h6>
                   <ul class="collection" id="collection">
                       
                   </ul>
                   <form action="insertRuta.jsp" method="post" id="formularioruta">
                       <input type="hidden" id="ubic" name ="ubic" value="Bellas Artes" disabled>
                       <input type="hidden" id="rut" name ="rut" disabled>
                       <input type="hidden" id="ruta" name ="nomsrut" disabled>
                       <input type="hidden" id="tiempo" name ="tiemporuta" disabled>
                       <input type="hidden" id="costo" name ="costo" disabled>
                       <button class="right btn waves-effect waves-light" id="bttn1" type="button" onclick="mandar(event)">Continuar
                            <i class="material-icons right">send</i>
                       </button>
                   </form>
                </div>
             </div>
             <div class="divider"></div><div class="divider"></div><div class="divider"></div>
          </div>
        </div>
      </div>

<!--  Scripts-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/planearRuta.js"></script>

    <%
            } catch (Exception e) {
    %>
                    <script>
                        alert("Algo salió mal, recarga la página o intenta más tarde");
                    </script>
    <%
                    System.err.println(e.toString());
              }
        } else {
            response.sendRedirect("logout.jsp");
        }

    %>
  </body>
</html>
