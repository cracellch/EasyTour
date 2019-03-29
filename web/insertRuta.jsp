<%-- 
    Document   : insertRuta
    Created on : 26/03/2019, 01:17:43 AM
    Author     : usuario1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form Tour</title>
        <script src="JS/jquery-3.3.1.min.js"></script>
        <script src="JS/insertRuta.js.js"></script>
    </head>
   <body>
<%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista") && request.getMethod() == "POST" && request.getParameter("nomsrut") != null && request.getParameter("tiemporuta") != null && request.getParameter("rut") != null){
        String [] array  = request.getParameter("nomsrut").split(",");
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
                                <a href="elegirGuia.jsp">
                                    Buscar Guia
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
                <form id="formtour" action="x.jsp">
                    <input id="important" type="hidden" value="<%= ids%>" disabled="true" name="important">
                    <p>Ruta:</p>
                    <ul>
                    <%
                    for (int i = 0; i < array.length; i++) {
                    %>
                        <li id="nombrelugar">
                            <%= array[i] %>
                        </li>
                    <%        
                        }
                    %>
                    </ul>
                    <input id="costo" type="text" value="$200" disabled="true" name="costo">
                    <input id="tiempo" type="text" value="<%= duracion%>" disabled="true" name="tiempo">
                    <input id="fecha" type="date" name="fecha">
                    <input type="button" value="Ver guías disponibles"  id="butVG">
                    <div id="guias">
                        <span id="aver">
                            
                        </span>
                    </div>
                </form>
            </div>
        </div>
<%       
    }
    else{
        response.sendRedirect("logout.jsp");
    }

%>
    </body>
</html>
