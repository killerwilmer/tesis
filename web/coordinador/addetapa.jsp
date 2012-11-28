<%-- 
    Document   : addetapa
    Created on : 03-may-2012, 11:45:55
    Author     : usuarui
--%>

<%@page import="org.w3c.dom.Document"%>
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
        <script type="text/javascript" src="../recursos/Mensajes/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nometapa = request.getParameter("nombre");
            String idprogram = request.getParameter("idprograma");
                
            if ((nometapa.length() == 0)) {            
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre');</script>");              
            } else if ((idprogram.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Programa');</script>");
            } else {
                int numero = Integer.parseInt(idprogram);
                String SQLIden = "Select nombreetapa from etapa where nombreetapa ='" + nometapa.toUpperCase() + "'";
                    
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Etapa ya existe');</script>");
                } else {
                    String SqlInsert = "insert into etapa  (idprograma,nombreetapa)  values('" + numero + "','" + nometapa.toUpperCase() + "');";
                        
                    if (control.ejecutarOperacion(SqlInsert)) {
                         out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }                       
                }
            }
        %>
    </body>
</html>


