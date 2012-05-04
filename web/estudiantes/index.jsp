<%-- 
    Document   : index
    Created on : 26-oct-2011, 11:33:59
    Author     : zzz
--%>
 <%@ page session="true" %>

 <%@page import="com.umariana.control.ConectaDb" %>
 <%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
 <% ConectaDb control = new ConectaDb(); %>
 
 <% 
      HttpSession sesionOk = request.getSession();
      String estudiante = (String) sesionOk.getAttribute("estudiante") ;
      
      String inicio = "select ";
      String campo = "nombreprograma";
      String fin = " from usuario where codigousuario='"+estudiante+"';";
      String tipos = control.retornoCodigo(inicio, campo, fin);
  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Estudiantes/index.css" />
        <title>Plataforma Estudiantes</title>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $(".boton").click(function(event) {
                    $("#wraper").load('documento.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
        
    </head>
    <body> 
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/Coordinador/images/logo.gif" alt="logo"/></a>
                <h1 id="tit"><%out.print(tipos);%></h1>  
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
                        <li><a href="#" class="boton"><span>Proyecto</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','recursos/JS/ajax_loadContent.js');"><span>Graphic Design</span></a></li>
                        <li><a href="#"><span>HTML</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','http://www.google.com.co/');"><span>User Interface</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','Coordinador/formEtapas.jsp');"><span>CSS</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="wraper">
                            <form method="post" name="form" action="">
                <textarea cols="30" rows="2" name="content" id="content">
                </textarea><br />
            </form>
            <ckeditor:replace replace="content" basePath="/ckeditor/" />
            </div>
            <!--object type="text/html" data="Coordinador/formEtapa.jsp" style="width: 400px; height: 400px"> </object--> 
            <div id="footer">

            </div>
        </div>
    </body>
</html>
