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

    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $(document).ready(function() {
                $(".volverproyectodocc").click(function(event) {
                    $("#wraper").load('tables/reporteestudiantes.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
      
        <img class="volverproyectodocc" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
hhhhhhhhhhhhhhhhhhhhhhhhhhhhh
    </body>
</html>


