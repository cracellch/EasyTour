<%-- 
    Document   : adminTuristas
    Created on : 2/05/2019, 02:28:36 PM
    Author     : usuario1
--%>

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
          ArrayList<Turista> array = con.getTuristas();

%>


  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Turistas</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/admin.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  </head>
  <body>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li class="active"><a href="#"><i class="material-icons left">account_circle</i>Turistas</a></li>
          <li><a href="adminGuias.jsp"><i class="material-icons left">account_circle</i>Guias</a></li>
          <li><a href="adminTours"><i class="material-icons left">room</i>Tour</a></li>
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
           <li class="active"><a href="#" id="wa"><i class="material-icons left orange-text">account_circle</i>Turistas</a></li>
           <li><a href="adminGuias.jsp" id="wa"><i class="material-icons left orange-text">account_circle</i>Guias</a></li>
           <li><a href="adminTours.jsp" id="wa"><i class="material-icons left orange-text">room</i>Tour</a></li>


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
            <h2 class="center col s12 m12 l12" id="Ptitle">Turistas</h2>
          </div>
          <div class="divider"></div>
          <div class="row">
            <div class="col s12 m12 l12">
              <table class="responsive-table striped">
                 <thead>
                   <tr>
                       <th>Nombre</th>
                       <th>Correo</th>
                       <th>Estado</th>
                       <th></th>
                   </tr>
                 </thead>
                 <tbody>
                    <%
                        String st;
                        int idT;
                        for(Turista t : array){
                            idT = t.getId();
                            String nombre= t.getNombre() + " " +t.getApellidoP() + " " + t.getApellidoM();
                    %>  
                          <tr>
                              <td><%= nombre%></td>
                              <td><%= t.getCorreo()%></td>
                              <td id="status<%= idT%>">
                    <%
                                  st = t.getStatus();
                                  System.out.println("status: "+t.getStatus());
                                  if(st.equals("activo")){
                    %>
                                      <a class="btn-small light-green accent-4 white-text">Activo</a>
                              </td>
                              <td id="boton">
                                  <a class="btn-small indigo darken-2 white-text" onclick="cambStatusTur(this, <%= idT%>,'<%= st%>')">Bloquear</a>
                              </td>
                    <%
                                  }else{
                    %>
                                  <a class="btn-small red white-text">Bloqueado</a>
                              </td>
                              <td id="boton">
                                  <a class="btn-small indigo darken-2 white-text" onclick="cambStatusTur(this,<%= idT%>,'<%= st%>')">Activar</a>
                              </td>
                    <%
                                  }
                    %>
                              
                          </tr>
                    <%
                        }
                    %>
                 </tbody>
               </table>
             </div>
            </div>
          </div>
        </div>
      </div>

<!--  Scripts-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/admin.js"></script>
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

