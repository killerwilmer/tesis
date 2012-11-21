<%-- 
    Document   : registroCampoInvestigacion
    Created on : 19-sep-2012
    Author     : usuarui
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nombreCampo = request.getParameter("nombreCampo");
            String desCampo = request.getParameter("descampo");
                
            if ((nombreCampo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre del Campo');</script>");
            }       
            else {           
                    String SqlInsert = "insert into campo  (nombrecampo,descripcioncampo)  values('" + nombreCampo.toUpperCase() + "','" + desCampo + "');";                      
                    if (control.ejecutarOperacion(SqlInsert)) {
                         out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }                             
            }
        %>
    </body>
</html>
