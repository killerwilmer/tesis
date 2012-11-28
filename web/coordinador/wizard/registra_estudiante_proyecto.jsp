<%-- 
    Document   : insertarcoordinador
    Created on : 13-abr-2012, 18:59:23
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
            String idProye = null;
            String idEstu = null;           
            idProye = request.getParameter("codProy");
            idEstu = request.getParameter("codEstu");

            if ((idProye.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('No ha escojido Proyecto');</script>");
            } else if (( idEstu == null )) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione el Estudiante');</script>");
            } else {
                int idProyecto = Integer.parseInt(idProye);
                int idEstudiante = Integer.parseInt(idEstu);
                String SqlIdenumero = "select idusuario from usuarioproyecto where idusuario=" + idEstudiante + "";
                if (control.iden(SqlIdenumero)) {
                    out.print("<script languaje = javascript>showNoticeToast('Estudiante ya vinculado a un Proyecto');</script>");
                } else {
                    String SqlInsert = "insert into usuarioproyecto (idproyecto,idusuario) values(" + idProyecto + "," + idEstudiante + ");";

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