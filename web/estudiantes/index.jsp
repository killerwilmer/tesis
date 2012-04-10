<%-- 
    Document   : index
    Created on : 26-oct-2011, 11:33:59
    Author     : zzz
--%>
 <%@ page session="true" %>

 <%@page import="com.umariana.control.ConectaDb" %>
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
    </head>
    <body> 
        <div id="contenedor1">
            <div id="header">
                <img src="../recursos/Imagenes/index/logo1.gif" alt="logo"/>
                <h1 id="titulo"><%out.print(tipos);%></h1>           
            </div>
            <div id="menu">
                <ul id="nav">
                    <li><a href="#"><span>Inicio</span></a></li>
                    <li><span>Etapas</span>
                        <ul>
                            <li><a href="#">Menu item 1</a></li>
                            <li><a href="#">Menu item 2</a></li>
                            <li><a href="#">Menu item 3</a></li>
                        </ul>
                    </li>
                    <li><span>Permisos</span>
                        <ul>
                            <li><a href="#">Menu item 1</a></li>
                            <li><a href="#">Menu item 2</a></li>
                            <li><a href="#">Menu item 3</a></li>
                        </ul>
                    </li>
                    <li><span>Otros</span>
                        <ul>
                            <li><a href="#">Menu item 1</a></li>
                            <li><a href="#">Menu item 2</a></li>
                            <li><a href="#">Menu item 3</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div id="wraper">
                
            </div>
            <div id="footer">
                
            </div>
        </div>
    </body>
</html>
