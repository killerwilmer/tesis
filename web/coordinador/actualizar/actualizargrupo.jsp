<%-- 
    Document   : actualizargrupo
    Created on : 19/11/2012, 08:02:12 AM
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
            String migrupo = request.getParameter("nomgrup");
            int numero = Integer.parseInt(request.getParameter("idgrup"));
            if ((migrupo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite un Nombre');</script>");
            } else {
                String SqlNombre = "Select nombregrupoinvestigacion from grupoinvestigacion where nombregrupoinvestigacion = '" + migrupo.toUpperCase() + "'";
                if (control.iden(SqlNombre)) {
                    out.print("<script languaje = javascript>showNoticeToast('Nombre del Grupo Ya Existe');</script>");
                } else {
                    String SQL = "Update grupoinvestigacion SET nombregrupoinvestigacion='" + migrupo.toUpperCase() + "' where idgrupoinvestigacion='" + numero + "'";
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
