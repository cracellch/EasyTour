<%--
    Document   : ViewModificarDatos
    Created on : 27/04/2019, 07:17:29 PM
    Author     : usuario1
--%>

<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "GET") {
        String correo = sesion.getAttribute("email").toString();


%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Prueba form</title>

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="CSS/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="CSS/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  </head>
  <body>
    <nav id="nav" role="navigation">
      <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">EasyTour</a>
        <ul class="right hide-on-med-and-down">
          <li><a href="planearRuta.jsp"><i class="material-icons left">room</i>Planear Ruta</a></li>
          <li ><a href="datosTour.jsp"><i class="material-icons left">mode_edit</i>Tour actual</a></li>
          <li class="active"><a href="#"><i class="material-icons left">mode_edit</i>Modificar Datos</a></li>

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
           <li><a href="datosTour.jsp" id="wa"><i class="material-icons left orange-text">mode_edit</i>Tour actual</a></li>
           <li class="active" id="wa"><a href="#" id="wa"><i class="material-icons left orange-text">mode_edit</i>Modificar cuenta</a></li>

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
            <h2 class="center col s12 m12 l12" id="Ptitle">¿Qué vas a modificar?</h2>
          </div>
          <div class="divider"></div>
          <div class="row">
            <div class="col s12 m12 l12">
              <div class="card">
                <div class="card-tabs">
                  <ul class="tabs tabs-fixed-width tabs-transparent" id="ctabs">
                    <li class="tab" id="tcor"><a href="#test1">Correo</a></li>
                    <li class="tab" id="tpass"><a href="#test2">Password</a></li>
                  </ul>
                </div>
              </div>
            </div>
           </div>

           <div id="test1" class="col s12">
              <form>
                  <div class="input-field col s12 ">
                     <i class="material-icons prefix">email</i>
                    <input id="email" type="email" class="validate">
                    <label for="email">Email</label>
                  </div>

                  <div class="input-field col s12 ">
                    <i class="material-icons prefix">email</i>
                    <input id="cemail" type="email" class="validate">
                    <label for="cemail">Confirma Email</label>
                  </div>


                  <div class="input-field col s12 ">
                    <i class="material-icons prefix">https</i>
                    <input id="password" type="password" class="validate">
                    <label for="password">Ingresa tu password actual</label>
                  </div>

                  <button class="right btn waves-effect waves-light" id="bttn1" type="button" onclick="sendDataC(event)">Cambirar Correo
                    <i class="material-icons right">send</i>
                  </button>

              </form>
            </div>
            <div id="test2" class="col s12">
              <form>
                  <div class="input-field col s12 ">
                    <i class="material-icons prefix">https</i>
                    <input id="npass" type="password" class="validate">
                    <label for="npass">Nueva password</label>
                  </div>

                  <div class="input-field col s12">
                    <i class="material-icons prefix">https</i>
                    <input id="cpass" type="password" class="validate">
                    <label for="cpass">Confirma password</label>
                  </div>

                  <div class="input-field col s12">
                    <i class="material-icons prefix">https</i>
                    <input id="pass" type="password" class="validate">
                    <label for="pass">Ingresa tu password actual</label>
                  </div>

                  <button class="right btn waves-effect waves-light" id="bttn2" type="button" onclick="sendDataP(event)">Cambiar Contraseña
                    <i class="material-icons right">send</i>
                  </button>

              </form>
            </div>
        </div>
      </div>
      <div class="col m4 l4" id="card">

           <div class="card hoverable" id="icard">
             <div class="card-content white-text">
               <p>Para nosotros es importante tu seguridad, por ello tu nueva información debe coincidir con los siguientes formatos.</p>
             </div>
             <div class="card-tabs">
               <ul class="tabs tabs-fixed-width tabs-transparent">
                 <li class="tab" id="tcor"><a href="#test4">Correo</a></li>
                 <li class="tab"><a href="#test5">Password</a></li>
               </ul>
             </div>
             <div class="card-content grey lighten-4">
               <div id="test4">Ejemplo de correo:
                                  example@gmail.com ó  example@gmail.com.mx
                               (No es necesario que sea gmail).
              </div>
               <div id="test5">
                 La contraseña:
                 <p>-Debe tener de 8 a 16 caracteres</p>
                 <p>Los caracteres permitidos son:</p>
                 <p>  -Letra</p>
                 <p>  -Números</p>
                 <p>  -Los siguientes caracteres: +*&%$#¿?!¡</p>
               </div>
            </div>
           </div>

           <div class="divider"></div><div class="divider"></div><div class="divider"></div>
           <div class="card-panel" id="cpanel">
             <div class="progress" id="bp">
                <div class="indeterminate"></div>
             </div>
             <div class="row">
               <i class="large material-icons col l3" id="icono"></i>
               <div class="valign-wrapper col l9 ">
                 <h5 id="cptext" class="white-text"></h5>
               </div>
             </div>
          </div>

      </div>

    </div>

<!--  Scripts-->
    <script src="JS/jquery-3.3.1.min.js"></script>
    <script src="JS/materialize.js"></script>
    <script src="JS/init.js"></script>
  </body>
</html>

<%
    } else{
        response.sendRedirect("logout.jsp");
    }

%>
