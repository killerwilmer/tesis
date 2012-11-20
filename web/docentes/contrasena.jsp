<%-- 
    Document   : listafacultad
    Created on : 14-abr-2012, 3:48:52
    Author     : usuarui
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<%
    HttpSession sesionOk = request.getSession();
    String docentes = (String) sesionOk.getAttribute("docente");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Docente/estiloFormularios.css" />

    </head>
    <body>
        <h1 class="actualizar">Cambiar contraseña</h1>
        <form id="from1" name="form1" action="contrasena.jsp" method="post">
            
            <fieldset id="fiel">      
                <h3>Nueva Contraseña:</h3>
                <input type="password" name="contra" id="contra">
                <input type="submit" name="enviar" id="enviar" value="Cambiar">
            </fieldset>
            
        </form>
    </body>
</html>

<%
    if (request.getParameter("enviar") != null) {
        String contra = request.getParameter("contra");
        
        if(contra != null){
            String sql = "UPDATE usuario SET contrasena='"+contra+"' WHERE codigousuario='" + docentes + "';";
            control.ejecutarOperacion(sql);
            out.print("<script>window.location='index.jsp'</script>");
        }

        //out.print(contra);
    }
%>