<%-- 
    Document   : recive
    Created on : 24-abr-2012, 10:14:20
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("estudiante") == null) {
%> 
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es Obligación Identificarse"/>
</jsp:forward>
<%        } else {
    String codigoEst = (String) sesionOk.getAttribute("estudiante");
    int idEstudiante = (Integer) sesionOk.getAttribute("idEstudiante");
    String idPro = (String) sesionOk.getAttribute("idProyecto");
    int idProyecto = Integer.parseInt(idPro.trim());
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizando el Documento</title>
    </head>
    <body>
        <h1>Guardando el proyecto</h1>
    </body>
</html>
<%
        String editor = request.getParameter("editor1");

        if (!editor.equals("")) {
            try {

                String SqlInsert = "UPDATE proyecto SET descripcionproyecto = '" + editor + "' WHERE idproyecto=" + idProyecto + ";";
                if (control.ejecutarOperacion(SqlInsert)) {
                    out.print("Exito");
                } else {
                    out.print("Error");
                }

            } catch (Exception e) {
                out.println(e.toString());
            }
        }
//UPDATE proyecto SET descripcionproyecto = 'nuevo comentario' WHERE idproyecto=1;
    }%>