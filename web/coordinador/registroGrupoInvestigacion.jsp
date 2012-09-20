<%-- 
    Document   : registroGrupoInvestigacion
    Created on : 19-sep-2012, 14:17:22
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
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nombreGrupo = request.getParameter("nombreGrupo");
            String idprogram = request.getParameter("idprograma");
                
            if ((nombreGrupo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre del Grupo');</script>");
            } else {
                int numero = Integer.parseInt(idprogram);
                String SQLIden = "Select nombregrupoinvestigacion from grupoinvestigacion where nombregrupoinvestigacion ='" + nombreGrupo.toUpperCase() + "'";
                
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Grupo ya Esta Registrado');</script>");              
                }
                else {
                    String SqlInsert = "insert into grupoinvestigacion  (idprograma,nombregrupoinvestigacion)  values('" + numero + "','" + nombreGrupo.toUpperCase() + "');";
                        
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
