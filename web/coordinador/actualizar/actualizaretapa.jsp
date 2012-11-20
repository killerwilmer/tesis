<%-- 
    Document   : actualizaretapa
    Created on : 16/11/2012, 05:35:40 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
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
            String miEtapa = request.getParameter("idf");
            int numero = Integer.parseInt(request.getParameter("num"));
            if ((miEtapa.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite un Nombre');</script>");
            } else {
                String SqlNombre = "Select nombreetapa from etapa where nombreetapa = '" + miEtapa.toUpperCase() + "'";
                if (control.iden(SqlNombre)) {
                    out.print("<script languaje = javascript>showNoticeToast('Nombre de la Etapa Ya Existe');</script>");
                } else {
                    String SQL = "Update etapa SET nombreetapa='" + miEtapa.toUpperCase() + "' where idetapa='" + numero + "'";
                    if (control.ejecutarOperacion(SQL)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Actualizados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Actualizar los Datos');</script>");
                    }
                }
            }
                
        %>
    </body>
</html>
