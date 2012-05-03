<%-- 
    Document   : index
    Created on : 29-abr-2012, 12:37:20
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@page import="com.umariana.control.ConectaDb" %>
 <% ConectaDb control = new ConectaDb(); %>
 <% 
      HttpSession sesionOk = request.getSession();
      String estudiante = (String) sesionOk.getAttribute("docente") ;
      
      String inicio = "select ";
      String campo = "nombreprograma";
      String fin = " from programa where idprograma='"+estudiante+"';";
      String tipos = control.retornoCodigo(inicio, campo, fin);
  %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plataforma Docente</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Docente/index.css" />
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
    </head>
    <body>
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/Coordinador/images/logo.gif" alt="logo" /></a>
                <h1 id="tit"><%out.print(tipos);%></h1>   
                <div id="menu">
                    <ul class="menu">
                        <li><a href="#" class="parent"><span>Registro</span></a>
                            <div>
                                <ul id="menseg">
                                    <li><a href="#" class="boton"><span>Etapas</span></a></li>
                                    <li><a href="#" class="boton2"><span>G. Investigación</span></a></li>
                                    <li><a href="#" class="boton3"><span>Aspectos</span></a></li>
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
