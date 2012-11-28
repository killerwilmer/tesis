<%-- 
    Document   : index
    Created on : 26-oct-2011, 15:11:13
    Author     : zzz
--%>
<%@ page session="true" %>
<%@ page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Enumeration" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>

<!DOCTYPE html>

<%
    response.setHeader("Content-Type", "text/html");
        
    HttpSession sesionOk = request.getSession();
    String idLlega = "";
    String nombre = "";
    String tipos="";
        
    if (sesionOk.getAttribute("coordinador") == null) {
        %> 
        <jsp:forward page="../error.jsp">
            <jsp:param name="error" value="Es Obligación Identificarse"/>
        </jsp:forward>
        <%
    } else {
        
        idLlega = (String) sesionOk.getAttribute("coordinador");
        sesionOk.setAttribute("idp", idLlega);
            
        String inicio = "select ";
        String campo = "nombreprograma";
        String fin = " from programa where idprograma='" + idLlega + "';";
        tipos = control.retornoCodigo(inicio, campo, fin);
        //out.print(idLlega);
            
        sesionOk.setAttribute("nombre", tipos);
            
        String ini = "select ";
        String cam = "idusuario";
        String end = " from coordinador where idprograma='" + idLlega + "';";
        String tip = control.retornoCodigo(ini, cam, end);
            
        try {
            String sql = "select nombres, apellidos from usuario where idusuario='" + tip + "';";
            //System.out.print(sql);
            ResultSet rs = control.consultas(sql);
            while (rs.next()) {
                nombre = rs.getString("nombres").trim() + " " + rs.getString("apellidos").trim();
            }
        } catch (Exception e) {
            out.println("Exception is ;" + e);
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/index.css" />
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        <link type="text/css" href="../recursos/Css/estilotablas.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/CkEditor/ckeditor.js"></script>
        <script type="text/javascript" src="../recursos/CkEditor/sample.js"></script> 

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
                
                $(".botongrupoinv").click(function(event) {
                    $("#wraper").load('actualizar/formulariogrupoinvesstigacion.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".botonvinculargrupo").click(function(event) {
                    $("#wraper").load('vinculargrupoinvestigacion.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".registroaspectos").click(function(event) {
                    $("#wraper").load('registroAspectos.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".botonmodificaraspecto").click(function(event) {
                    $("#wraper").load('actualizar/listaAspectos.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".botonmodificarindicador").click(function(event) {
                    $("#wraper").load('actualizar/listaindicadores.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".registroproyecto").click(function(event) {
                    $("#wraper").load('proyecto.jsp');
                });
                $(".vincular").click(function(event) {
                    $("#wraper").load('wizard/index.jsp');
                });
                $(".modificaretapa").click(function(event) {
                    $("#wraper").load('actualizar/listarEtapas.jsp');
                    $.getScript('js/b.js');
                });
                $(".modificarproyecto").click(function(event) {
                    $("#wraper").load('actualizar/listarProyectos.jsp');
                });
                $(".evaluaciones").click(function(event) {
                    $("#wraper").load('liproyectos.jsp');
                    $.getScript('js/b.js');
                });
                $(".reporteproyectos").click(function(event) {
                    $("#wraper").load('tables/reporteproyecto.jsp');
                });
                $(".reporteestudiantes").click(function(event) {
                    $("#wraper").load('tables/reporteestudiantes.jsp');
                });
                $(".reportedocente").click(function(event) {
                    $("#wraper").load('tables/reportedocentes.jsp');
                });
                $(".reportedocentedos").click(function(event) {
                    $("#wraper").load('tables/reportedocenteasignados.jsp');
                });
            });
        </script>

    </head>
    <body>
        <div id="contenedor">
            <div id="header">
                <a id="logo" href="index.jsp" title="logo"><img src="../recursos/Imagenes/index/logo1.gif" alt="logo" /></a>
                <h1 id="tit"><%out.print(tipos);%></h1>   
                <div id="menu">
                    <ul class="menu">
                        <li><a href="#" class="parent"><span>Etapas</span></a>
                            <div>
                                <ul id="menseg1">
                                    <li><a href="#" class="registroetapa"><span>Registrar</span></a></li>
                                    <li><a href="#" class="modificaretapa"><span>Modificar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#" class="parent"><span>Grupo Investigación</span></a>
                            <div>
                                <ul id="menseg2">
                                    <li><a href="#" class="registrogrupo"><span>Registrar</span></a></li>
                                    <li><a href="#" class="botonvinculargrupo"><span>Vincular</span></a></li>
                                    <li><a href="#" class="botongrupoinv"><span>Modificar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#"><span>Aspectos</span></a>
                            <div>
                                <ul id="menseg3">
                                    <li><a href="#" class="registroaspectos"><span>Registrar</span></a></li>
                                    <li><a href="#" class="botonmodificaraspecto"><span>Modificar Aspecto</span></a></li>
                                    <li><a href="#" class="botonmodificarindicador"><span>Modificar Indicador</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#"><span>PROYECTO</span></a>
                            <div>
                                <ul id="menseg4">
                                    <li><a href="#" class="registroproyecto"><span>Registrar</span></a></li>
                                    <li><a href="#" class="vincular"><span>Vincular Actores</span></a></li>
                                    <li><a href="#" class="modificarproyecto"><span>Modificar</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#"><span>Reportes</span></a>                                                       
                            <div>
                                <ul id="menseg4">
                                    <li><a href="#" class="reporteproyectos"><span>Proyectos</span></a></li>
                                    <li><a href="#" class="reporteestudiantes"><span>Estudiantes</span></a></li>
                                    <li><a href="#" class="reportedocente"><span>Docentes</span></a></li>
                                    <li><a href="#" class="reportedocentedos"><span>Asignados</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a id="evaluaciones" class="evaluaciones" href="#"><span>Evaluacion</span></a>
                        </li>
                        
                        <li><a id="cerrar" href="cerrarSesion.jsp"><span id="salir">Salir</span></a>

                        </li>
                    </ul>
                </div>
            </div>
            <div id="wraper">
            </div>
            <!--object type="text/html" data="Coordinador/formEtapa.jsp" style="width: 400px; height: 400px"> </object--> 
            <div id="footer">
                <label>Plataforma Coordinador</label><br/>
                <label id="nombreusuario"><%out.print(nombre.toUpperCase());%></label><br/><br/>
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
