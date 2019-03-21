<%-- 
    Document   : index
    Created on : 16-mar-2019, 1:18:22
    Author     : crace
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Easy Tour</title>
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
	<link rel="stylesheet" type="text/css" href="CSS/fuentes.css">
	<link rel="stylesheet" type="text/css" href="CSS/footer.css">
        <link rel="shortcut icon" type="image/x-icon" href="/images/icon1.ico" />
</head>
<body>

	<div id="background">
							
		<header>
			
			<div id="logo">
				Easy Tour
			</div>

			<nav>
				
				<ul>
					
					<li>
						<a href="">Informacion</a>
						<div></div>
					</li>
					<li>
						<a href="registroOpcion.jsp">Registrarse</a>
						<div></div>
					</li>

				</ul>

			</nav>

		</header>

		<section id="inicio">

			<article id="titulo">
				
				<div id="parrafoUno">
					Explora f&aacute;cil la
				</div>

				<div id="parrafoDos">
					
				</div>

				<div id="parrafoTres">
					Ciudad de M&eacute;xico
				</div>

			</article>

			<article id="formularioInicio">
                            
				<form name="Inicio" method="post" id="login" action="login.jsp">

					<div id="iniTit">
						Iniciar sesi&oacute;n
					</div>

					<div id="inp">
						<input type="text" placeholder="E-mail" id="inpUsu" class="boxIcon" onkeypress="return validarcorreo(event)" name="correoI">
						<img src="RESOURCE/iconos/email.png" class="icon">
					</div>
					<div id="inp">
						<input type="password" placeholder="Contase&ntilde;a" id="inpPas" class="boxIcon" onkeypress="return validarletynum(e)" name="passwordI">
						<img src="RESOURCE/iconos/candado-abierto.svg" class="icon">
					</div>

					<div id="error">
						
						Usuarios y/o contrase&ntilde;a incorrecto(s). <a href="" style="color:#788FBC">Has olvidado tu contrase&ntilde;a</a> 

					</div>

					<div id="botonesInicio">
						<input type="submit" name="Entrar" id="inEnt" value="Ingresar">
                                                <a id="Registrar" href="registroOpcion.jsp">Registrarse</a>

					</div>
                                    
					
				</form>
                            <!-- AQUI es donde tyienes que arreglasr la wea del boton plots-->
      
							</article>

		</section>

	</div>

	<section id="infGen">
		
		<article id="queEs">
			
			<div id="titQue">

				<h1>	

					&#191;Qu&eacute; es Easy Tour?

				</h1>

			</div>

			<div id="infQue">

				<h2>	

					<p>	

						Easy tour es una p&aacute;gina que te permite encontar un <bdi id="palabraClave">guia</bdi> que te ayude 
						a <bdi id="palabraClave">conocer</bdi> Bellas Artes y el centro hist&oacute;rico de la Ciudad de M&eacute;xico de forma <bdi id="palabraClave">f&aacute;cil</bdi>

					</p>

				</h2>
				
			</div>

		</article>

		<article id="funcionamiento">

			<div>
				
				<div id="titFun">
						
					<h1>	

						&#191;C&oacute;mo funciona Easy Tour?

					</h1>

				</div>

				<div id="infFun">	

					<h2>

						<p>	

							Easy Tour <bdi id="palabraClave">busca por ti</bdi> a personas que viven cerca de Bellas artes y el Centro Hist&oacute;rico de la Ciudad de M&eacute;xico, s&oacute;lo tienes que	<a href="registroOpcion.jsp" style="color:#788FBC; text-decoration: none;"}>registrarte</a> y crear un recorrido. Automaticamente apareceran <bdi id="palabraClave">guias que cubran</bdi> la ruta seleccionada.

						</p>	

					</h2>

				</div>

			</div>

		</article>

	</section>

	<footer>
		
		<section>
			
			<div id="redes" class="titulo">
				
				Easy Tour

			</div>

			<div id="logRed" class="contenido">
				
				<img class="redes" src="RESOURCE/iconos/facebook-logo.svg" >
				<img class="redes" src="RESOURCE/iconos/google-logo.svg">
				<img class="redes" src="RESOURCE/iconos/pinterest-logo.svg">
				<img class="redes" src="RESOURCE/iconos/twitter-logo.svg">

			</div>

		</section>

		<section>

			<div id="politicas" class="titulo">
				
				Polit&iacute;cas

			</div>

			<div id="polInf" class="contenido">
				
				<ul>
					<li><a href="" class="infLeg">Privacidad y Pol&iacute;tica de cookies</a></li>
					<li><a href="" class="infLeg">Contacto</a></li>
					<li><a href="" class="infLeg">Acerca de la p&aacute;gina</a></li>
				</ul>

			</div>
			
		</section>

		<section>

			<div id="contacto" class="titulo">
				
				Informaci&oacute;n de contacto

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
			
			Copyright &copy; 2018 Easy Tour | Todos los derechos reservados |  <a href="registroOpcion.jsp" class="infLeg"> Registrarse</a>

		</section>

	</footer>

</body>
</html>
