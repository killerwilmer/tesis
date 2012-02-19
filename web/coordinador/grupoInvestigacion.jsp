<%-- 
    Document   : grupoInvestigacion
    Created on : 15-feb-2012, 16:34:16
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        <link rel="stylesheet" href="../recursos/Css/Coordinador/formLight.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/mootools/1.2.3/mootools-yui-compressed.js"></script>
        <script type="text/javascript" src="../recursos/Js/Coordinador/win7.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        
        <script type="text/javascript">
             campoNuevo = 3;
             //Funcion de agregar campos
             function AgregarCampos() {
                 campoNuevo = campoNuevo + 1;
                 campo = '<div><label>Sub Linea ' + campoNuevo + ' </label><textarea name="sub' + campoNuevo + '"  /></div>';
                 $("#cont").append(campo);
             }
             //
        </script>
    </head>
    <body>
        <form method="post" id="formu">
            <h1>Grupo de Investigación</h1>
            <div id="fielx">
                <fieldset id="fiel1">
                    Grupo de Investigación<textarea id="text1"></textarea><br/>          
                </fieldset>
                <fieldset id="fiel2">
                    Linea de Investigación
                    <textarea></textarea><br/>                
                </fieldset>
                <fieldset id="fiel3">
                    Sub Linea 1 <textarea name="sub1"></textarea><br/>
                    Sub Linea 2 <textarea name="sub2"></textarea><br/>
                    Sub Linea 3 <textarea name="sub3"></textarea>
                    <div id="cont"></div><br/>
                    <span id="span2" class="win7 win7yellow" onclick="AgregarCampos(this);"><a href="#">Agregar Campo</a></span>                       
                </fieldset>
            </div>

            <span style="margin: auto"  class="win7 win7blue" name="enviar"><a href="#" >Guardar</a></span>
        </form> 
    </body>
</html>
