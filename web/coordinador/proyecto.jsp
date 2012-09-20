<%-- 
    Document   : proyecto
    Created on : 30-abr-2012, 8:50:06
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
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        <script src="../recursos/datepicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="funciones.js"></script><div></div>
        
        <link rel="stylesheet" href="../recursos/datepicker/jquery.ui.all.css">
        <link rel="stylesheet" type="text/css" href="../recursos/datepicker/demos.css" />
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.datepicker.js"></script>
        
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                });
                       
                // Validamos el formulario
                $('#formularioproyecto').validate({
                    errorPlacement: function(error, element) {
                        error.appendTo(element.prev("input").append());
                    }
                });
            });                
        </script>
        
    </head>
    <body>
        <h1 id="titulos">Registro Proyecto</h1>
        <form id="formularioproy">
            <fieldset id="fieladdproyecto">
               
                <label for="surname">Titulo</label><input type="text" name="titulop" id="titulop"/><br/>
                <label for="surname">Titulo Abreviado</label><input type="text" name="tituloabreviado" id="tituloabreviado"/><br/>
                <label for="surname">Institución</label><input type="text" name="institucion"  id="institucion"/>
                
                    <label for="surname">Etapa</label><select id="comboestado" name="comboestado">
                        <option selected="" value="*">Seleccione Etapa</option>
                        <%
                            out.print(control.comboestado("etapa"));
                        %>
                    </select>
                <br/><br/>
                <label for="surname" id="descrip">Descripción</label><textarea id="descripcion" name="descripcion"></textarea><br/> 
                
                <div class="demo">
                    <label for="surname">Fecha Inicio</label>
                    <input type="text" name="datepicker" id="datepicker" />
                </div>
                
                <label for="surname">Tipo</label>
                <select id="tipo" name="tipo"  class="required">
                    <option selected="" value="*">Seleccione Tipo</option>
                    <option value="trbajogrado">Trabajo de Grado</option>
                </select><br/><br/>
                <span id="radios">
                    
                <label for="surname">Activo</label><input type="radio" name="estado" id="activo" value="1">
                <label for="surname">Inactivo</label><input type="radio" name="estado" id="inactivo" value="0"></span> 
                <br/><br/>                           
                <input id="enviarproyecto" type="submit" value="Guardar" name="enviarproyecto"/>
                <br/>
                <div id="resultados" >
                </div>
            </fieldset>
        </form>
    </body>
</html>