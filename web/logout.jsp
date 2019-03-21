<%-- 
    Document   : logout
    Created on : 21/03/2019, 12:52:13 AM
    Author     : usuario1
--%>
<% 
    HttpSession sesionOk = request.getSession();
    sesionOk.invalidate();
    response.sendRedirect("index.jsp");
%>