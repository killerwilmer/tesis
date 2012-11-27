<%-- 
    Document   : actualizaraindicador
    Created on : 21/11/2012, 06:05:49 PM
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
            String miindicador = request.getParameter("desa");
            String numero = request.getParameter("ida");
            String numeroasp = request.getParameter("idaspec");
            String miaspectoactualizar = request.getParameter("idaspactualiz");
            //out.print("<script languaje = javascript>alert('Nombre del Campo Ya Existe');</script>");
            if ((miindicador.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre de Indicador');</script>");
            } else if (miaspectoactualizar.equals("*")) {
                //String SqlNombre = "Select nombreindicador from indicador where nombreindicador = '" + miindicador.toUpperCase() + "'";
                    
                String SQLIndic = "Select nombreindicador from indicador, aspecto where indicador.idaspecto=aspecto.idaspecto and aspecto.idaspecto='" + numeroasp + "' and indicador.nombreindicador ='" + miindicador.toUpperCase() + "';";
                    
                if (control.iden(SQLIndic)) {
                    out.print("<script languaje = javascript>showNoticeToast('Indicador Ya Existe en Aspecto Actual');</script>");
                } else {
                    String SQL = "Update indicador SET nombreindicador='" + miindicador.toUpperCase() + "' where idindicador='" + numero + "'";
                    if (control.ejecutarOperacion(SQL)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Actualizados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Actualizar los Datos');</script>");
                    }
                }
            } else if (!miaspectoactualizar.equals("*")) {
                int idlin = Integer.parseInt(miaspectoactualizar);
                    
                String SQLIndic = "Select nombreindicador from indicador, aspecto where indicador.idaspecto=aspecto.idaspecto and aspecto.idaspecto='" + idlin + "' and indicador.nombreindicador ='" + miindicador.toUpperCase() + "';";
                if (control.iden(SQLIndic)) {
                    out.print("<script languaje = javascript>showNoticeToast('Indicador Ya Existe en Aspecto Actual');</script>");
                } else {
                    String SQL = "Update indicador SET idaspecto='" + idlin + "', nombreindicador='" + miindicador.toUpperCase() + "' where idindicador='" + numero + "'";
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
