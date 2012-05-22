<%-- 
    Document   : menumodificar
    Created on : 13-abr-2012, 21:55:02
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../recursos/Css/admin/menumodificar.css" type="text/css"/>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $(".facu").click(function(event) {
                    $("#contenido2").load('ediccion/modificarfacultad.jsp');
                    $.getScript('js/b.js');
                });
                $("#programa").click(function(event) {
                    $("#contenido2").load('ediccion/modprograma.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
        
    </head>
    <body>
        <div id="contenedor2">
            <div class="submenu">
                <div id="span"><span id="titulo">Modificar</span></div>
                <div id="menup">
                    <ul>
                        <li class="facu"><a href="#"><br/><br/><br/>Facultad</a></li><br/>
                        <li id="programa"><a href="#" ><br/><br/><br/>Programa</a></li><br/>
                        <li><a href="#" ><br/><br/><br/>Usuario</a></li><br/>
                        <li id="coor"><a href="#" ><br/><br/><br/>Coordinador</a></li><br/>
                    </ul>
                </div>
            </div>
            <div class="contenido" id="contenido2"></div>
        </div>
    </body>
</html>
