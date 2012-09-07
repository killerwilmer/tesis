<%-- 
    Document   : index
    Created on : 5/09/2012, 11:26:50 AM
    Author     : skynet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JQuery Form Wizard</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" ></meta>
        <link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.8.2.custom.css" />
        <script src="../../recursos/Js/jquery-1.7.1.js"></script>
        <script src="../../recursos/Js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="funciones.js"></script>

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
                
                $("#proyecto").autocomplete("proyecto_buscar.jsp");

                $('#proyecto').result(function(event, data, formatted) {
                    if (data) {

                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result").html( "<p>Nombre: " + name + "<br/>" + "</p>Id: <input type=\"text\" name=\"idPro\" id=\"idPro\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            //Para buscar el estudiante
            $(document).ready(function(){

                $("#estudiante").autocomplete("estudiente_buscar.jsp");

                $('#estudiante').result(function(event, data, formatted) {
                    if (data) {

                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_estudiante").html( "<p>Nombre: " + name + "<br/>" + "</p>Id: <input type=\"text\" name=\"idEst\" id=\"idEst\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
            //Para buscar el docente
            $(document).ready(function(){

                $("#asesor").autocomplete("docente_buscar.jsp");

                $('#asesor').result(function(event, data, formatted) {
                    if (data) {

                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_asesor").html( "<p>Nombre: " + name + "<br/>" + "</p>Id: <input type=\"text\" name=\"idAse\" id=\"idAse\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
            //Para buscar el asesor
            $(document).ready(function(){

                $("#jurado").autocomplete("docente_buscar.jsp");

                $('#jurado').result(function(event, data, formatted) {
                    if (data) {

                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_jurado").html( "<p>Nombre: " + name + "<br/>" + "</p>Id: <input type=\"text\" name=\"idJur\" id=\"idJur\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
        </script>

        <style type="text/css">
            #demoWrapper {
                padding : 1em;
                width : 500px;
                border-style: solid;
            }

            #fieldWrapper {
            }

            #demoNavigation {
                margin-top : 0.5em;
                margin-right : 1em;
                text-align: right;
            }

            #data {
                font-size : 0.7em;
            }

            input {
                margin-right: 0.1em;
                margin-bottom: 0.5em;
            }

            .input_field_25em {
                width: 2.5em;
            }

            .input_field_3em {
                width: 3em;
            }

            .input_field_35em {
                width: 3.5em;
            }

            .input_field_12em {
                width: 12em;
            }

            label {
                margin-bottom: 0.2em;
                font-weight: bold;
                font-size: 0.8em;
            }

            label.error {
                color: red;
                font-size: 0.8em;
                margin-left : 0.5em;
            }

            .step span {
                float: right;
                font-weight: bold;
                padding-right: 0.8em;
            }

            .navigation_button {
                width : 70px;
            }

            #data {
                overflow : auto;
            }
        </style>
    </head>
    <body>
        <div id="demoWrapper">
            <h3>Vinculacion del Proyecto</h3>
            <hr />
            <h5 id="status"></h5>
            <form id="demoForm" method="post" action="json.html" class="bbq">
                <div id="state"></div>
                <div id="fieldWrapper">
                    <span class="step" id="first">
                        <!-- Escojemos el prooyecto y nos llevamos el id del poryecto -->
                        <span class="font_normal_07em_black">Paso 1: Escoja el proyecto</span><br />
                        <label for="surname">Escoja el proyecto</label><br />
                        <input type="text" id="proyecto" name="proyecto" class="input_field_12em"/>  <input value="Reset" type="button" onclick="clearProyecto()"/>                        
                        <div id="result"></div>
                    </span>
                    <span id="finland1" class="step">
                        <span class="font_normal_07em_black">Paso 2 : Escoja los estudiantes</span><br />
                        <label for="surname">Escoja el estudiante</label><br />
                        <input type="text" id="estudiante" name="estudiante" class="input_field_12em"/> <input value="Reset" type="button" onclick="clearEstudiante()"/>
                        <span ><input id="boton_estu" type="button" value="Vincular Estudiante" name="enviar"/></span>
                        <div id="result_estudiante"></div>
                        <div id="resultados_estu" ></div>
                    </span>
                    <span id="finland2" class="step">
                        <span class="font_normal_07em_black">Paso 3 : Escoja los asesor(@s)</span><br />
                        <label for="surname">Escoja el asesor(@)</label><br />
                        <input type="text" id="asesor" name="asesor" class="input_field_12em"/><br /> <input value="Reset" type="button" onclick="clearAsesor()"/>
                        <span ><input id="boton_ases" type="button" value="Vincular Asesor" name="enviar"/></span>
                        <div id="result_asesor"></div>
                        <div id="resultados_ases" ></div>
                    </span>
                    <span id="finland3" class="step">
                        <span class="font_normal_07em_black">Paso 4 : Escoja los jurados</span><br />
                        <label for="surname">Escoja el jurado</label><br />
                        <input type="text" id="jurado" name="jurado" class="input_field_12em"/><br /> <input value="Reset" type="button" onclick="clearJurado()"/>
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
                    <input class="navigation_button" id="next" value="Ver Datos" type="submit"/>
                </div>
            </form>
            <hr />

            <p id="data"></p>
        </div>


        <script type="text/javascript" src="js/jquery.form.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/bbq.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
        <script type="text/javascript" src="js/jquery.form.wizard.js"></script>

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
                        url : "store_in_database.html", // the url which stores the stuff in db for each step
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
    </body>
</html>