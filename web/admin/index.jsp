<%-- 
    Document   : index
    Created on : 26-oct-2011, 15:11:13
    Author     : zzz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <%@page import="com.umariana.control.ConectaDb" %>
 <% ConectaDb control = new ConectaDb(); %>
 <% 
      HttpSession sesionOk = request.getSession();
      String estudiante = (String) sesionOk.getAttribute("administrador") ;    
 %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/index.css" />
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />
        <link rel="stylesheet"  type="text/css" href="../recursos/Css/estilotablas.css"/>

        <title>Plataforma Admin</title>       
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        
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
                $(".boton3").click(function(event) {
                    $("#wraper").load('addcoordinador.jsp');
                    $.getScript('js/b.js');
                });
                $(".modif").click(function(event) {
                    $("#wraper").load('menumodificar.jsp');
                    $.getScript('js/b.js');
                });
                $(".verproyectos").click(function(event) {
                    $("#wraper").load('reportes/verproyectos.jsp');
                    $.getScript('js/b.js');
                });
                $(".vercoordinador").click(function(event) {
                    $("#wraper").load('reportes/vercoordinadores.jsp');
                    $.getScript('js/b.js');
                });
                 $(".veretapas").click(function(event) {
                    $("#wraper").load('reportes/veretapas.jsp');
                    $.getScript('js/b.js');
                });
                $(".vereaspectos").click(function(event) {
                    $("#wraper").load('reportes/listanombresprogramas.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
            
    </head>
    <body>
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/index/logo1.gif" alt="logo"/></a>
                <h1 id="titulo">ADMINISTRADOR</h1>  
                <div id="menu">
                    <ul class="menu">
                        <li><a href="#" class="parent"><span>Registro</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="boton"><span>Facultades</span></a></li>
                                    <li><a href="#" class="boton1"><span>Programas</span></a></li>
                                    <li><a href="#" class="boton2"><span>Usuarios</span></a></li>
                                    <li><a href="#" class="boton3"><span>Coordinador</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#" class="modif"><span>Modificar</span></a></li>
                        <li><a href="#"><span>Reportes</span></a>
                            <div>
                                <ul id="mensegdos">
                                    <li><a href="#" class="verproyectos"><span>Proyectos</span></a></li>
                                    <li><a href="#" class="vercoordinador"><span>Docentes</span></a></li>
                                    <li><a href="#" class="vercoordinador"><span>Coordinadores</span></a></li>
                                    <li><a href="#" class="veretapas"><span>Etapas</span></a></li>
                                    <li><a href="#" class="vereaspectos"><span>Aspectos</span></a></li>
                                </ul>
                            </div>       
                        </li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','http://www.google.com.co/');"><span>Noticias</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','Coordinador/formEtapas.jsp');"><span>Eventos</span></a></li>
                        <li><a id="cerrar" href="#"><span id="salir">Salir</span></a>

                        </li>
                    </ul>
                </div>
            </div>
            <div id="wraper">
            </div>
            <!--object type="text/html" data="Coordinador/formEtapa.jsp" style="width: 400px; height: 400px"> </object--> 
            <div id="footer">
                <label>Plataforma Administrador</label><br/>
                <label id="nombreusuario">Administrador</label><br/><br/>
                <label id="estilo1">WEBMASTER</label>
                <br/><label id="estilo2">WILMER ARTEAGA - ALEX ENRIQUEZ</label><br/>
                        <label id="estilo1">Email</label><br />
                        <label id="estilo2">killerwilmer@gmail.com - alexnrqz@gmail.com</label><br/><br/>
                        <label id="estilo3">Universidad Mariana</label><br />
                        <label id="estilo2">San Juan de Pasto - Nariño - Colombia</label><br />
                        <label id="estilo2">Calle 18 No. 34-104 Teléfono: 7314923 Fax: 7315658</label>
            </div>
        </div>
    </body>
</html>
