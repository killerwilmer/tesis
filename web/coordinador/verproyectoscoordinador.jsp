<%-- 
    Document   : verproyectoscoordinador
    Created on : 28/11/2012, 06:08:45 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>
<%@page import="java.util.Vector"%>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idLlega = "";
    int idProyecto=0;
    String desProyecto = "";
    String titulo = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
        idProyecto = Integer.parseInt(request.getParameter("rowCoor"));

        String inicio2 = "select ";
        String campo2 = "descripcionproyecto";
        String fin2 = " from proyecto where idproyecto=" + idProyecto + ";";
        desProyecto = control.retornoCodigo(inicio2, campo2, fin2);

        String inicio3 = "select ";
        String campo3 = "tituloproyecto";
        String fin3 = " from proyecto where idproyecto=" + idProyecto + ";";
        titulo = control.retornoCodigo(inicio3, campo3, fin3);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $(document).ready(function() {
                $(".volverproyect").click(function(event) {
                    $("#wraper").load('tables/reporteestudiantes.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volverproyect" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 style="margin-top: -40px;"><%out.print(titulo);%></h1>
        <form action="guardarProyecto.jsp" method="post">
                <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10"><%=desProyecto%></textarea>
        </form>  
    </body>
</html>

<script>
    instance = CKEDITOR.instances['editor1'];
    if(instance)
    {
        CKEDITOR.remove(instance);
    }
    CKEDITOR.replace( 'editor1', {toolbar : [['Maximize'],['FontSize']]});
</script>
