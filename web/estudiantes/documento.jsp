<%-- 
    Document   : insert1
    Created on : 02-may-2012, 8:39:32
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Estudiantes/estiloFormularios.css" />
        <script type="text/javascript" src="ckeditor.js"></script>
        <script type="text/javascript" src="sample.js"></script>
        <link href="sample.css" rel="stylesheet" type="text/css" />    
        
        <script type="text/javascript">
            CKEDITOR.config.height = 330
        </script>
    </head>
    <body>
        <!-- This div will hold the editor. -->
        <form>
            <p>
                <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10"></textarea>
            </p>
            <p id="botonera">
                <input onclick="createEditor();" type="button" value="Cargar" />
                <input onclick="createEditor();" type="button" value="Guardar" />
                <input onclick="removeEditor();" type="button" value="Correcciones" />
            </p> 
        </form>         
    </body>
</html>

<script>
    instance = CKEDITOR.instances['editor1'];
    if(instance)
    {
        CKEDITOR.remove(instance);
    }
    CKEDITOR.replace( 'editor1');
</script>