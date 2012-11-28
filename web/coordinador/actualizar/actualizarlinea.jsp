<%-- 
    Document   : actualizarlinea
    Created on : 20/11/2012, 06:39:36 AM
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
            String miCamlinea = request.getParameter("deslinea");
            String numero = request.getParameter("idlinea");
            //out.print("<script languaje = javascript>alert('Nombre del Campo Ya Existe');</script>");
            if ((miCamlinea.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre de la Linea');</script>");
            }  else {
                String SqlNombre = "Select nombrelinea from linea where nombrelinea = '" + miCamlinea.toUpperCase() + "'";
                if (control.iden(SqlNombre)) {
                    out.print("<script languaje = javascript>showNoticeToast('Nombre de la Linea Ya Existe');</script>");
                } else {
                    String SQL = "Update linea SET nombrelinea='" + miCamlinea.toUpperCase() + "' where idlinea='" + numero + "'";
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
