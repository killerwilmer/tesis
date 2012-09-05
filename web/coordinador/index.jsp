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
      String idLlega = (String) sesionOk.getAttribute("coordinador") ;
      
      String inicio = "select ";
      String campo = "nombreprograma";
      String fin = " from programa where idprograma='"+idLlega+"';";
      String tipos = control.retornoCodigo(inicio, campo, fin);
  %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/index.css" />

        <title>Plataforma Coordinador</title>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $(".registroetapa").click(function(event) {
                    $("#wraper").load('formEtapa.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".registrogrupo").click(function(event) {
                    $("#wraper").load('grupoInvestigacion.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".registroaspectos").click(function(event) {
                    $("#wraper").load('registroAspectos.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".registroproyecto").click(function(event) {
                    $("#wraper").load('proyecto.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
            
    </head>
    <body>
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/Coordinador/images/logo.gif" alt="logo" /></a>
                <h1 id="tit"><%out.print(tipos);%></h1>   
                <div id="menu">
                    <ul class="menu">
                        <li><a href="#" class="parent"><span>Etapas</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="registroetapa"><span>Registrar</span></a></li>
                                    <li><a href="#" class="boton2"><span>Modificar</span></a></li>
                                    <li><a href="#" class="boton3"><span>Eliminar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#" class="parent"><span>Grupo Investigación</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="registrogrupo"><span>Registrar</span></a></li>
                                    <li><a href="#" class="boton2"><span>Modificar</span></a></li>
                                    <li><a href="#" class="boton3"><span>Eliminar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#"><span>Aspectos</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="registroaspectos"><span>Registrar</span></a></li>
                                    <li><a href="#" class="boton2"><span>Modificar</span></a></li>
                                    <li><a href="#" class="boton3"><span>Eliminar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#"><span>PROYECTO</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="registroproyecto"><span>Registrar</span></a></li>
                                    <li><a href="#" class="boton2"><span>Modificar</span></a></li>
                                    <li><a href="#" class="boton3"><span>Eliminar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#"><span>Reportes</span></a>
                        
                        </li>
                        <li><a href="#"><span>Informes</span></a>
                        
                        </li>
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
