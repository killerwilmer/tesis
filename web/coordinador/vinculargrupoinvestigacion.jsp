<%-- 
    Document   : vinculargrupoinvestigacion
    Created on : 19/11/2012, 03:19:46 PM
    Author     : Alex
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idLlega = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es Obligación Identificarse"/>
</jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
            
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
            
        <script type="text/javascript" src="wizard/js/jquery.form.js"></script>     
        <script type="text/javascript" src="wizard/js/jquery-ui-1.8.5.custom.min.js"></script>
        <script type="text/javascript" src="wizard/js/jquery.form.wizard.js"></script>
        <script>
            // Limpiar el div del grupo
            function clearAsesor()
            {
                $("#grupo").val("");
                $("#result").empty();
            }
            // Limpiar el div del Integrante
            function clearIntegrante()
            {
                $("#integrante").val("");
                $("#result_integrante").empty();
            }
            
            // Para buscar el Grupo
            $(document).ready(function(){             
                $("#grupo").autocomplete("wizard/grupo_buscar.jsp");
                $('#grupo').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result").html( "<p>Nombre<br/><input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/><input disabled=\"true\" type=\"text\" name=\"idGru\" id=\"idGru\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
        //Para buscar el estudiante
        $(document).ready(function(){
            $("#integrante").autocomplete("wizard/integrante_buscar.jsp");
            $('#integrante').result(function(event, data, formatted) {
                if (data) {
                    // Extraemos los valores
                    var name = data[0];
                    var id = data[1];
                    // Mostramos los resultados
                    $("#result_integrante").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/> <input disabled=\"true\" type=\"text\" name=\"idInt\" id=\"idInt\" readonly=\"true\" value=\""+id+"\"/>");
                }
            });
        });
        </script>
    </head>
    <body>
        <h1>Vinculacion de Integrantes al Grupo Investigación</h1>
        <fieldset id="fieladvinculacionactores">
            <div id="demoWrapper">        
                <h5 id="status"></h5>
                <form id="demoForm" method="post" action="json.html" class="bbq">
                    <div id="state"></div>
                    <div id="fieldWrapper">
                        
                        <span class="step" id="first">
                            <!-- Escojemos el prooyecto y nos llevamos el id del poryecto -->
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 1: Selección Grupo Investigación</span> <hr />
                            <br/><label for="surname">Digite Nombre del Grupo</label><br />
                            <input type="text" id="grupo" name="grupo" class="input_field_12em"/>  <input id="reset" value="Reset" type="button" onclick="clearGrupo()"/>                        
                            <div id="result"></div>
                        </span>

                        <span id="finland1" class="step">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 2 : Selección de Integrante</span><hr />
                            <br/><label for="surname">Digite Nombre</label><br />
                            <input type="text" id="integrante" name="integrante" class="input_field_12em"/> <input id="reset" value="Reset" type="button" onclick="clearIntegrante()"/>
                            <span ><input id="boton_estu" type="button" value="Vincular Integrante" name="enviar"/></span>
                            <div id="result_integrante"></div>
                            <div id="resultados_inte" ></div>
                        </span>
                            
                        <span id="confirmation" class="step submit_step">
                            <span class="font_normal_07em_black">Información Final</span><br />
                        </span>
                        <span class="step" id="details">
                            <span class="font_normal_07em_black">Hidden step</span><br />
                            <span>This step is not possible to see without using the show method</span>
                        </span>
                    </div>
                    <div id="demoNavigation">
                        <br/><input class="navigation_button" id="next" name="next" value="Ver Datos" type="submit"/>
                    </div>
                </form>
                <hr />
                    
                <p id="data"></p>
            </div>
        </fieldset>
    </body>
</html>

<script type="text/javascript">
    $(function(){		
        $("#demoForm").formwizard({ 
            formPluginEnabled: true,
            validationEnabled: true,
            focusFirstInput : true,
            formOptions :{
                success: function(data){$("#status").fadeTo(500,1,function(){ $(this).html("Proyecto vinculado Satisfactoriamente!").fadeTo(5000, 0); })},
                beforeSubmit: function(data){$("#data").html("Datos enviados al servidor: " + $.param(data));},
                dataType: 'json',
                resetForm: false
            }
        }
    );
                
    var remoteAjax = {}; // empty options object
                
    $("#demoForm .step").each(function(){ // for each step in the wizard, add an option to the remoteAjax object...
            remoteAjax[$(this).attr("id")] = {
                url : "wizard/store_in_database.html", // the url which stores the stuff in db for each step
                dataType : 'json',
                beforeSubmit: function(data){$("#data").html("Datos enviados Correctamente: " + $.param(data))},
                success : function(data){
                            
                    if(data){ //data is either true or false (returned from store_in_database.html) simulating successful / failing store
                        $("#data").append("    .... Datos Guardados Correctamente");
                    }else{
                        alert("Error al guardar los datos.");
                    }                            
                    return data; //return true to make the wizard move to the next step, false will cause the wizard to stay on the CV step (change this in store_in_database.html)
                }
            };
        });
                
        $("#demoForm").formwizard("option", "remoteAjax", remoteAjax); // set the remoteAjax option for the wizard
    });
</script>
