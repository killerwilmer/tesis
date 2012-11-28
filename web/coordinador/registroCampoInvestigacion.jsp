<%-- 
    Document   : registroCampoInvestigacion
    Created on : 19-sep-2012
    Author     : usuarui
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            String combolinea = request.getParameter("combolin");
            String desCampo = request.getParameter("descampo");
                
            if ((nombreCampo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre del Campo');</script>");
            } else if (combolinea.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Línea de Investigación');</script>");
            } else {
                int numero = Integer.parseInt(combolinea);
                String SQLIdenli = "Select nombrecampo from campo where nombrecampo ='" + nombreCampo.toUpperCase() + "'";
                if (control.iden(SQLIdenli)) {
                    out.print("<script languaje = javascript>showNoticeToast('Campo Ya Esta Registrado');</script>");
                }else{
                    if (desCampo.length() == 0) {
                    desCampo = "Null";
                }
                String SqlInsert = "insert into campo  (idlinea,nombrecampo,descripcioncampo)  values('" + numero + "','" + nombreCampo.toUpperCase() + "','" + desCampo + "');";
                if (control.ejecutarOperacion(SqlInsert)) {
                    out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                } else {
                    out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                }}
            }
        %>
    </body>
</html>
