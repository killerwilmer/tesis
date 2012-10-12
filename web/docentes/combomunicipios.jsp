<%-- 
    Document   : listafacultad
    Created on : 14-abr-2012, 3:48:52
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<%
    HttpSession sesionOk = request.getSession();
    String docentes = (String) sesionOk.getAttribute("docente");

    String sqlString = "SELECT * FROM programa WHERE idfacultad=" + request.getParameter("elegido") + ";";

    ResultSet resultado = control.consultas(sqlString);

    while (resultado.next()) {
        out.print("<option value='" + resultado.getString("idprograma") + "'>" + resultado.getString("nombreprograma") + "</option>");
    }
%>