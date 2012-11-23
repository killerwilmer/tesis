<%-- 
    Document   : recive
    Created on : 24-abr-2012, 10:14:20
    Author     : Admin
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    HttpSession sesionOk = request.getSession();
    String codigoEst = (String) sesionOk.getAttribute("estudiante");
    int idEstudiante = (Integer) sesionOk.getAttribute("idEstudiante");
    //int idDocente = (Integer) sesionOk.getAttribute("idDocente");
    int idProyecto = (Integer) sesionOk.getAttribute("idProyecto");
    int idDocente = (Integer) sesionOk.getAttribute("idDocente");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardando Correciones</title>
    </head>
    <body>
        <h1>Guardando Correciones</h1>
    </body>
</html>
<%
    String editor = request.getParameter("editor2");
    java.util.Calendar fecha = java.util.Calendar.getInstance();
    String miFecha = fecha.get(java.util.Calendar.DATE) + "/"
            + fecha.get(java.util.Calendar.MONTH) + "/"
            + fecha.get(java.util.Calendar.YEAR);

    //out.print(idProyecto + " " + idDocente + " " + miFecha + " " + editor);

    if (!editor.equals("")) {
        try {

            String SqlInsert = "insert into correccion (idproyecto,idusuario,fechacorreccion,temacorreccion) values ("+idProyecto+","+idDocente+",'"+miFecha+"','"+editor+"');";
            if (control.ejecutarOperacion(SqlInsert)) {
                out.print("Exito");
            } else {
                out.print("Error" + SqlInsert);
            }

        } catch (Exception e) {
            out.println(e.toString());
        }
    }
%>