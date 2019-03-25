<%-- 
    Document   : RegistroGuia
    Created on : 18/03/2019, 01:26:41 AM
    Author     : usuario1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Registro Guia</title>
	<link rel="stylesheet" type="text/css" href="CSS/footer.css">
	<link rel="stylesheet" type="text/css" href="CSS/resgistroGuia.css">
	<link rel="stylesheet" type="text/css" href="CSS/fuentes.css">
</head>
<body>

	<div id="capaUno">
		
		<header>

			<div>

				<h2>Easy Tour</h2>

			</div>

			<nav>

				<ul>

					<li>
						<a href="index.jsp">
							Login
							<div></div>
						</a>
					</li>

					<li>
						<a href="RegistroTurista.jsp">
							Registro Usuario
							<div></div>
						</a>
					</li>

				</ul>

			</nav>

		</header>

		<section>
			
			<article>
				
				<div>
					
					<h1>
						
						Easy Tour

					</h1>

					<h2>
						
						Unete al equipo de Easy Tour

					</h2>

				</div>

				<form name="formulario_guia" method="post" action="registros.jsp">

					<div>
						<input type="text" id="Nombre" placeholder="Nombre(s)" name="Nombre_Guia">
						<img src="RESOURCE/iconos/edit.svg">
					</div>

					<div>
						<input type="text" id="apePad" placeholder="Apellido Paterno" name="ApellidoP">
						<img src="RESOURCE/iconos/edit.svg">
					</div>

					<div>
						<input type="text" id="apeMad" placeholder="Apelliido Materno" name="ApellidoM">
						<img src="RESOURCE/iconos/edit.svg">
					</div>

					<div>
						<input type="text" id="curp" placeholder="CURP" name="CURP">
						<img src="RESOURCE/iconos/card.svg">
					</div>

					<div>
						<input type="text" id="rfc" placeholder="RFC" name="RFC">
						<img src="RESOURCE/iconos/card.svg">
					</div>

					<div>
						<input type="text" id="correo" placeholder="Correo" name="Correo_Guia">
						<img src="RESOURCE/iconos/email.png">
					</div>
                                    
                                        <div>
						<input type="text" id="valCor" placeholder="Repite tu correo" name="correocon">
						<img src="RESOURCE/iconos/email.png">
					</div>
                                    
                                        <div>
						<input type="text" id="Nombre" placeholder="Telefono" name="Telefono_Guia">
						<img src="RESOURCE/iconos/edit.svg">
					</div>
                                    
                                        <div>
						<input type="text" id="Nombre" placeholder="Direccion" name="Direccion_Guia">
						<img src="RESOURCE/iconos/edit.svg">
					</div>

					<div>
						<input type="password" id="contra" placeholder="Contrase&ntilde;a" name="Password">
						<img src="RESOURCE/iconos/candado-abierto.svg">
					</div>
					
					<div>
						<input type="password" name="valCon" placeholder="Repite la contrase&ntilde;a">
						<img src="RESOURCE/iconos/candado-abierto.svg">
					</div>

					<div id="error"></div>

					<input type="submit" value="Enviar Peticion">

				</form>

			</article>

		</section>

		<footer>
			
			<section>
				
				<div id="redes" class="titulo">
					
					Easy Tour

				</div>

				<div id="logRed" class="contenido">
					
					<img class="redes" src="RESOURCE/iconos/facebook-logo.svg">
					<img class="redes" src="RESOURCE/iconos/google-logo.svg">
					<img class="redes" src="RESOURCE/iconos/pinterest-logo.svg">
					<img class="redes" src="RESOURCE/iconos/twitter-logo.svg">

				</div>

			</section>

			<section>

				<div id="politicas" class="titulo">
					
					Politicas

				</div>

				<div id="polInf" class="contenido">
					
					<ul>
						<li><a href="" class="infLeg">Privacidad y Politica de cookies</a></li>
						<li><a href="" class="infLeg">Contacto</a></li>
						<li><a href="" class="infLeg">Acerca de la pagina</a></li>
					</ul>

				</div>
				
			</section>

			<section>

				<div id="contacto" class="titulo">
					
					Informacion de contacto

				</div>

				<div id="infCont" class="contenido">
					
					<ul>
						<li>Direcci&oacute;n</li>
						<li>T&eacute;lefono:</li>
						<li>E-mail</li>
					</ul>

				</div>
				
			</section>

			<section id="infLeg">
				
				Copyright &copy; 2018 Easy Tour | Todos los derechos reservados

			</section>

		</footer>

	</div>

    </body>
</html>
