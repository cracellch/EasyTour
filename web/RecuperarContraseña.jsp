<%-- 
    Document   : RecuperacionContraseña
    Created on : 27-mar-2019, 15:43:59
    Author     : crace
--%>

<%@page import="Conexiones.ControladorCorreo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Conexiones.Consultas"%>
<%@page import="Entidades.Correo"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/recuperacionCorreo.css">
	<link rel="stylesheet" type="text/css" href="CSS/fuentes.css">
	<link rel="stylesheet" type="text/css" href="CSS/footer.css">
    </head>
    <header>
				
                    <div id="logo">

                        <h2>

                            Easy Tour

                        </h2>

                    </div>

                    <nav>

                        <ul>

                            <li>
                                <a href="index.jsp">
                                    Regresar
                                    <div></div>
                                </a>
                            </li>
                        </ul>

                    </nav>

                </header>
    <body>
        <div class="Oscuro">
            <div id="titFun">

                        <h1>	
                                Recuperar Contraseña 
                        </h1>	  
                        <div class="text">
                            <h2>	
                            ¿Perdiste o olvidaste tu contraseña por alguna razon?
                            </h2>	
                            <br>
                            <h3>Recuperala ingresando tu correo con el cual ingresas al sistema, 
                                te mandaremos un mensaje a tu correo con la clave para cambiar la 
                                contraseña </h3>
                                <h3>de tu cuenta, luego ingresa tu correo y tu la clave que fue
                                enviada a tu correo y introduce la nueva contraseña 2 veces para confirmarla.</h3>

                        </div>
                        <div class="correo">

                            <h2>	
                            Introduce el correo con el cual entras al sistema, se te enviara un correo. Por favor checa tu correo.
                            </h2>

                        </div>
                        <div class="formularioCorreo">
                                <form name="Inicio" method="post" id="login" action="EnviarCorreo.jsp">
                                    
                                        <div id="inp">
                                                <input type="text" placeholder="E-mail" id="inpUsu" class="boxIcon" onkeypress="return validarcorreo(event)" name="correoI">
                                                <img src="RESOURCE/iconos/email.png" class="icon">
                                        </div>
                                        <div class="botonesInicio">
						<input type="submit" name="Enviar" id="inEnt" value="Enviar">
					</div>
                                </form>
                        </div>
                    
                </div>

        </div>
    </body>
</html>
