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
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="JS/planearRuta.js" type="text/javascript"></script>
        <link rel="stylesheet" href="CSS/planearRuta.css"/>
        
        <link rel="stylesheet" href="CSS/fuentes.css"/>
    </head>
    <body>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("autenticado") != null && sesion.getAttribute("tipo").equals("turista")) {
            try {
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
                                <a href="Administrador.jsp">
                                    Inicio
                                    <div></div>
                                </a>
                            </li>
                            
                            <li>
                                <a href="">
                                    Cuentas
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
                            Estadisticas
                        </h1>

                    </article>

                    <article id="sitios">
                            <ul>
                                <li>
                                        <div id="lugares" class="lugares" name="lugares" >

                                               <div id="imagen" class="imagen">
                                             
                                    
                                                </div>

                                            <div id="infoLuga" class="infoLuga">


                                            </div>

                                        </div>
                                </li>
                               
                            </ul>
                            <form method="post" action="insertRuta.jsp"  name="formularioruta" id="formularioruta"> <%//este formulario no se muestra, se usa para enviar la ruta %>

                                <input type="hidden" name='nomsrut' id="ruta" value=''>
                                <input type="hidden" name="tiemporuta" id="tiempo" value="">
                                <input type="hidden" name="rut" id="rut" value="">

                            </form>

                            <div id="guRut">

                                <input type="button" value="Guardar ruta" onclick="mandar()" href="elegirGuia.jsp">

                            </div>
                    </article>
            </section>
                           
          </div>   
            
        </div>
    
    
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

