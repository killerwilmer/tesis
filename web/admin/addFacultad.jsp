<%-- 
    Document   : formEtapa
    Created on : 29/10/2011, 12:27:31 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page import="java.util.StringTokenizer"%>
<%@page language="java" import="java.util.Enumeration" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>
<% ConectaDb control = new ConectaDb(); %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <script type="text/javascript" src="funciones.js"></script>
    </head>
    <body >
            <br/><br/>
            <h1 id="titulos">Agregar Facultad</h1>
            <fieldset id="fiel">
                Codigio<input type="text" name="codigo" maxlength="100" id="codigo"/>
                Nombre<input type="text" name="facultad1" maxlength="100" id="facultad1"/>
                <br/><br/>                           
                <span><input id="enviar" type="submit" value="Guardar" name="enviar"/></span>
                <br/><br/>
                <div id="resultados" >
                </div>
            </fieldset>
    </body>
</html>