<%-- 
    Document   : index
    Created on : 26-oct-2011, 11:33:59
    Author     : zzz
--%>
<%@ page language="java" import="java.sql.*" %>
<%@ page session="true" %>

<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    HttpSession sesionOk = request.getSession();
    String codigoEst = (String) sesionOk.getAttribute("estudiante");

    String inicio = "select ";
    String campo = "nombreprograma";
    String fin = " from usuario where codigousuario='" + codigoEst + "';";
    String tipos = control.retornoCodigo(inicio, campo, fin);

    String inicio1 = "select ";
    String campo1 = "idusuario";
    String fin1 = " from usuario where codigousuario='" + codigoEst + "';";
    String idEstu = control.retornoCodigo(inicio1, campo1, fin1);

    int idEstudiante = Integer.parseInt(idEstu.trim());

    sesionOk.setAttribute("idEstudiante", idEstudiante);

    String inicio2 = "select ";
    String campo2 = "idproyecto";
    String fin2 = " from usuarioproyecto where idusuario=" + idEstudiante + ";";
    String idPro = control.retornoCodigo(inicio2, campo2, fin2);

    sesionOk.setAttribute("idProyecto", idPro);

    String nombre = "";

    try {
        String sql = "select nombres, apellidos from usuario where codigousuario='" + codigoEst + "';";
        //System.out.print(sql);
        ResultSet rs = control.consultas(sql);
        while (rs.next()) {
            nombre = rs.getString("nombres").trim() + " " + rs.getString("apellidos").trim();
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
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
                $(".botonproyecto").click(function(event) {
                    $("#wraper").load('documento.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".botoncorreciones").click(function(event) {
                    $("#wraper").load('correcciones.jsp');
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
                        <li><a href="index.jsp"><span>Inicio</span></a></li>
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
                        <li><a href="#" class="botonproyecto"><span>Proyecto</span></a></li>
                        <li><a href="#" class="botoncorreciones"><span>Correcciones</span></a></li>
                        <li><a href="#" class="bot"><span>Doc</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','Coordinador/formEtapas.jsp');"><span>CSS</span></a></li>
                        <li><a id="cerrar" href="#"><span id="salir">Salir</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="wraper">

            </div>
            <div id="footer">
                <label>Plataforma Estudiante</label><br/>
                <label id="nombreusuario"><%out.print(nombre.toUpperCase());%></label><br/><br/>
                <label id="estilo1">WEBMASTER</label>
                <br/><label id="estilo2">WILMER ARTEAGA - ALEX ENRIQUEZ</label><br/>
                <label id="estilo1">Email</label><br />
                <label id="estilo2">killerwilmer@gmail.com - alex.84.12@hotmail.com</label><br/><br/>
                <label id="estilo3">Universidad Mariana</label><br />
                <label id="estilo2">San Juan de Pasto - Nariño - Colombia</label><br />
                <label id="estilo2">Calle 18 No. 34-104 Teléfono: 7314923 Fax: 7315658</label>
            </div>
        </div>
    </body>
</html>
