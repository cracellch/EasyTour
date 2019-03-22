<%-- 
    Document   : planearRuta
    Created on : 20/03/2019, 11:52:37 PM
    Author     : usuario1
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Lugar"%>
<%@page import="Conexiones.Consultas"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista")) {
            Consultas con = new Consultas();
            String ubicacion = "Zocalo";
            if(request.getParameter("ubi")!=null){
            ubicacion = request.getParameter("ubi");
            }
            ArrayList<Lugar> lugar = con.lugares(ubicacion);
            Iterator<Lugar> itr = lugar.iterator();
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
            
                <section id="info">

                    <article id="titRut">

                        <h1>
                            Ruta de <%=lugar %>
                        </h1>

                    </article>

                    <aricle id="ubicacion">

                        <form action="planearRuta.jsp" method="post">

                            <select id="ubi" name="ubi">
                                <option value="Zocalo">Zocalo</option>
                                <option value="Bellas Artes">Bellas Artes</option>
                            </select>

                            <input type="submit" value="Elegir ubicacion del tour">

                        </form>

                    </aricle>

                    <article id="sitios">
    <%
                        while (itr.hasNext()) {                    
                            Lugar l= itr.next();
    %>
                        <div id="lugares_<%=l.getId()%>" class="lugares" name="lugares_<%=l.getId()%>" >
                            
                            <div id="imagen" class="imagen">
                                
                                <img src="<%=l.getImagen() %>" >
                                <div></div>

                            </div>

                            <div id="infoLuga" class="infoLuga">
                                
                                <input type="button" value="X" class="eliminar" onclick="return eliminar<%= l.getId()%>(event)">
                                
                                <% // aqui se coloca el nombre del lugar porfavor no cambiar los "id" o la wea se muere!!!! %>
                                <h2 id="nom_lug_<%=l.getId()%>" name="<%=l.getNombre()%>" class="nomLug">

                                    <%=l.getNombre()%>

                                </h2>
                                    
                                <div class="infoEs">
                                    
                                    <%=l.getDescripcion()%>
                                  
                                </div>
                                                                   
                                <div id="durLuga_<%=l.getId()%>" name="durLuga_<%=l.getId()%>">
                                    
                                    <h4>

                                        Duracion aproximada: <%= l.getDuracion()%> minutos.

                                    </h4>
                                    
                                </div> 

                            </div>

                        </div>
                    </article>
                        
    <%
                }
    %>
    <%        
        } else {
            response.sendRedirect("index.jsp");
        }
    
    %>
    </body>
</html>

