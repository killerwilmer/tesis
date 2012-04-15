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
        
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/addcoordinador.css" />
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
        
        <script type="text/javascript">
            function lookup(inputString) {
                if(inputString.length == 0) {
                    $('#suggestions').hide();
                } else {
                    $.post("states.jsp", {queryString: ""+inputString+""}, function(data){
                        if(data.length >0) {
                            $('#suggestions').show();
                            $('#autoSuggestionsList').html(data);
                        }
                    });
                }
            }
            function fill(thisValue) {
                $('#inputString').val(thisValue);
                setTimeout("$('#suggestions').hide();", 200);
            }
        </script>
    </head>
    <body>
        <br/><br/>
        <h1>Asignar Coordinador</h1>
            
            <fieldset id="fiel">
                <div>
                    <div><br/>Digite Nombre del Coordinador   
                        <input type="text" size="30" value="" id="inputString" name="inputString" onkeyup="lookup(this.value);" onblur="fill();" />
                    </div>
                    <div class="suggestionsBox" id="suggestions" style="display: none;">
                        <div class="suggestionList" id="autoSuggestionsList"></div>
                    </div>           
                </div>     
                <span>
                    <select id="comboprograma" name="comboprograma">
                        <option selected="">Seleccione Programa</option>
                        <%
                            out.print(control.comboprograma("programa"));
                        %>
                    </select>
                </span>
                <br><br>
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
