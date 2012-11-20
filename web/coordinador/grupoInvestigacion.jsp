<%-- 
    Document   : grupoInvestigacion
    Created on : 15-feb-2012, 16:34:16
    Author     : usuarui
--%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConectaDb cont = new ConectaDb();
%>
<%
    HttpSession sesionOk = request.getSession();
    String idLlega = (String) sesionOk.getAttribute("coordinador");
    String inicio = "select ";
    String campo = "nombreprograma";
    String fin = " from programa where idprograma='" + idLlega + "';";
    String nombrePrograma = cont.retornoCodigo(inicio, campo, fin);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
            
        <script type="text/javascript" src="wizard/js/jquery.form.js"></script>     
        <script type="text/javascript" src="wizard/js/jquery-ui-1.8.5.custom.min.js"></script>
        <script type="text/javascript" src="wizard/js/jquery.form.wizard.js"></script>
        
        <script type="text/javascript">
            function fun(combolineainvestiga)
            {
                var cuadrosDeTexto= document.getElementById('lineainvestigacion');
                cuadrosDeTexto.value = combolineainvestiga;
            }     
        </script>
    </head>
    
    <body>
        <h1>Registro Grupo de Investigación</h1>
        <fieldset id="fielgrupoinvestigacion">
            <div id="demoWrapper">        
                <h5 id="status"></h5>
                <form id="demoForm" method="post" action="json.html" class="bbq">
                    <div id="state"></div>
                    <div id="fieldWrapper">

                        <span class="step" id="first">
                            <!-- Escojemos el prooyecto y nos llevamos el id del poryecto -->
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 1: Registro Grupo Investigación</span> <hr />
                            <br/><label for="surname">Nombre Grupo Investigacón</label><br />
                            <input type="text" id="grupoinvestigacion" name="grupoinvestigacion" class="input_field_12em"/>
                            <br/><label for="surname">Nombre Programa</label><br />
                            <input type="text" id="nomprograma" name="nomprograma"  class="input_field_12em"  value="<%out.print(nombrePrograma);%>"/>
                            <input type="hidden" name="idPrograma" id="idPrograma" value="<%out.print(idLlega);%>">
                            <input id="boton_registro" type="button" value="Registrar" name="enviar"/>
                            <div id="resultados"></div>
                        </span>
                            
                        <span class="step" id="finland1">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 2: Registro Campo Investigación</span> <hr />
                            <br/><label for="surname">Nombre Campo</label><br />
                            <input type="text" id="campoinvestigacion" name="campoinvestigacion" class="input_field_12em"/>
                            <br/><label for="surname">Descripción Campo</label><br/>
                            <textarea id="descampo" name="descampo" class="input_field_12em"></textarea>
                            <br/><input id="boton_registro2" type="button" value="Registrar" name="enviar"/>
                            <div id="resultados"></div>
                        </span>
                        
                        <span class="step" id="finland2">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 3: Registro Linea de Investigación</span> <hr />
                            <br/><label for="surname">Grupo Investigación</label><br/>
                              <select id="combogrupoinvestigacion" name="combogrupoinvestigacion">
                                <option selected="" value="*">Seleccione Grupo de Investigación</option>
                                <%
                                    out.print(cont.combofiltro("grupoinvestigacion", idLlega));
                                %>
                              </select>
                              <br/><label for="surname">Campo de Investigación</label><br/>
                              <select id="campoinv" name="campoinv">
                                <option selected="" value="*">Seleccione Campo de Investigación</option>
                                <%
                                    out.print(cont.combocampo(" campo"));
                                %>
                              </select>
                              
                            <label for="surname">Digite Linea de Investigacón</label><br />
                            <input type="text" id="lineainvestigacion" name="lineainvestigacion" class="input_field_12em"/><br/>                            
                            <br/><input id="boton_registro3" type="button" value="Registrar" name="enviar"/>
                            <div id="resultados"></div>
                        </span>
                      
                        <span class="step" id="finland3">
                            <span style="font-size: 20px; font: bold" class="font_normal_07em_black">Paso 4: Registro Sub-Linea de Investigación</span><hr/>
                            <br/><label for="surname">Linea de Investigación</label><br/>
                              <select id="combolineainvestigacion" name="combolineainvestigacion">
                                <option selected="" value="*">Seleccione Linea de Investigación</option>
                                <%
                                    out.print(cont.combolineainvestigacion("linea, grupoinvestigacion", idLlega));
                                %>
                              </select>
                            <label for="surname">Nombre Sub-Linea de Investigacón</label><br/>
                            <input type="text" id="sublineainvestigacion" name="sublineainvestigacion" class="input_field_12em"/>                       
                            <br/><input id="boton_registro4" type="button" value="Registrar" name="enviar"/>
                            <div id="resultados"></div>
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
                <hr/>
       
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