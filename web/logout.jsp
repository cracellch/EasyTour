<%-- 
    Document   : logout
    Created on : 21/03/2019, 12:52:13 AM
    Author     : usuario1
--%>
<% 
    try {
            HttpSession sesionOk = request.getSession();
            sesionOk.invalidate();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
%>