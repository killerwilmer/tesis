<%-- 
    Document   : insertarcoordinador
    Created on : 13-abr-2012, 18:59:23
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>

    </head>
    <body>
        <%
            String idProye = null;
            String idAses = null;           
            idProye = request.getParameter("codProy");
            idAses = request.getParameter("codAses");

            if ((idProye.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('No ha escojido Proyecto');</script>");
            } else if (( idAses == null )) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione el Asesor');</script>");
            } else {
                int idProyecto = Integer.parseInt(idProye);
                int idasesor = Integer.parseInt(idAses);
                String SqlIdenumero = "select idusuario from usuarioasesor where idusuario=" + idasesor + "and idproyecto=" + idProyecto + "";
                if (control.iden(SqlIdenumero)) {
                    out.print("<script languaje = javascript>showNoticeToast('Asesor ya vinculado a este proyecto');</script>");
                } else {
                    String SqlInsert = "insert into usuarioasesor (idproyecto,idusuario) values(" + idProyecto + "," + idasesor + ");";

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