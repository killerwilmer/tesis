<%-- 
    Document   : index
    Created on : 29-abr-2012, 12:37:20
    Author     : usuarui
--%>
<%@page session="true" %>
<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>
<%
    HttpSession sesionOk = request.getSession();
    String docentes = (String) sesionOk.getAttribute("docente");

    String inicio = "select ";
    String campo = "nombreprograma";
    String fin = " from usuario where codigousuario='" + docentes + "';";
    String nombrePrograma = control.retornoCodigo(inicio, campo, fin);

    String inicio1 = "select ";
    String campo1 = "idusuario";
    String fin1 = " from usuario where codigousuario='" + docentes + "';";
    String idDoc = control.retornoCodigo(inicio1, campo1, fin1);

    int idDocente = Integer.parseInt(idDoc.trim());

    sesionOk.setAttribute("idDocente", idDocente);

    if (nombrePrograma.equals("null")) {
        out.print("<script>window.location='actualizarDatosDocente.jsp'</script>");
    } else {
        String nombreDocente = "";

        try {
            String sql = "select nombres, apellidos from usuario where codigousuario='" + docentes + "';";
            //System.out.print(sql);
            ResultSet rs = control.consultas(sql);
            while (rs.next()) {
                nombreDocente = rs.getString("nombres").trim() + " " + rs.getString("apellidos").trim();
            }
        } catch (Exception e) {
            out.println("Exception is ;" + e);
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plataforma Docente</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Docente/index.css" />
        <script src="../recursos/Js/jquery-1.7.1.js"></script>

        <script type="text/javascript" src="../recursos/CkEditor/ckeditor.js"></script>
        <script type="text/javascript" src="../recursos/CkEditor/sample.js"></script> 

        <script type="text/javascript">
            $(document).ready(function() {
                $(".boton").click(function(event) {
                    $("#wraper").load('proyectosJurado.jsp');
                });
                $(".boton2").click(function(event) {
                    $("#wraper").load('proyectosAsesor.jsp');
                });
            });
        </script>

    </head>
    <body>
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/index/logo1.gif" alt="logo" /></a>
                <h1 id="tit"><%out.print(nombrePrograma);%></h1>   
                <div id="menu">
                    <ul class="menu">
                        <li><a href="#" class="parent"><span>Proyecto</span></a>
                            <div>
                                <ul id="menseg1">
                                    <li><a class="boton"><span>Jurado</span></a></li>
                                    <li><a class="boton2"><span>Asesor</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#" id="123"><span id="123">JavaScript</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','recursos/JS/ajax_loadContent.js');"><span>Graphic Design</span></a></li>
                        <li><a href="#"><span>HTML</span></a></li>
                        <li><a href="#" onclick="ajax_loadContent('wraper','http://www.google.com.co/');"><span>User Interface</span></a></li>
                        <li><a href="#" class="parent"><span>Personal</span></a>
                            <div>
                                <ul id="menseg1">
                                    <li><a class="contra"><span>Contraseña</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a id="cerrar" href="#"><span id="salir">Salir</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="wraper">
            </div>
            <!--object type="text/html" data="Coordinador/formEtapa.jsp" style="width: 400px; height: 400px"> </object--> 
            <div id="footer">
                <label>Plataforma Docente</label><br/>
                <label id="nombreusuario"><%out.print(nombreDocente.toUpperCase());%></label><br/><br/>
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
<%
    }
%>