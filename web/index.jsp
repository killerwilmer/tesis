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
        
        <link rel="stylesheet" href="recursos/Css/index.css" type="text/css" media="screen" />
         
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
            
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
        <script type="text/javascript" src="recursos/Js/jquery-1.3.2.js" ></script>
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

    </head>
              
    <body style="background: url(recursos/Imagenes/index/transparente.png) repeat-x, repeat-y, #D3F0FA">
        <div class="header-container" style="background: url(recursos/Imagenes/index/header.png) repeat-x;">            
            <header class="wrapper0">
                <img id="logotipo" src="recursos/Imagenes/index/logo1.gif" alt="logo" /><h1 id="title">Titulo Logo</h1>            
                <div id="container2">
                    <div id="loginContainer">
                        <a href="#" id="loginButton" onClick="foco('email');"><span>Login</span></a>           
                        <!--div style="clear:both"></div-->
                        <div id="loginBox">                
                            <form id="loginForm" name="logeo" action="login.jsp" method="post">
                                <fieldset id="body">
                                    <fieldset>
                                        <label for="usuario">Usuario</label>
                                        <input type="text" name="usuario" class="email" id="email"/>
                                    </fieldset>
                                    <fieldset>
                                        <label for="password">Contraseña</label>
                                        <input type="password" name="password" class="pas" id="password"/>
                                    </fieldset>
                                    <label for="checkbox"><input type="checkbox" id="checkbox" />Recordarme</label>
                                    <input type="submit" id="login" value="Iniciar" />
                                </fieldset>
                                <span><a href="#">¿Olvidaste tu contraseña?</a></span>
                            </form>                                                      
                        </div>            
                    </div>
                </div>                                
                
                <nav id="menu">
                    <ul>
                        <li><a href="#">Normas</a></li>
                        <li><a href="#">Reglamentos</a></li>
                        <li><a href="#">Videos</a></li>
                        <li><a href="#">Ayudas</a></li>
                        <li><a href="registro.jsp" title="Registro de usuarios" rel="gb_page_center[1000, 600]" id="registro">Registro</a></li>
                    </ul>
                </nav>
            </header>
            <div id="errorSesion">
                       <%
                        if(request.getParameter("error")!=null)
                        {
                            out.println(request.getParameter("error"));               
                        }
                       %>
           </div>
        </div>
        

        <div id="main" class="wrapper" style="background: url(recursos/Imagenes/index/blanco.png)">
            
            <aside style="background: url(recursos/Imagenes/index/even.png) repeat-x;">
                <h3 id="tituloEvento">Eventos</h3>
                <div id="eventos">
                    <ul>
                        <li>
                            <a href="#">primer evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">segundo evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">tercer evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">cuarto evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">quinto evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">sexto evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">septimo evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">octavo evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                        <li>
                            <a href="#">noveno evento</a>
                            <br>
                            Lorem ipsum est quo sit amentus apis larumser.
                        </li>
                    </ul>
                </div>
            </aside>
            <article>
                <header>
                    <div id="flip-tabs">
                        <div id="flip-container" >
                            <div class="orange">
                                <h2>Noticia Principal 1</h2>
                                <img src="recursos/Imagenes/index/helicoptero_medico.png" style="float: left"/>
                                <p>Teniendo en cuenta que los objetivos del Centro de Bienestar Animal de la Alcaldía de Pasto es promover el buen trato y                          la corresponsabilidad ambiental, se ha programado una campaña de adopción canina en la Plaza del Carnaval el próximo 12                          octubre del 2011.<br>
                            </div>
                            <div class="green">
                                <h2>Noticia Principal 2</h2>
                                <p>Teniendo en cuenta que los objetivos del Centro de Bienestar Animal de la Alcaldía de Pasto es promover el buen trato y                          la corresponsabilidad ambiental, se ha programado una campaña de adopción canina en la Plaza del Carnaval el próximo 12                          octubre del 2011.<br>					
                            </div>
                            <div class="blue">
                                <h2>Noticia Principal 3</h2>
                                <p>Teniendo en cuenta que los objetivos del Centro de Bienestar Animal de la Alcaldía de Pasto es promover el buen trato y                          la corresponsabilidad ambiental, se ha programado una campaña de adopción canina en la Plaza del Carnaval el próximo 12                          octubre del 2011.<br>	
                            </div>
                        </div>                        
                        <ul id="flip-navigation" >
                            <li class="selected"><a href="#" id="tab-0"  >Noticias</a></li>
                            <li><a href="#" id="tab-1" >Destacado</a></li>
                            <li><a href="#" id="tab-2" >recomendado</a></li>
                        </ul>  
                    </div>
                </header>
                
                <div  id="nsecundarias">
                    <ul id="ticker01">
                        <li><img src="recursos/Imagenes/index/helicoptero_medico.png" style="float: left"/><span>10/10/2007</span>
                            The first thing hasjhasjhxasjxhasjxhs111111
                            bbbbbbbbshxabjshxbajshxbsashhahsjahda
                            bbbbbbbbbbbbbbasaskjbaskjcbaksjbcaksj
                            bbbbbbascabscbaksjcbaksjcbaksjcbaksjc             
                        </li>
                        <li><img src="recursos/Imagenes/index/helicoptero_medico.png" style="float: left"/><span>10/10/2007</span>
                            The first thing hasjhasjhxasjxhasjxhs111111
                            bbbbbbbbshxabjshxbajshxbsashhahsjahda
                            bbbbbbbbbbbbbbasaskjbaskjcbaksjbcaksj
                            bbbbbbascabscbaksjcbaksjcbaksjcbaksjc             
                        </li>
                        <li><img src="recursos/Imagenes/index/helicoptero_medico.png" style="float: left"/><span>10/10/2007</span>
                            The first thing hasjhasjhxasjxhasjxhs111111
                            bbbbbbbbshxabjshxbajshxbsashhahsjahda
                            bbbbbbbbbbbbbbasaskjbaskjcbaksjbcaksj
                            bbbbbbascabscbaksjcbaksjcbaksjcbaksjc             
                        </li>
                    </ul>

                </div>
                
                <footer id="foot">
                  <div id="demo-right">
                    <div id="hWrapperAuto">
                        <div id="carouselhAuto">
                            <div>
                                <a id="foto" href="recursos/Imagenes/images/img_1.jpg">
                                   <img alt="" src="recursos/Imagenes/images/img_1.jpg" /><br/></a>
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_2.jpg">
                                   <img alt="" src="recursos/Imagenes/images/img_2.jpg" /></a><br/>
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_3.jpg">
                                   <img alt="" src="recursos/Imagenes/images/img_3.jpg" /></a><br/>
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_4.jpg">
                                   <img alt="" src="recursos/Imagenes/images/img_4.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_5.jpg">
                                   <img alt="" src="recursos/Imagenes/images/img_5.jpg"/></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_6.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_6.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_7.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_7.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_8.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_8.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_9.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_9.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_10.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_10.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_11.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_11.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_12.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_12.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_13.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_13.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_14.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_14.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_15.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_15.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                            <div>
                                <a href="recursos/Imagenes/images/img_16.jpg">
                                    <img alt="" src="recursos/Imagenes/images/img_16.jpg" /></a><br />
                                <span class="thumbnail-text">Image Text</span></div>
                        </div>
                    </div>
                  </div>   
                </footer>           
            </article>
        </div>  
        <div id="footer-container" style=" background:url(recursos/Imagenes/index/footer.png) repeat-x">
            <footer class="wrapper2">
                <h3>Pie de la pagina</h3>
            </footer>
        </div>          
    </body>
    <div></div>
</html>