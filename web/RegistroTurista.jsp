<%-- 
    Document   : RegistroTurista
    Created on : 18/03/2019, 01:25:10 AM
    Author     : usuario1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <title>Registro Turista</title>
	<link rel="stylesheet" type="text/css" href="CSS/footer.css">
	<link rel="stylesheet" type="text/css" href="CSS/registroTurista.css">
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
						<a href="RegGui.jsp">
							Registro Guia
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
						
						Crea una cuenta en Easy Tour

					</h2>

				</div>
                            
				<form name="Registro_Turista" method="post" action="registros.jsp">

					<div>
						<input type="text" id="Nombre" placeholder="Nombre(s)" name="Nombre_Turista">
						<img src="RESOURCE/iconos/edit.svg">
					</div>

					<div>
						<input type="text" id="apePad" placeholder="Apelldo Paterno" name="ApellidoP_Turista">
						<img src="RESOURCE/iconos/edit.svg">
					</div>

					<div>
						<input type="text" id="apeMad" placeholder="Apeido Materno" name="ApellidoM_Turista">
						<img src="RESOURCE/iconos/edit.svg">
					</div>
					
					<div>
						<input type="text" id="correo" placeholder="Correo" name="Correo_Turista">
						<img src="RESOURCE/iconos/email.png">
					</div>

					<div>
						<input type="text" id="valCor" placeholder="Repite tu correo">
						<img src="RESOURCE/iconos/email.png">
					</div>

					<div>
						<input type="password" id="contra" placeholder="Contrase&ntilde;a">
						<img src="RESOURCE/iconos/candado-abierto.svg">
					</div>
					
					<div>
						<input type="password" placeholder="Repite la contrase&ntilde;a" name="PSW_Confirmacion">
						<img src="RESOURCE/iconos/candado-abierto.svg">
					</div>

					<div id="error"></div>

					<input type="submit" name="" value="Registrarse">

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