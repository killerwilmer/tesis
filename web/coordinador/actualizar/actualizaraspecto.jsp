<%-- 
    Document   : actualizaraspecto
    Created on : 21/11/2012, 09:01:52 AM
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
            String miaspecto = request.getParameter("desasp");
                String numero = request.getParameter("idas");
                String miaspectoactualizar = request.getParameter("idaspactualizar");
                //out.print("<script languaje = javascript>alert('Nombre del Campo Ya Existe');</script>");
                if ((miaspecto.length() == 0)) {
                    out.print("<script languaje = javascript>showWarningToast('Digite Nombre de Aspecto');</script>");
                } else if (miaspectoactualizar.equals("*")) {
                    String SqlNombre = "Select nombreaspecto from aspecto where nombreaspecto = '" + miaspecto.toUpperCase() + "'";
                    if (control.iden(SqlNombre)) {
                        out.print("<script languaje = javascript>showNoticeToast('Nombre del Aspecto Ya Existe');</script>");
                    } else {
                        String SQL = "Update aspecto SET nombreaspecto='" + miaspecto.toUpperCase() + "' where idaspecto='" + numero + "'";
                        if (control.ejecutarOperacion(SQL)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Actualizados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Actualizar los Datos');</script>");
                        }
                    }
                } else if (!miaspectoactualizar.equals("*")) {
                    int idlin = Integer.parseInt(miaspectoactualizar);
                    String SQLIdenli = "Select nombreaspecto from aspecto, etapa where aspecto.idetapa=etapa.idetapa and etapa.idetapa ='" + idlin + "' and aspecto.nombreaspecto ='" + miaspecto.toUpperCase() + "';";
                    if (control.iden(SQLIdenli)) {
                        out.print("<script languaje = javascript>showNoticeToast('Aspecto ya Existe en la Etapa');</script>");
                    } else {
                        String SQL = "Update aspecto SET idetapa='" + idlin + "', nombreaspecto='" + miaspecto.toUpperCase() + "' where idaspecto='" + numero + "'";
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
