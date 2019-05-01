<%-- 
    Document   : registroPocion
    Created on : 24/10/2018, 07:26:50 PM
    Author     : AMD
--%>
<%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
            <title>Registro</title>
            <link rel="stylesheet" type="text/css" href="CSS/registroOpciones.css">
            <link rel="stylesheet" type="text/css" href="CSS/fuentes.css">
    </head>
    <body>

            <header>

                    <section>

                            <h1>
                                    Easy Tour
                            </h1>

                    </section>

                    <nav>

                            <ul>
                                    <li>
                                            <a href="index.jsp">
                                                    <h3>
                                                            Login
                                                            <div></div>
                                                    </h3>
                                            </a>
                                    </li>
                                    <li>
                                            <a href="">
                                                    <h3>
                                                            Informacion
                                                            <div></div>
                                                    </h3>
                                            </a>
                                    </li>
                            </ul>

                    </nav>

            </header>

            <section class="opcReg" id="opcTur">

                    <article>

                            <a href="RegistroTurista.jsp"><h1>Turista</h1></a>

                    </article>

            </section>

            <section class="opcReg" id="opcGui">

                    <article>

                            <a href="RegistroGuia.jsp"><h1>Guia</h1></a>

                    </article>

            </section>

    </body>
</html>
