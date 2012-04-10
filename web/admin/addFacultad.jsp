<%-- 
    Document   : formEtapa
    Created on : 29/10/2011, 12:27:31 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ConectaDb control = new ConectaDb(); %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />
        <link rel="stylesheet" href="../recursos/Css/admin/formLight.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/mootools/1.2.3/mootools-yui-compressed.js"></script>
        <script type="text/javascript" src="../recursos/Js/Coordinador/win7.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript" src="funciones.js"></script>

    </head>
    <body>
            <h1 id="titulos">Agregar Facultad</h1>
            <fieldset id="fiel">
                Codigio<input type="text" name="codigo" maxlength="100" id="codigo"/>
                Nombre<input type="text" name="facultad1" maxlength="100" id="facultad1"/>
                <br/><br/>                           
                <span id="btn1" class="win7 win7blue" ><a id="enviar" type="submit" >Guardar</a></span>
                <br/><br/>
                <div id="resultados" >
                </div>
            </fieldset>
    </body>
</html>