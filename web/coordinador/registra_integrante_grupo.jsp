<%-- 
    Document   : registra_integrante_grupo
    Created on : 19/11/2012, 05:10:03 PM
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
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>

    </head>
    <body>
        <%
            String idGru = null;
            String idInt = null;           
            idGru = request.getParameter("codGru");
            idInt = request.getParameter("codInt");

            if ((idGru.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('No ha escojido Grupo Investigación');</script>");
            } else if (( idInt == null )) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione Integrante');</script>");
            } else {
                int idGrupo = Integer.parseInt(idGru);
                int idIntegrante = Integer.parseInt(idInt);

                    String SqlInsert = "insert into usuariogrupoinvestigacion (idusuario, idgrupoinvestigacion) values(" + idIntegrante + "," + idGrupo + ");";

                    if (control.ejecutarOperacion(SqlInsert)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }            
            }
        %>
    </body>
</html>
