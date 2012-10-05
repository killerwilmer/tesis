<%-- 
    Document   : insert1
    Created on : 02-may-2012, 8:39:32
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Estudiantes/estiloFormularios.css" />
        <script type="text/javascript" src="ckeditor.js"></script>
        <script type="text/javascript" src="sample.js"></script>
        <script type="text/javascript">
            //<![CDATA[      
            var editor, html = '';      
            function createEditor()
            {
                if ( editor )
                    return;                   
                // Create a new editor inside the <div id="editor">, setting its value to html
                var config = {};
                editor = CKEDITOR.appendTo( 'editor', config, html );

            }
            function removeEditor()
            {
                if ( !editor )
                    return;
                
                // Retrieve the editor contents. In an Ajax application, this data would be
                // sent to the server or used in any other way.
                document.getElementById( 'contents' ).style.display = '';
                
                // Destroy the editor.
                editor.destroy();
                editor = null;
            }
//]]>
        </script>
        
        
    </head>
    <body>
        <!-- This div will hold the editor. -->
        <div id="editor">
        </div>
        <p id="botonera">
            <input onclick="createEditor();" type="button" value="Ver" />
            <input onclick="createEditor();" type="button" value="Guardar" />
            <input onclick="removeEditor();" type="button" value="Recuperar" />
        </p>
        <div id="contents" style="display: none">
            <p>
                Edited Contents:
            </p>
        </div>         
    </body>
</html>