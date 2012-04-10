<%-- 
    Document   : addusuario
    Created on : 26-mar-2012, 3:26:57
    Author     : usuarui
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />
        
        <link rel="stylesheet" href="../recursos/datepicker/jquery.ui.all.css">
        <link rel="stylesheet" type="text/css" href="../recursos/datepicker/demos.css" />
        <script type="text/javascript" src="../recursos/datepicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="vaidaciones.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
        <script type="text/javascript" src="jquery.metadata.js"></script>
        
        
        
        <script>
	$(function() {
		$( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
                
                // Validamos el formulario
                $('#form').validate({
                    errorPlacement: function(error, element) {
                        error.appendTo(element.prev("input").append());
                    }
                });
	});
       
       
              
	</script>
    </head>
    <body id="d">
        <div id="stylized" class="myform">
            <form id="form">
            <h1>Registro Usuario</h1>
            
            <label for="nombre">Nombres</label>
            <input type="text" name="nombre" id="nombre" class="{required:true}" />
            
            <label>Apellidos</label>
            <input type="text" name="apellidos" id="apellidos" class="{required:true}" />
            
            <label>Identificación</label>
            <input type="text" name="identificacion" id="identificacion" class="{required:true}"/>
            
            
            <label>Password</label>
            <input type="text" name="clave" id="clave" class="{required:true}"/>
            
            <label>Tipo Usuario</label>
            <span>
                <select id="combotusuario" name="combotusuario" class="{required:true}">
                    <option selected="" style="border-radius: 4px">Seleccione T. Usuario</option>
                    <%
                        out.print(control.combo("tipousuario"));
                    %>
                </select>
           </span>  

            <label>Genero</label>
            <select id="genero" name="genero"  class="required">
                <option selected="">Seleccione su Genero</option>
                <option value="masculino">MASCULINO</option>
                <option value="femenino">FEMENINO</option>
            </select>  
            
            <label>Codigo Facultad</label>
            <input type="text" name="codfacultad" id="codfacultad" class="{required:true}"/>
            
            <label>Nombre Facultad</label>
            <input type="text" name="nomfacultad" id="nomfacultad" class="{required:true}"/>
            
            <label>Codigo Programa</label>
            <input type="text" name="codprograma" id="codprograma" class="{required:true}"/>
            
            <label>Nombre Programa</label>
            <input type="text" name="nomprograma" id="nomprograma" class="{required:true}"/>
            
            <label>Codigo Ciudad</label>
            <input type="text" name="codciudad" id="codciudad" />
           
            <label>Nombre Ciudad</label>
            <input type="text" name="nomciudad" id="nomciudad" />
            
            <label>Estado Civil</label>
            <select id="estadocivil" name="estadocivil">
                <option selected="">Seleccione su Estado</option>
                <option value="soltero">Soltero</option>
                <option value="casado">Casado</option>
                <option value="unionlibre">Union Libre</option>
            </select>
            
            <div class="demo">
            <label>Fecha de Nacimiento</label>
            <input type="text" name="datepicker" id="datepicker" />
            </div>
            
            <label>Dirección</label>
            <input type="text" name="direccion" id="direccion" />
            
            <label>E-Mail</label>
            <input type="email" name="email" id="email" class="{required:true}"/>
            
            <label>Número Celular</label>
            <input type="text" name="celular" id="celular" />
            
            <label>Número Casa</label>
            <input type="text" name="numcasa" id="numcasa" />
            
            <label>EPS</label>
            <input type="text" name="eps" id="eps" />
            
            <label>RH</label>
            <select id="rh" name="rh" class="{required:true}">
                <option selected="">Seleccione su Tipo</option>
                <option value="O-">O-</option>
                <option value="O+">O+</option>
                <option value="A−">A-</option>
                <option value="A+">A+</option>
                <option value="B−">B-</option>
                <option value="B+">B+</option>
                <option value="AB-">AB-</option>
                <option value="AB+">AB+</option>
            </select> 
            
            <span id="boton2"><input id="boton2" type="submit" value="Guardar" name="enviar"/></span>
            
            <div class="spacer"></div>
                      
            <div id="resultados" >
            </div>
        </form>
    </div>
    </body>
</html>
