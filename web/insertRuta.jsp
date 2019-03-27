<%-- 
    Document   : insertRuta
    Created on : 26/03/2019, 01:17:43 AM
    Author     : usuario1
--%>

<%
    if(request.getMethod() == "POST" && request.getParameter("rutacompleta") != null){
        String array = request.getParameter("rutacompleta");
        System.out.println(array);
        
    }

%>