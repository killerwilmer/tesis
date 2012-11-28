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
        
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/mensajespoput.js"></script>

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
                $(".contra").click(function(event) {
                    $("#wraper").load('contrasena.jsp');
                });
            });
        </script>

    </head>
    <body>
        <%
            int comp = 0;
            int dato = -1;
            String cadena = ("usuario, usuarioevaluador where usuario.idusuario=usuarioevaluador.idusuario and usuarioevaluador.idusuario='" + idDocente + "'");
            dato = control.darCont(cadena);
            if (dato == 0) {
                String SQL = "Update usuario SET contador1='" + dato + "' where idusuario='" + idDocente + "'";
                control.ejecutarOperacion(SQL);
            } else {
                String inicio2 = "select ";
                String campo2 = "contador1";
                String fin2 = " from usuario where idusuario='" + idDocente + "';";
                String idDoc2 = control.retornoCodigo(inicio2, campo2, fin2);
                comp = Integer.parseInt(idDoc2);
                if (dato > comp) {
                    int rest = dato - comp;
                    out.print("<script languaje = javascript>showNoticeToast('Tienes: " + rest + " Proyecto(s) Nuevo(s) Como Jurado');</script>");
                    String SQL = "Update usuario SET contador1='" + dato + "' where idusuario='" + idDocente + "'";
                    control.ejecutarOperacion(SQL);
                }
            }
            
            int comp1 = 0;
            int dato1 = -1;
            String cadena1 = ("usuario, usuarioasesor where usuario.idusuario=usuarioasesor.idusuario and usuarioasesor.idusuario='" + idDocente + "'");
            dato1 = control.darCont(cadena1);
            if (dato1 == 0) {
                String SQL = "Update usuario SET contador2='" + dato1 + "' where idusuario='" + idDocente + "'";
                control.ejecutarOperacion(SQL);
            } else {
                String inicio3 = "select ";
                String campo3 = "contador2";
                String fin3 = " from usuario where idusuario='" + idDocente + "';";
                String idDoc3 = control.retornoCodigo(inicio3, campo3, fin3);
                comp1 = Integer.parseInt(idDoc3);
                if (dato1 > comp1) {
                    int rest = dato1 - comp1;
                    out.print("<script languaje = javascript>showNoticeToast('Tienes: " + rest + " Proyecto(s) Nuevo(s) Como Asesor');</script>");
                    String SQL = "Update usuario SET contador2='" + dato1 + "' where idusuario='" + idDocente + "'";
                    control.ejecutarOperacion(SQL);
                }
            }
        %>
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
                        <li><a href="#" class="parent"><span>Personal</span></a>
                            <div>
                                <ul id="menseg2">
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