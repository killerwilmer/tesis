<%-- 
    Document   : registronuevoindicador
    Created on : 21/11/2012, 09:36:08 AM
    Author     : Alex
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
            String nomind = request.getParameter("idasn");
            String idaspecto = request.getParameter("desaspn");
   
            if ((idaspecto.length() == 0)) {            
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre Indicador');</script>");              
            }else {
                int numero = Integer.parseInt(nomind);
                String SQLIden = "Select nombreindicador from indicador where nombreindicador ='" + idaspecto.toUpperCase() + "'";
                    
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Indicador ya existe');</script>");
                } else {
                    String SqlInsert = "insert into indicador  (idaspecto, nombreindicador)  values('" + numero + "','" + idaspecto.toUpperCase() + "');";
                        
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
