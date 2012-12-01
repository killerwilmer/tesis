<%-- 
    Document   : addcoordinador
    Created on : 11-abr-2012, 22:20:11
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb(); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>   
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="funciones.js"></script>            
        <script>
            jQuery(function(){
                $("#country").autocomplete("states.jsp");
            });
        </script>
    </head>
    <body>
        <br/><br/>
        <h1 id="coor">Asignar Coordinador</h1>
        <fieldset id="fielcoor"><br/>
            <label id="nom">Digite Nombre</label><input type="text" id="country" name="country" class="input_text"/> <br/> 
            <span>
                <select id="comboprograma" name="comboprograma">
                    <option selected="" value="*">Seleccione Programa</option>
                    <%
                        out.print(control.comboprograma("programa"));
                    %>
                </select>
            </span>
            <br/><br/>
            <input type="radio" name="estado" id="sizeSmall" value="1" checked="checked"/>
            <label id="label" for="sizeSmall">Activo</label>
            <input type="radio" name ="estado" id="sizeMed" value ="0"/>
            <label id="label" for="sizeMed">Inactivo</label>
            <br>
            <span ><input id="botoncor" type="submit" value="Guardar" name="enviar"/></span>
            <br/><br/>
            <div id="resultados" ></div>
        </fieldset>                       
    </body>
</html>
