<%-- 
    Document   : documento
    Created on : 5/11/2012, 11:35:11 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volver").click(function(event) {
                    $("#wraper").load('proyectosJurado.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <a href="#" class="volver">&laquo; Volver atrás</a>
        <form action="guardarProyecto.jsp" method="post">
            <p>
                <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10">hhjhjhjh</textarea>
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