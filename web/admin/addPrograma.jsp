<%-- 
    Document   : addPrograma
    Created on : 25-mar-2012, 20:53:15
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
    </head>
    <body>
        <br/><br/>
        <h1 id="titulos">Agregar Programa</h1>
        <fieldset id="fiel">
            Codigio<input type="text" name="codigoprograma" maxlength="100" id="codigoprograma"/>
            Nombre<input type="text" name="programa" maxlength="100" id="programa"/>
            <br/><br/>
            <span>
                <select id="combofacultades" name="combofacultades">
                    <option selected="">Seleccione Facultad</option>
                    <%
                        out.print(control.combo("facultad"));
                    %>
                </select>
            </span>
            <br/><br/>                           
            <span ><input id="enviarp" type="submit" value="Guardar" name="enviar"/></span>    
            <br/><br/>
            <div id="resultados" >
            </div>
        </fieldset>
    </body>
</html>





