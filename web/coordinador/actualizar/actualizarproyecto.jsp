<%-- 
    Document   : actualizarproyecto
    Created on : 17/11/2012, 01:59:09 AM
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
        <title>JSP Page</title>
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/mensajespoput.js"></script>
    </head>
    <body>
        <%
            int numero = Integer.parseInt(request.getParameter("idpro"));
            String titulo = request.getParameter("titulo");
            String tituloabreviado = request.getParameter("titucorto");
            //String descripcion = request.getParameter("descripcion");
            String institucion = request.getParameter("institu");
            String estado = request.getParameter("estado");
            String fecha = request.getParameter("fecha");
            String tipo = request.getParameter("tipo");
            int act=Integer.parseInt(request.getParameter("activo"));
            String idinst = request.getParameter("idinstitu");
            //out.print(fecha);
            if ((titulo.length() == 0) ) {
                out.print("<script languaje = javascript>showWarningToast('Digite Titulo Proyecto');</script>");
            } else if ((tituloabreviado.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Titulo Abreviado Proyecto');</script>");
            } else if (fecha.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Fecha');</script>");
            } else {                 
                if (institucion.equals("")) {
                    institucion = "NO TIENE";
                    String SqlInsertusu = "Update institucion SET nombreinstitucion='"+institucion.toUpperCase()+"' where idinstitucion='"+idinst+"'";
                    control.ejecutarOperacion(SqlInsertusu);
                }else {
                    String SqlInsertusu = "Update institucion SET nombreinstitucion='"+institucion.toUpperCase()+"' where idinstitucion='"+idinst+"'";
                    control.ejecutarOperacion(SqlInsertusu);
                    
                    int etapaproyecto = Integer.parseInt(estado);
                    
                    String SQL = "Update proyecto SET tituloproyecto='"+titulo.toUpperCase()+"', titulopequeproyecto='"+tituloabreviado.toUpperCase()+"', etapaproyecto='"+etapaproyecto+"', fechainicioproyecto='"+fecha+"', tipoproyecto='"+tipo+"', esstadoproyecto='"+act+"' where idproyecto='" + numero + "'";
                    //out.print(SQL);
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
