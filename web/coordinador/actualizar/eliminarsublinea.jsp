<%-- 
    Document   : eliminarsublinea
    Created on : 21/11/2012, 05:26:38 AM
    Author     : Alex
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idSe = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/mensajespoput.js"></script>
    </head>
    <body>
        <%
            int numero = Integer.parseInt(request.getParameter("ideliminarsublinea"));
            String consultas = "delete from sublinea where idsublinea = '" + numero + "'";
            if (control.ejecutarOperacion(consultas)) {
                out.print("<script languaje = javascript>showSuccessToast('Datos Borrados Correctamente');</script>");
            } else {
                out.print("<script languaje = javascript>showErrorToast('Error al Borrar los Datos');</script>");
                    
            }
        %>
    </body>
</html>
