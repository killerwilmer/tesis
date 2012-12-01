<%-- 
    Document   : listausuario
    Created on : 30/11/2012, 01:57:02 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        
        <script type="text/javascript">  
            jQuery(function(){
                $("#usuarios").autocomplete("ediccion/usuario_buscar.jsp");
            });
            
            //Para buscar el estudiante
            $(document).ready(function(){
                $("#usuarios").autocomplete("ediccion/usuario_buscar.jsp");
                $('#usuarios').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#contenedorusuario").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/> <input disabled=\"true\" type=\"text\" name=\"idEst\" id=\"idEst\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
        </script>
    </head>
    <body>
        <br/>
        <div style="margin-top: 20px; text-align: center">
            <label id="nom">Digite Nombre   </label><input type="text" id="usuarios" name="usuarios" class="input_text"/>
        </div><br/>
        <div id="contenedorusuario"></div>
    </body>
</html>
