<%-- 
    Document   : registroAspectos
    Created on : 19-feb-2012, 15:23:09
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script TYPE="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script TYPE="text/javascript" src="../recursos/Js/Coordinador/combobox.js"></script>
        <link rel="stylesheet" href="../recursos/Css/Coordinador/formLight.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/mootools/1.2.3/mootools-yui-compressed.js"></script>
        <script type="text/javascript" src="../recursos/Js/Coordinador/win7.js"></script> 
        
        <script type="text/javascript">
            $(function() {
                $('#ui_element').scrollablecombo();
            });
            
            campoNuevo = 3;
             //Funcion de agregar campos
             function AgregarCampos() {
                 campoNuevo = campoNuevo + 1;
                 campo = '<div><label>Sub Linea ' + campoNuevo + ' </label><textarea name="sub' + campoNuevo + '"  /></div>';
                 $("#cont").append(campo);
             }
        </script>
        <link rel="stylesheet" href="../recursos/Css/Coordinador/combobox.css" TYPE="text/css" media="screen"/>
    </head>
    <body>
        <form method="post" id="formu">
            <h1>Aspectos e Indicadores</h1>
            <div id="fielx">
                <fieldset id="fiel1">
                    <div class="content">
                        <div class="box">
                            <select ID="ui_element">
                                <option value="A" selected>Escoger una Etapa</option>
                                <option value="B">Option Item B</option>
                                <option value="C">Option Item C</option>
                                <option value="D">Option Item D</option>
                                <option value="E">Option Item E</option>
                                <option value="F">Option Item F</option>
                            </select>
                        </div>
                    </div>  
                </fieldset>
                
                <fieldset id="fiel2">
                    Aspecto
                    <textarea id="text1"></textarea><br/>                
                </fieldset>
                
                 <fieldset id="fiel3">
                    Indicador 1 <textarea name="sub1"></textarea><br/>
                    Indicador 2 <textarea name="sub2"></textarea><br/>
                    Indicador 3 <textarea name="sub3"></textarea>
                    <div id="cont"></div><br/>
                    <span id="span2" class="win7 win7yellow" onclick="AgregarCampos(this);"><a href="#">Agregar Campo</a></span>                       
                </fieldset>
                <br/><span id="btn1"  class="win7 win7blue" name="enviar"><a  href="#" >Guardar</a></span>
            </div>
        </form>
    </body>
</html>
