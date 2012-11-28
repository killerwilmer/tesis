<%-- 
    Document   : index
    Created on : 5/09/2012, 11:26:50 AM
    Author     : skynet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idSe = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
    }
%>
<html>
    <head>
        <title>JQuery Form Wizard</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" ></meta>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
            
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="wizard/funciones.js"></script>
            
        <script type="text/javascript" src="wizard/js/jquery.form.js"></script>     
        <script type="text/javascript" src="wizard/js/jquery-ui-1.8.5.custom.min.js"></script>
        <script type="text/javascript" src="wizard/js/jquery.form.wizard.js"></script>
            
        <script type="text/javascript">
            // Limpiar el div de asesor
            function clearJurado()
            {
                $("#jurado").val("");
                $("#result_jurado").empty();
            }
            // Limpiar el div de asesor
            function clearAsesor()
            {
                $("#asesor").val("");
                $("#result_asesor").empty();
            }
            // Limpiar el div de esdudiante
            function clearEstudiante()
            {
                $("#estudiante").val("");
                $("#result_estudiante").empty();
            }
            // Limpiar el div de proyecto
            function clearProyecto()
            {
                $("#proyecto").val("");
                $("#result").empty();
            }
            
            // Para buscar el proyecto
            $(document).ready(function(){             
                $("#proyecto").autocomplete("wizard/proyecto_buscar.jsp");
                $('#proyecto').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result").html( "<p>Nombre<br/><input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/><input disabled=\"true\" type=\"text\" name=\"idPro\" id=\"idPro\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
            //Para buscar el estudiante
            $(document).ready(function(){
                $("#estudiante").autocomplete("wizard/estudiente_buscar.jsp");
                $('#estudiante').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_estudiante").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/> <input disabled=\"true\" type=\"text\" name=\"idEst\" id=\"idEst\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
            //Para buscar el docente
            $(document).ready(function(){
                $("#asesor").autocomplete("wizard/docente_buscar.jsp");
                $('#asesor').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_asesor").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/><input disabled=\"true\" type=\"text\" name=\"idAse\" id=\"idAse\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
            //Para buscar el asesor
            $(document).ready(function(){
                $("#jurado").autocomplete("wizard/docente_buscar.jsp");
                $('#jurado').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_jurado").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/><input disabled=\"true\" type=\"text\" name=\"idJur\" id=\"idJur\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
        </script>
            
    </head>
    <body>
        <h1>Vinculacion de Actores al Proyecto</h1>
        <fieldset id="fieladvinculacionactores">
            <div id="demoWrapper">        
                <h5 id="status"></h5>
                <form id="demoForm" method="post" action="json.html" class="bbq">
                    <div id="state"></div>
                    <div id="fieldWrapper">

                        <span class="step" id="first">
                            <!-- Escojemos el prooyecto y nos llevamos el id del poryecto -->
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 1: Selección del Proyecto</span> <hr />
                            <br/><label for="surname">Digite Nombre del Proyecto</label><br />
                            <input type="text" id="proyecto" name="proyecto" class="input_field_12em"/>  <input id="reset" value="Reset" type="button" onclick="clearProyecto()"/>                        
                            <div id="result"></div>
                        </span>
                        
                        <span id="finland1" class="step">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 2 : Selección de Estudiante(s)</span><hr />
                            <br/><label for="surname">Digite Nombre Estudiante</label><br />
                            <input type="text" id="estudiante" name="estudiante" class="input_field_12em"/> <input id="reset" value="Reset" type="button" onclick="clearEstudiante()"/>
                            <span ><input id="boton_estu" type="button" value="Vincular Estudiante" name="enviar"/></span>
                            <div id="result_estudiante"></div>
                            <div id="resultados_estu" ></div>
                        </span>
                        
                        <span id="finland2" class="step">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 3 : Selección Asesor(@s)</span><hr />
                            <br/><label for="surname">Digite Nombre Asesor(@)</label><br />
                            <input type="text" id="asesor" name="asesor" class="input_field_12em"/><input id="reset" value="Reset" type="button" onclick="clearAsesor()"/>
                            <span ><input id="boton_ases" type="button" value="Vincular Asesor" name="enviar"/></span>
                            <div id="result_asesor"></div>
                            <div id="resultados_ases" ></div>
                        </span>
                        
                        <span id="finland3" class="step">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 4 : Selección Jurados</span><hr />
                            <br/><label for="surname">Digite Nombre Jurado</label><br />
                            <input type="text" id="jurado" name="jurado" class="input_field_12em"/><input id="reset" value="Reset" type="button" onclick="clearJurado()"/>
                            <span ><input id="boton_jura" type="button" value="Vincular Jurado" name="enviar"/></span>
                            <div id="result_jurado"></div>
                            <div id="resultados_jura" ></div>				
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
        
