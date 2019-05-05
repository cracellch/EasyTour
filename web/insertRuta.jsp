<%-- 
    Document   : insertRuta
    Created on : 26/03/2019, 01:17:43 AM
    Author     : usuario1
--%>
<%@page import="java.nio.charset.StandardCharsets.*"%>

<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
       <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">-->
       <meta charset="utf-8"/>
        <title>Form Tour</title>
        <link rel="stylesheet" href="CSS/insertarRuta.css"/>
        <link rel="stylesheet" href="CSS/fuentes.css"/>
        <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin=""/>
    
        </head>
   <body>
<%
    HttpSession sesion = request.getSession();
    String ruta= request.getParameter("rut");
    System.out.println("ruta "+ ruta);
    if(sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST"){
        if (request.getParameter("rut").equals("") || request.getParameter("rut").equals(null)) {
                response.sendRedirect("planearRuta.jsp");
            }
       
        String value = new String(request.getParameter("nomsrut").getBytes("UTF-8")); 
        String [] array  = value.split(",");
        for(int i=0; i<array.length; i++){
            System.out.println(array[i]);
        }
        String ids = request.getParameter("rut");
        String duracion= request.getParameter("tiemporuta");
        
%>
        <div id="background" name="background">

            <div id="capaUno" name="contenido">
                
                <header>
				
                    <div id="logo">

                        <h2>

                            Easy Tour

                        </h2>

                    </div>

                    <nav>

                        <ul>

                            <li>
                                <a href="planearRuta.jsp">
                                    Inicio
                                    <div></div>
                                </a>
                            </li>
                            
                            <li>
                                <a href="ViewModificarDatos.jsp">
                                    Cuenta
                                    <div></div>
                                </a>
                            </li>
                            
                            <li>
                                <a href="elegirGuia.jsp">
                                    Notificaciones
                                    <div></div>
                                </a>
                            </li>
                            
                            <li>
                                <a href="logout.jsp">
                                    Salir
                                    <div></div>
                                </a>
                            </li>

                        </ul>

                    </nav>
                </header>
                <section id="inicio">

			<article id="ticket">
				
                                <p>Ruta:</p>
                                <ul id="lugaresRuta">
                                <%
                                for (int i = 0; i < array.length; i++) {
                                %>
                                    <li id="nombrelugar<%= i%>"><%= array[i] %></li>
                                <%        
                                    }
                                %>
                                </ul>
                            <form id="formtour">
                                <input type="hidden" name="important" value="<%=ids%>" disabled="true"  id="important">
                                <input type="text" name="costo" value="200" disabled="true" id="costo">
                                <input type="text" name="tiempo" value="<%= duracion%>" disabled="true" id="tiempo">
                                <input type="date" name="fecha" id="fecha">
                                <input type="button" value="Buscar guía disponible" id="butVG">
                                <input type="hidden" value="" id="ag" name="guia">
                                <input type="text" value="" id="nomguia" disabled>
                                <input type="text" value="" id="corguia" disabled>
                                <input type="button" value="Guardar tour" id="butMF" style="display: none">
                            </form>

			</article>
                        <article id="mapaid" style="width: 600px; height: 400px;">
                                    
                        </article>
		</section>
            </div>
        </div>
        <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js" integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg==" crossorigin=""></script>
        <script src="JS/jquery-3.3.1.min.js"></script>
        <script src="JS/insertRuta.js"></script>
        <script src="JS/inserRutaMap.js"></script>
        <script type="text/javascript" src="JS/markers.json"></script>

    
<%       
    }
    else{
        response.sendRedirect("logout.jsp");
    }

%>
        
    </body>
</html>
