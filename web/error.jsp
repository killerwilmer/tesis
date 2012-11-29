<%-- 
    Document   : error
    Created on : 27/11/2012, 12:25:21 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String error="";
            if (request.getParameter("error") != null) {
                
                error= request.getParameter("error");
            }

        %>
        <h1 style="text-align: center;"><% out.print(error);%></h1>
        <a href="../index.jsp" id="imag"><img id='imgerror' style="width: 500px; margin-left: 30%;" src='../recursos/Imagenes/index/error.png' alt='' /></a>
    </body>
</html>
