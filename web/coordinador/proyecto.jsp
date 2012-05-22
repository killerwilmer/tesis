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
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
        
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
               
                Titulo<input type="text" name="titulop" id="titulop"/><br/>
                Titulo Abreviado<input type="text" name="tituloabreviado" id="tituloabreviado"/><br/>
                Institución<input type="text" name="institucion"  id="institucion"/>
                <span>
                    Etapa<select id="comboestado" name="comboestado">
                        <option selected="" value="*">Seleccione Etapa</option>
                        <%
                            out.print(control.comboestado("etapa"));
                        %>
                    </select>
                </span><br/><br/>
                <label id="des" for="textarea">Descripción</label><textarea id="descripcion" name="descripcion"></textarea><br/> 
                <div class="demo">
                    <label>Fecha Inicio</label>
                    <input type="text" name="datepicker" id="datepicker" />
                </div>
                Tipo
                <select id="tipo" name="tipo"  class="required">
                    <option selected="" value="*">Seleccione Tipo</option>
                    <option value="trbajogrado">Trabajo de Grado</option>
                </select><br/><br/><span id="radios">
                Activo<input type="radio" name="estado" id="activo" value="1">
                Inactivo<input type="radio" name="estado" id="inactivo" value="0"></span> 
                <br/><br/>                           
                <span><input id="enviarproyecto" type="submit" value="Guardar" name="enviarproyecto"/></span>
                <br/>
                <div id="resultados" >
                </div>
            </fieldset>
        </form>
    </body>
</html>
