<%-- 
    Document   : registroAspectosIndicadores
    Created on : 20-sep-2012, 14:45:21
    Author     : usuarui
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
            String idetapa = request.getParameter("idetapas");
            String nomaspecto = request.getParameter("nomaspecto");
            String nomindicador = request.getParameter("nomindicador");
            
            if((idetapa.equals("*"))){
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Etapa');</script>");
            }else if(nomaspecto.length()==0){
                out.print("<script languaje = javascript>showWarningToast('Digite Aspecto');</script>");
            }else if(nomindicador.length()==0){
                out.print("<script languaje = javascript>showWarningToast('Digite Indicador');</script>");
            } else{
                int numero = Integer.parseInt(idetapa);
                String SQLIaspecto = "Select nombreaspecto from aspecto where nombreaspecto ='" + nomaspecto.toUpperCase() + "'";
                String SQLIndicador = "Select nombreindicador from indicador where nombreindicador ='" + nomindicador.toUpperCase() + "'";
                if (!control.iden(SQLIaspecto)){
                    String SqlInsertusu = "insert into aspecto(idetapa, nombreaspecto) values('"+numero+"','" +nomaspecto.toUpperCase()+"');";
                    if (control.ejecutarOperacion(SqlInsertusu)) {
                         out.print("<script languaje = javascript>showSuccessToast('Apecto Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }     
                } 
                
                if (!control.iden(SQLIndicador)){
                    int idaspecto = control.darTipoUsuario("select ", "idaspecto", " from aspecto where nombreaspecto='" + nomaspecto.toUpperCase()+ "';");
                    String SqlInsertusu = "insert into indicador(idaspecto, nombreindicador) values('"+idaspecto+"','" +nomindicador.toUpperCase()+"');";
                    if (control.ejecutarOperacion(SqlInsertusu)) {
                         out.print("<script languaje = javascript>showSuccessToast('Indicador Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }     
                } 
            }
            
        %>
    </body>
</html>
