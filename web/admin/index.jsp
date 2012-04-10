<%-- 
    Document   : index
    Created on : 26-oct-2011, 15:11:13
    Author     : zzz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/index.css" />

        <title>Plataforma Admin</title>
        
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/mootools/1.2.3/mootools-yui-compressed.js"></script>
        <script type="text/javascript" src="../recursos/Js/Coordinador/win7.js"></script>
        
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $(".boton").click(function(event) {
                    $("#wraper").load('addFacultad.jsp');
                    $.getScript('js/b.js');
                });
                $(".boton1").click(function(event) {
                    $("#wraper").load('addPrograma.jsp');
                    $.getScript('js/b.js');
                });
                $(".boton2").click(function(event) {
                    $("#wraper").load('addusuario.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
            
    </head>
    <body>
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/index/logo1.gif" alt="logo"/></a>
                <h1 id="titulo">Administrador</h1>  
                <div id="menu">
                    <ul class="menu">
                        <li><a href="#" class="parent"><span>Registro</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="boton"><span>Facultades</span></a></li>
                                    <li><a href="#" class="boton1"><span>Programas</span></a></li>
                                    <li><a href="#" class="boton2"><span>Usuarios</span></a></li>
                                    <li><a href="#"><span>Otros</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#" id="123"><span id="123">JavaScript</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','recursos/JS/ajax_loadContent.js');"><span>Graphic Design</span></a></li>
                        <li><a href="#"><span>HTML</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','http://www.google.com.co/');"><span>User Interface</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','Coordinador/formEtapas.jsp');"><span>CSS</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="wraper">
            </div>
            <!--object type="text/html" data="Coordinador/formEtapa.jsp" style="width: 400px; height: 400px"> </object--> 
            <div id="footer">

            </div>
        </div>
    </body>
</html>
