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
            String idetapa = request.getParameter("idetapas");
            String porcentaje = request.getParameter("porcent");
            String nomaspecto = request.getParameter("nomaspecto");
            String nomindicador = request.getParameter("nomindicador");
              
            if ((idetapa.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Etapa');</script>");
            }else if (porcentaje.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Digite Un Porcentaje');</script>");
            } 
            else if (nomaspecto.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Digite Aspecto');</script>");
            } else if (nomindicador.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Digite Indicador');</script>");
            } else {
                int numero = Integer.parseInt(idetapa);
                int idaspecto = control.darTipoUsuario("select ", "idaspecto", " from aspecto, etapa where aspecto.idetapa=etapa.idetapa and etapa.idetapa ='" + numero + "' and nombreaspecto='" + nomaspecto.toUpperCase() + "';");
                String SQLIdenli = "Select nombreaspecto from aspecto, etapa where aspecto.idetapa=etapa.idetapa and etapa.idetapa ='" + numero + "' and aspecto.nombreaspecto ='" + nomaspecto.toUpperCase() + "';";
                String SQLIndicador = "Select nombreindicador from indicador, aspecto where indicador.idaspecto=aspecto.idaspecto and aspecto.idaspecto='" + idaspecto + "' and indicador.nombreindicador ='" + nomindicador.toUpperCase() + "';";
                if (control.iden(SQLIdenli)) {
                    out.print("<script languaje = javascript>showNoticeToast('Aspecto ya Existe en la Etapa');</script>");
                } //String SQLIaspecto = "Select nombreaspecto from aspecto where nombreaspecto ='" + nomaspecto.toUpperCase() + "'";
                else {
                    String SqlInsertusu = "insert into aspecto(idetapa, nombreaspecto, porcentaje) values('" + numero + "','" + nomaspecto.toUpperCase()+ "','" + porcentaje+ "');";
                    if (control.ejecutarOperacion(SqlInsertusu)) {
                        out.print("<script languaje = javascript>showSuccessToast('Apecto Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }
                }
                    
                if (idaspecto != 0) {
                    if (control.iden(SQLIndicador)) {
                        out.print("<script languaje = javascript>showNoticeToast('Indicador ya Existe en el Aspecto');</script>");
                    } else {
                        String SqlInsertusu = "insert into indicador(idaspecto, nombreindicador) values('" + idaspecto + "','" + nomindicador.toUpperCase() + "');";
                            
                        if (control.ejecutarOperacion(SqlInsertusu)) {
                            out.print("<script languaje = javascript>showSuccessToast('Indicador Insertados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                        }
                    }
                } else {
                    int idasp = control.darTipoUsuario("select ", "idaspecto", " from aspecto where nombreaspecto='" + nomaspecto.toUpperCase() + "';");
                    String SqlInsertusu = "insert into indicador(idaspecto, nombreindicador) values('" + idasp + "','" + nomindicador.toUpperCase() + "');";
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
