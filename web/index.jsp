<%-- 
    Document   : index
    Created on : 19/10/2011, 09:26:08 PM
    Author     : Alex
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Herramienta para los procesos de Investigación</title>

        <link rel="stylesheet" href="recursos/Css/index.css" type="text/css"/>
        <link type="text/css" href="estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript">

            function showSuccessToast(mensaje) {
                $().toastmessage('showSuccessToast', mensaje);
            }
            function showStickySuccessToast() {
                $().toastmessage('showToast', {
                    text     : 'Success Dialog which is sticky',
                    sticky   : true,
                    position : 'middle-center',
                    type     : 'success',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });

            }
            function showNoticeToast(mensaje) {
                $().toastmessage('showNoticeToast', mensaje);
            }
            function showStickyNoticeToast() {
                $().toastmessage('showToast', {
                    text     : 'Notice Dialog which is sticky',
                    sticky   : true,
                    position : 'middle-center',
                    type     : 'notice',
                    closeText: '',
                    close    : function () {console.log("toast is closed ...");}
                });
            }
            function showWarningToast(mensaje) {
                $().toastmessage('showWarningToast', mensaje);
            }
            function showStickyWarningToast() {
                $().toastmessage('showToast', {
                    text     : 'Warning Dialog which is sticky',
                    sticky   : true,
                    position : 'middle-center',
                    type     : 'warning',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });
            }
            function showErrorToast(mensaje) {
                $().toastmessage('showErrorToast', mensaje);
            }
            function showStickyErrorToast() {
                $().toastmessage('showToast', {
                    text     : 'Error Dialog which is sticky',
                    sticky   : true,
                    position : 'top-center',
                    type     : 'error',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });
            }

        </script>

        <!--para el logeo-->
        <script src="recursos/Js/login.js" type="text/javascript"></script>

        <script type="text/javascript">
            function foco(idElemento){
                document.getElementById(idElemento).focus();
            }
        </script>

        <%-- Inicio de vinculacion Grey Box --%> 
        <script type="text/javascript">
            var GB_ROOT_DIR ="greybox/";
  
        </script>    
        <script type="text/javascript" src="recursos/Js/greybox/AJS.js"></script> 
        <script type="text/javascript" src="recursos/Js/greybox/AJS_fx.js"></script>
        <script type="text/javascript" src="recursos/Js/greybox/gb_scripts.js"></script>
        <link href="recursos/Js/greybox/gb_styles.css" rel="stylesheet" type="text/css" media="all" />
        <%-- Fin de vinculacion Grey Box --%>

        <!--para noticia principal-->
        <script type="text/javascript" src="recursos/Js/jquery-1.3.2.js" ></script><!--problemaaaaaaaaaaaaa-->
        <script src="http://cdn.jquerytools.org/1.2.6/full/jquery.tools.min.js"></script>
        <script type="text/javascript" src="recursos/Js/jquery.quickflip.js"></script>

        <script type="text/javascript" >
            $('document').ready(function(){
                $('#flip-container').quickFlip();         
                $('#flip-navigation li a').each(function(){
                    $(this).click(function(){
                        $('#flip-navigation li').each(function(){
                            $(this).removeClass('selected');
                        });
                        $(this).parent().addClass('selected');
                        var flipid=$(this).attr('id').substr(4);
                        $('#flip-container').quickFlipper({ }, flipid, 1);
                        
                        return false;
                    });
                });
            });
                     
        </script>

        <!-- para noticias secundarias -->
        <script src="recursos/Js/jquery.li-scroller.1.0.js" type="text/javascript"></script>

        <script language="javascript">
            $(function(){
                $("ul#ticker01").liScroll();
            });    
        </script>

        <!--para el scroll-->
        <script src="recursos/Js/jquery.timer.js" type="text/javascript"></script>
        <script src="recursos/Js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="recursos/Js/jquery.dwdinanews.0.1.js" type="text/javascript"></script>

        <script language="javascript">
            $(document).ready(function(){
                $("#eventos").dwdinanews();
            })
        </script>

        <!--para la zono del slip de fotos-->
        <script src="recursos/Js/jsCarousel-2.0.0.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#carouselhAuto').jsCarousel({ 
                    //onthumbnailclick: function(src) { alert(src); },
                    autoscroll: true, masked: true, itemstodisplay: 5,
                    orientation: 'h' });         
            });                 
        </script>

        <!--para el popup de las imagenes--> 
        <script type="text/javascript" src="recursos/Js/jquery.lightbox-0.5.js"></script>

        <script type="text/javascript">
            $(function() {
                $('#carouselhAuto a').lightBox();
            });
        </script>

        <!--para tooltip--> 
        <script type="text/javascript">
            $(function() {
                $("#loginForm :input[type='text']").tooltip({
                    position: "center right",
                    offset: [-2, 10],
                    effect: "fade",
                    opacity: 0.8
                });
            });
            $(function() {
                $("#loginForm :input[type='password']").tooltip({
                    position: "center right",
                    offset: [-2, 10],
                    effect: "fade",
                    opacity: 0.8
                });
            });
        </script>

        <!--Para mensajes de aleartas-->

        <script type="text/javascript">
            $(document).ready(function() {
                $(".normas").click(function(event) {
                    $("#main").load('normas.jsp');
                    $.getScript('js/b.js');
                });
                $(".reglamentos").click(function(event) {
                    $("#main").load('reglamentos.jsp');
                    $.getScript('js/b.js');
                });
                $(".videos").click(function(event) {
                    $("#main").load('videos.jsp');
                    $.getScript('js/b.js');
                });
                $(".encuesta").click(function(event) {
                    $("#main").load('encuesta.jsp');
                    $.getScript('js/b.js');
                });
                $(".ayudas").click(function(event) {
                    $("#main").load('normas.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>

    </head>

    <body>
        <div class="header-container" style="background: url(recursos/Imagenes/index/header.png) repeat-x; position: relative">
            <header class="wrapper0">
                <img id="logotipo" src="recursos/Imagenes/index/logo1.gif" alt="logo" /><h1 id="title">Procesos de Investigación</h1>            
                <div id="container2">
                    <div id="loginContainer">
                        <ul style="margin-top: 40px;"><li><a href="#" id="loginButton"  onClick="foco('email');"><span>Login</span></a></li></ul>           
                        <!--div style="clear:both"></div-->
                        <div id="loginBox">                
                            <form id="loginForm" name="logeo" action="login.jsp" method="post">
                                <fieldset id="body">
                                    <fieldset>
                                        <label for="usuario">Usuario</label>
                                        <input type="text" title="Codigo Sircoa" name="usuario" class="email" id="email"/>
                                    </fieldset>
                                    <fieldset>
                                        <label for="password">Contraseña</label>
                                        <input type="password" name="password" title="Contraseña de registro" class="pas" id="password"/>
                                    </fieldset>
                                    <!-- <label for="checkbox"><input type="checkbox" id="checkbox" />Recordarme</label> -->
                                    <input type="submit" id="logueo"  value="Iniciar" />
                                </fieldset>
                                <!-- <span><a href="#">¿Olvidaste tu contraseña?</a></span> -->
                            </form>                                                                   
                        </div>            
                    </div>
                </div>                                

                <nav id="menu">
                    <ul>
                        <li><a href="index.jsp" class="inicio">Inicio</a></li>
                        <li><a href="#" class="normas">Normas</a></li>
                        <li><a href="#" class="reglamentos">Reglamentos</a></li>
                        <li><a href="#" class="videos">Videos</a></li>
                        <li><a href="#" class="ayudas">Ayudas</a></li>
                        <li><a href="#" class="encuesta">Encuesta</a></li>
                        <%--li><a href="registro.jsp" title="Registro de usuarios" rel="gb_page_center[1000, 600]" id="registro">Registro</a></li--%>
                        <li><a href="registroWebService.jsp"  rel="gb_page_fs[]"  id="registro">Registro</a></li>
                    </ul>
                </nav>
            </header>


        </div>        

        <div id="main" class="wrapper" style="background: #eeeeee" >

            <aside style="background: url(recursos/Imagenes/index/even.png) repeat-x;">
                <h3 id="tituloEvento">Eventos</h3>
                <div id="eventos">
                    <ul>
                        <li>
                            <a href="#">primer evento</a>
                            <br>
                            Sustentacion trabajo de grado Cocomo2.
                        </li>
                        <li>
                            <a href="#">segundo evento</a>
                            <br>
                            Expocicion Oscar de la portilla.
                        </li>
                        <li>
                            <a href="#">tercer evento</a>
                            <br>
                            Fechas de expocicion tesis.
                        </li>
                        <li>
                            <a href="#">cuarto evento</a>
                            <br>
                            Sustentacion trabajdo de grado, Administrador Tesis.
                        </li>
                        <li>
                            <a href="#">quinto evento</a>
                            <br>
                            Sustentacion trabajo de grado. Internacionalizacion.
                        </li>
                    </ul>
                </div>
            </aside>
            <article>
                <header>
                    <div id="flip-tabs">
                        <div id="flip-container" >
                            <div class="orange">
                                <h2>Nariño Vive Digital entre los 4 mejores!</h2>
                                <img style="width: 150px; height: 100px; margin-left: 10px;" src="recursos/Imagenes/images/u6.jpg" style="float: left"/>
                                <p style="height: 150px; margin-left: 170px;margin-top: -110px;width: 450px;">Entre 19 proyectos que en 2011 hicieron parte de la Iniciativa Vive Digital Regional; 
                                    Nariño Vive Digital fue seleccionado entre los 4 mejores proyectos en Colombia, siendo 
                                    reconocido por ser una de las 4 "Experiencias exitosas en innovación TIC Regional". 
                                    <br>
                            </div>
                            <div class="green">
                                <h2 style="font-size: 20px;">III ENCUENTRO LATINOAMERICANO DE METODOLOGÍA DE LAS CIENCIAS SOCIALES</h2>
                                <img style="width: 150px; height: 100px; margin-left: 10px;" src="recursos/Imagenes/images/Oscar.jpg" style="float: left"/>
                                <p style="height: 150px; margin-left: 170px;margin-top: -110px;width: 450px;">El Ph.D. Oscar Valverde Riascos, Decano de la Facultad de Humanidades y Ciencias Sociales asistió al III 
                                    Encuentro Latinoamericano de Metodología de las Ciencias Sociales (ELMECS), participó como ponente en la 
                                    mesa 8 de Investigación .....<br>					
                            </div>
                            <div class="blue">
                                <h2 style="font-size: 20px;">NUEVAS TECNOLOGÍAS EN ENSEÑANZA Y APRENDIZAJE</h2>
                                <img style="width: 150px; height: 100px; margin-left: 10px;" src="recursos/Imagenes/images/tecnologias.jpg" style="float: left"/>
                                <p style="height: 150px; margin-left: 170px;margin-top: -110px;width: 450px;">urante dos días, la comunidad educativa se reunirá para socializar y conocer las experiencias 
                                    significativas que fomentan el aprendizaje del inglés en el "II Encuentro con Instituciones de 
                                    Educación Superior: El Uso de los Medios y Nuevas Tecnologías en la Enseñanza-Aprendizaje de 
                                    Lenguas Extranjeras", que tendrá lugar en Bogotá<br>	
                            </div>
                        </div>                        
                        <ul id="flip-navigation" >
                            <li class="selected"><a href="#" id="tab-0">Noticias</a></li>
                            <li><a href="#" id="tab-1" >Destacado</a></li>
                            <li><a href="#" id="tab-2" >recomendado</a></li>
                        </ul>  
                    </div>
                </header>

                <div  id="nsecundarias">
                    <ul id="ticker01">
                        <li><img src="recursos/Imagenes/images/noti1.png" style="width: 130px; height: 120px; float: left; margin-right: 7px;"/>
                            <span style="font-size: 10px;">CONVOCATORIA ABIERTA FACULTAD DE POSGRADOS Y RELACIONES INTERNACIONALES</span>                          
                            <pre style="font-size: 11px; width: 450px;">Se necesita un docente Investigador medio Tiempo para 
la Maestría en Administración en Salud.
Requisitos:
Formación en el área de la salud con titulo de Maestría o Doctorado
Experiencia en el desarrollo de proyectos de investigación
Experiencia en la publicación de artículos
Experiencia docente en educación superior</pre>
                           
                        </li>
                        <li><img src="recursos/Imagenes/images/foro.jpg" style="width: 130px; height: 120px; float: left; margin-right: 7px;"/>
                            <span style="font-size: 10px;">FORO UN PAÍS UNIDO POR LA EDUCACIÓN</span>                    
                            <pre style="font-size: 11px; width: 450px;">El próximo 27 de agosto de 2012 se llevará a 
cabo en la Cámara de Comercio de Bogotá, sede Salitre, 
el Foro Un país unido por la educación. 
¿Cuál es el ciudadano que queremos formar?

Esta será la gran pregunta que intentará responder el segundo Foro del Ciclo 
"Un país unido por la Educación". El cual contará con la participación </pre>              
                        </li>
                      <li><img src="recursos/Imagenes/images/gabriel.png" style="width: 130px; height: 120px; float: left; margin-right: 7px;"/>
                            <span style="font-size: 10px;">Beca Gabriel García Márquez de Periodismo Cultural</span>
                                      
                            <pre style="font-size: 11px; width: 450px;">"A mi me sueltan vendado y yo sé que estoy en el Caribe", 
así describe Gabriel García Márquez su conexión visceral 
con esta parte del mundo, a la cual le debe la cadencia 
y exuberancia de su obra literaria y periodística.

Inspirados por ese vínculo, la Fundación Nuevo Periodismo
Iberoamericano -FNPI-, y el Ministerio de Cultura de Colombia...                            
                            </pre>
                           
                        </li>
                    </ul>

                </div>

                <footer id="foot">
                    <div id="demo-right">
                        <div id="hWrapperAuto">
                            <div id="carouselhAuto">
                                <div>
                                    <a id="foto" href="recursos/Imagenes/images/u1.jpg">
                                        <img alt="" src="recursos/Imagenes/images/u1.jpg" /><br/></a>
                                    <span class="thumbnail-text">Image Text</span></div>
                                <div>
                                    <a href="recursos/Imagenes/images/u2.png">
                                        <img alt="" src="recursos/Imagenes/images/u2.png" /></a><br/>
                                    <span class="thumbnail-text">Image Text</span></div>
                                <div>
                                    <a href="recursos/Imagenes/images/u3.png">
                                        <img alt="" src="recursos/Imagenes/images/u3.png" /></a><br/>
                                    <span class="thumbnail-text">Image Text</span></div>
                                <div>
                                    <a href="recursos/Imagenes/images/u4.png">
                                        <img alt="" src="recursos/Imagenes/images/u4.png" /></a><br />
                                    <span class="thumbnail-text">Image Text</span></div>
                                <div>
                                    <a href="recursos/Imagenes/images/u5.png">
                                        <img alt="" src="recursos/Imagenes/images/u5.png"/></a><br />
                                    <span class="thumbnail-text">Image Text</span></div>
                                <div>
                                    <a href="recursos/Imagenes/images/u6.jpg">
                                        <img alt="" src="recursos/Imagenes/images/u6.jpg" /></a><br />
                                    <span class="thumbnail-text">Image Text</span></div>
                                <div>
                                    <a href="recursos/Imagenes/images/u7.jpg">
                                        <img alt="" src="recursos/Imagenes/images/u7.jpg" /></a><br />
                                    <span class="thumbnail-text">Image Text</span></div>
                                
                            </div>
                        </div>
                    </div>   
                </footer>           
            </article>
        </div>  
        <div id="footer-container" style=" background:url(recursos/Imagenes/index/footer.png) repeat-x">
            <footer class="wrapper2">
                <h4 class="piedepagina" >
                    <span class="Estilo4">Esta pagina se mira mejor con <a href="https://www.google.com/intl/es/chrome/browser/?hl=es" onclick="javascript:window.open('https://www.google.com/intl/es/chrome/browser/?hl=es');return false;">Navegador Chrome - Google</a>  ó <a href="http://www.mozilla.org/es-ES/firefox/fx/" onclick="javascript:window.open('http://www.mozilla.org/es-ES/firefox/fx/');return false;">mozilla firefox</a> a una resolución de 1024x768 o superior <br /></span>
                    <span class="Estilo5">WEBMASTER</span><span class="Estilo4">
                        <br/>WILMER ARTEAGA - ALEX ENRIQUEZ<br />
                        Email<br />
                        killerwilmer@gmail.com - alexnrqz@gmail.com<br />
                        <br />Universidad Mariana<br />
                        San Juan de Pasto - Nariño - Colombia<br />
                        Calle 18 No. 34-104 Teléfono: 7314923 Fax: 7315658</span>
                </h4>
            </footer>
        </div>          
    </body>
</html>