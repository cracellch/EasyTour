<%--
    Document   : insertRuta
    Created on : 26/03/2019, 01:17:43 AM
    Author     : usuario1
--%>
<%@page import="Conexiones.Queries"%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Insertar Ruta</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/insertarRuta.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.0/dist/leaflet.css" />

  </head>
  <body>
<%
    HttpSession sesion = request.getSession();
    System.out.println(sesion.getAttribute("autenticado").toString());
    System.out.println(sesion.getAttribute("tipo").toString());
    System.out.println(request.getMethod().toString());
    if(sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "GET"){
        if (sesion.getAttribute("ruta").equals("") || sesion.getAttribute("ruta").equals(null)) {
                response.sendRedirect("planearRuta.jsp");
        }
        else try{
        Queries queries = new Queries();
        String correo = sesion.getAttribute("email").toString();
        String value = sesion.getAttribute("ruta").toString();
        String [] array  = queries.getDatosRuta(value);
        String [] ruta = array[0].split(",");


%>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li class="active"><a href=""><i class="material-icons left">room</i>Planear Ruta</a></li>
          <li ><a href="#"><i class="material-icons left">mode_edit</i>Tour actual</a></li>
          <li><a href="#"><i class="material-icons left">mode_edit</i>Modificar Datos</a></li>

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
           <li><a href="ViewModificarDatos.jsp"><i class="material-icons left orange-text">mode_edit</i>Modificar cuenta</a></li>

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
         <div class="col s12 m8 l8">
           <div class="container">
             <div class="row">
               <h2 class="center col s12 m12 l12" id="Ptitle">¡Ya casi acabamos!</h2>
             </div>
             <div class="divider"></div>
             <div class="row">
               <div class="col s12 m12 l12">
                 <div class="card">
                   <div class="card-tabs">
                     <ul class="tabs tabs-fixed-width tabs-transparent" id="ctabs">
                       <li class="tab" id="tcor"><a href="#test1">Formulario</a></li>
                       <li class="tab" id="tpass"><a href="#test2">Mapa</a></li>
                     </ul>
                   </div>
                 </div>
               </div>
              </div>
              <div id="test1" class="col s12">
                 <form>
                     <ul class="collapsible">
                       <li>
                         <div class="collapsible-header">
                              <i class="material-icons">room</i>
                               Tus sitios:
                         </div>
                         <div class="collapsible-body">
                            <ul class="collection with-header" id="collap">
                                <li class="collection-header"><h4>Bellas Artes</h4></li>
                            <%
                                for (int i = 1; i< ruta.length; i++) {
                            %>
                                <li class="collection-item" id="nombrelugar<%= i%>"><%= ruta[i]%></li>
                            <%
                                }
                            %>
                            </ul>
                         </div>
                      </li>
                    </ul>
                    <div class="divider"></div>
                    <div class="input-field col s12">
                       <input id="ubicacion" type="hidden" value="<%= array[3]%>" disabled>
                    </div>
                    <div class="input-field col s12">
                       <input id="important" name="important" type="hidden" value="<%= value%>" disabled>
                    </div>
                    <div class="input-field col s12 ">
                       <i class="material-icons prefix">attach_money</i>
                       <input id="costo" type="text" value="<%= array[2]%>" disabled>
                       <label for="costo">Costo</label>
                    </div>
                    <div class="input-field col s12 ">
                       <i class="material-icons prefix">https</i>
                       <input type="text" name="tiempo" value="<%= array[1]%> minutos" id="tiempo" disabled>
                       <label for="tiempo">Tiempo</label>
                    </div>
                    <div class="input-field col s12 ">
                       <i class="material-icons prefix">date_range</i>
                       <input type="date" name="fecha" id="fecha">
                       <label for="tiempo">Fecha</label>
                    </div>
                    <button class="right btn waves-effect waves-light" id="butVG" type="button">Ver mi guía
                      <i class="material-icons right">send</i>
                    </button>
                    <div class="input-field col s12 ">
                       <input type="hidden" value="" id="ag" name="guia">
                    </div>
                    <div class="input-field col s12 ">
                       <i class="material-icons prefix">account_circle</i>
                       <input type="text" value="Aquí se mostrará el nombre de tu guía" id="nomguia" disabled>

                    </div>
                    <div class="input-field col s12 ">
                       <i class="material-icons prefix">email</i>
                       <input type="text" value="Aquí se mostrará el correo de tu guía" id="corguia" disabled>
                    </div>
                    <button class="right btn waves-effect waves-light" id="butMF" type="button">Guardar Ruta
                      <i class="material-icons right">send</i>
                    </button>
                </form>
               </div>
               <div id="test2" class="col s12">
                 <article id="mapaid"></article>
               </div>
           </div>
         </div>
         <div class="col m4 l4" id="card">

              <div class="card hoverable" id="icard">
                <div class="card-content white-text">
                    <blockquote>
                        ¡Ingresa la fecha de tu Tour y busca tu guía! <br>
                        En mapa puedes localizar tus sitios elegidos.
                    </blockquote>
                </div>
             </div>
        </div>
    </div>
<!--  Scripts-->
    <script src="https://unpkg.com/leaflet@1.5.0/dist/leaflet.js"></script>
<!--    <script src="JS/insertRutaMap.js"></script>-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/insertRuta.js"></script>
    <script src="JS/markers.json"></script>
    <%
            }catch (Exception e){
                   System.err.println("error: "+e.toString());
            }
    } else {
        response.sendRedirect("logout.jsp");
    }

    %>

  </body>
</html>
