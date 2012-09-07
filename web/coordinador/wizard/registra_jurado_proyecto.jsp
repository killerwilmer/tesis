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
        <link type="text/css" href="../../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>

    </head>
    <body>
        <%
            String idProye = null;
            String idJura = null;           
            idProye = request.getParameter("codProy");
            idJura = request.getParameter("codJura");

            if ((idProye.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('No ha escojido Proyecto');</script>");
            } else if (( idJura == null )) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione el Asesor');</script>");
            } else {
                int idProyecto = Integer.parseInt(idProye);
                int idJurado = Integer.parseInt(idJura);
                String SqlIdenumero = "select idusuario from usuarioevaluador where idusuario=" + idJurado + "and idproyecto=" + idProyecto + "";
                if (control.iden(SqlIdenumero)) {
                    out.print("<script languaje = javascript>showNoticeToast('Jurado ya vinculado a este proyecto');</script>");
                } else {
                    String SqlInsert = "insert into usuarioevaluador (idproyecto,idusuario) values(" + idProyecto + "," + idJurado + ");";

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