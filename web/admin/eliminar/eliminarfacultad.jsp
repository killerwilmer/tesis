<%-- 
    Document   : eliminarfacultad
    Created on : 14-abr-2012, 6:11:21
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int numero = Integer.parseInt(request.getParameter("idf"));
            String consultas = "delete from facultad where idfacultad = '" + numero + "'";
            if (control.ejecutarOperacion(consultas)) {
                out.print("<script languaje = javascript>showSuccessToast('Datos Borrados Correctamente');</script>");
            } else {
                out.print("<script languaje = javascript>showErrorToast('Error al Borrar los Datos');</script>");
                    
            }
        %>
    </body>
</html>

