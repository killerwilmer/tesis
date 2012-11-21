<%-- 
    Document   : actualizarsublinea
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
            String miSublinea = request.getParameter("desublinea");
            String numero = request.getParameter("idsublinea");
            String milineactualizar = request.getParameter("idlineactualizar");
            //out.print("<script languaje = javascript>alert('Nombre del Campo Ya Existe');</script>");
            if ((miSublinea.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre de la Sub-Linea');</script>");
            } else if (milineactualizar.equals("*")) {        
                    String SqlNombre = "Select nombresublinea from sublinea where nombresublinea = '" + miSublinea.toUpperCase() + "'";
                    if (control.iden(SqlNombre)) {
                        out.print("<script languaje = javascript>showNoticeToast('Nombre de la Sub-Linea Ya Existe');</script>");
                    } else {
                        String SQL = "Update sublinea SET nombresublinea='" + miSublinea.toUpperCase() + "' where idsublinea='" + numero + "'";
                        if (control.ejecutarOperacion(SQL)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Actualizados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Actualizar los Datos');</script>");
                        }
                    }
            } else if (!milineactualizar.equals("*")) {   
                        int idlin = Integer.parseInt(milineactualizar);
                        String SQL = "Update sublinea SET idlinea='" + idlin + "', nombresublinea='" + miSublinea.toUpperCase() + "' where idsublinea='" + numero + "'";
                        if (control.ejecutarOperacion(SQL)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Actualizados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Actualizar los Datos');</script>");
                        }
            }
                
        %>
    </body>
</html>
