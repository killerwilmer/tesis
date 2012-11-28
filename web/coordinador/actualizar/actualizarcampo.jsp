<%-- 
    Document   : actualizarcampo
    Created on : 20/11/2012, 04:19:27 AM
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
            String miCam = request.getParameter("nomcampo");
            String miCamdescripcion = request.getParameter("descampo");
            String numero = request.getParameter("idcampoinv");
            //out.print("<script languaje = javascript>alert('Nombre del Campo Ya Existe');</script>");
            if ((miCam.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre del Campo');</script>");
            }  else if ((miCamdescripcion.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Alguna Descripcipón del Campo');</script>");
            }
            else {
                String SqlNombre = "Select nombrecampo from campo where nombrecampo = '" + miCam.toUpperCase() + "'";
                if (control.iden(SqlNombre)) {
                    //out.print("<script languaje = javascript>showNoticeToast('Nombre del Campo Ya Existe');</script>");
                    String SQL = "Update campo SET descripcioncampo='" + miCamdescripcion + "' where idcampo='" + numero + "'";
                    if (control.ejecutarOperacion(SQL)) {
                        out.print("<script languaje = javascript>showSuccessToast('Descrpción del Campo Actualizado Correctamente');</script>");
                    }
                } else {
                    String SQL = "Update campo SET nombrecampo='" + miCam.toUpperCase() + "', descripcioncampo='" + miCamdescripcion + "' where idcampo='" + numero + "'";
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
