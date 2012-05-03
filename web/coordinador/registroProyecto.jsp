<%-- 
    Document   : registroProyecto
    Created on : 18-abr-2012, 22:39:42
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page session="true" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.umariana.control.ConectaDb"%>

<%
 request.setCharacterEncoding("UTF-8");
 response.setContentType("text/html; charset=utf-8");
%>

<% ConectaDb control = new ConectaDb(); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="../recursos/Css/Coordinador/addregistroproyecto.css">
        <script type="text/javascript" src="../recursos/Js/jquery-1.7.1.js"></script>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        
    
        
        <script type="text/javascript">
            function lookup(inputString) {
                if(inputString.length == 0) {
                    $('#suggestions').hide();
                } else {
                    var local;
                    for (var i = 0; i < formulari.estado.length; i++) {
                        
                        
                        if (formulari.estado[i].checked) {
                            local = formulari.estado[i].value;
                            break;
                        }
                        
                    }
                    
                    $.post("states.jsp", {queryString: ""+inputString+"", email:""+local+""}, function(data){
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
        
        <script>
            jQuery(function(){
                $("#country").autocomplete("states2.jsp");
            });
        </script>
        
    </head>
    <body>
        <div id="busqueda">
              <table align="center">
                <tr>
                    <td>
                        <center><input type="submit" value="Ver Factura" name="factura" /></center>
                    </td>
                </tr>                
                    <tr>                        
                        <td>
                            <center>Buscar Productos</center><br>
                            <div>
                                <center><input type="text" name="txtBuscar" size="30" value="" id="inputString" autocomplete="off" onkeyup="lookup(this.value);" />
                                    <br/><form id="fomrmulari" name="formulari">
                                        <input type="radio" name="estado" id="estado" value="2" onclick="recuperaResidencia();">Docente    
                                        <input type="radio" name="estado"  id="estado1" value="1" onclick="recuperaResidencia();">Estudiante</form></center>
                            </div>
                            <br>
                            <div class="suggestionsBox" id="suggestions" style="display: none;">
                            <div class="suggestionList" id="autoSuggestionsList">
                            </div>
                            </div>                            
                        </td>
                    </tr>
            </table>
        </div>
        <div id="formulario">
            <br/>
            <h1 id="titulos">Asignar Rol a Proyecto</h1>
            <fieldset id="fiel">
                Codigio<input type="text" name="codigo" maxlength="100" id="codigo"/><br/>
                <label id="nom">Digite Nombre</label><input type="text" id="country" name="country" class="input_text"/>
                <label>Rol</label>
                <select id="genero" name="rol"  class="required">
                    <option selected="">Seleccione Rol</option>
                    <option value="estudiante">Estudiante</option>
                    <option value="asesor">Asesor</option>
                    <option value="jurado">Jurado</option>
                </select>  
            </fieldset><br/>
            <input type="submit" name="asignar" value="Asignar" align="center" id="btnasignar">
        </div>
    </body>
</html>
