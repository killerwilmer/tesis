<%-- 
    Document   : addproyecto
    Created on : 30-abr-2012, 8:50:57
    Author     : usuarui
--%>

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
            String titulo = request.getParameter("titulo");
            String tituloabreviado = request.getParameter("titucorto");
            //String descripcion = request.getParameter("descripcion");
            String institucion = request.getParameter("institu");
            String estado = request.getParameter("estado");
            String fecha = request.getParameter("fecha");
            String tipo = request.getParameter("tipo");
            String activo = request.getParameter("activo");


            if ((titulo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Titulo Proyecto');</script>");
            } else if (tituloabreviado.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Digite Titulo Abreviado');</script>");
            }  else if (fecha.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Fecha');</script>");
            } else if (estado.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Estado');</script>");
            } else if (tipo.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Tipo');</script>");
            } else {
                if (institucion.equals("")) {
                    institucion = "NO TIENE";
                }
                String CosultaTitulo = "Select * from proyecto where tituloproyecto = '" + titulo.toUpperCase() + "'";
                String ConsultaInstitucion = "Select * from institucion where nombreinstitucion = '" + institucion.toUpperCase() + "'";
                if (control.iden(CosultaTitulo)) {
                    out.print("<script languaje = javascript>showNoticeToast('Proyecto Ya Existe');</script>");
                } else {
                    if (!control.iden(ConsultaInstitucion)) {
                        String SqlInsertusu = "insert into institucion (nombreinstitucion) values('" + institucion.toUpperCase() + "');";
                        control.ejecutarOperacion(SqlInsertusu);

                        int idInstitucion = control.darTipoUsuario("select ", "idinstitucion", " from institucion where nombreinstitucion='" + institucion.toUpperCase() + "';");
                        int etapaproyecto = Integer.parseInt(estado);
                        int estadoproyecto = Integer.parseInt(activo);
                        String SqlInsert = "insert into proyecto (idinstitucion, tituloproyecto,titulopequeproyecto, etapaproyecto,fechainicioproyecto, tipoproyecto, esstadoproyecto) values('" + idInstitucion + "','" + titulo.toUpperCase() + "','" + tituloabreviado + "','" + etapaproyecto + "','" + fecha + "','" + tipo + "','" + estadoproyecto + "');";

                        if (control.ejecutarOperacion(SqlInsert)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                        }

                    } else {
                        int idInstitucion = control.darTipoUsuario("select ", "idinstitucion", " from institucion where nombreinstitucion='" + institucion.toUpperCase() + "';");
                        int etapaproyecto = Integer.parseInt(estado);
                        int estadoproyecto = Integer.parseInt(activo);
                        String SqlInsert = "insert into proyecto (idinstitucion, tituloproyecto,titulopequeproyecto, etapaproyecto,fechainicioproyecto, tipoproyecto, esstadoproyecto) values('" + idInstitucion + "','" + titulo.toUpperCase() + "','" + tituloabreviado + "','" + etapaproyecto + "','" + fecha + "','" + tipo + "','" + estadoproyecto + "');";

                        if (control.ejecutarOperacion(SqlInsert)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                        }
                    }
                }

            }
        %>     
    </body>
</html>

