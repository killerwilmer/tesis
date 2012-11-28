<%-- 
    Document   : formEtapa
    Created on : 29/10/2011, 12:27:31 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    ConectaDb cont = new ConectaDb();
    String idLlega = "";
    String nombrePrograma="";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
        String inicio = "select ";
        String campo = "nombreprograma";
        String fin = " from programa where idprograma='" + idLlega + "';";
        nombrePrograma = cont.retornoCodigo(inicio, campo, fin);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="funciones.js"></script>

        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
    </head>
    <body>
        <form id="formu">
            <h1>Etapas del Proceso de Investigación</h1>        
            <fieldset id="fiel">
                Nombre<input type="text" name="etapa" id="etapa"/><br/>
                <span>
                    Programa <input type="text" name="programa" id="programa" disabled="true" value="<%out.print(nombrePrograma);%>"/><br/>
                    <input type="hidden" name="idPrograma" id="idPrograma" value="<%out.print(idLlega);%>">
                </span><br/>
                <span><input id="enviar" type="submit" value="Guardar" name="enviar"/></span>
                <br/>
                <div id="resultados" >
                </div>
            </fieldset>
        </form> 
    </body>
</html>
