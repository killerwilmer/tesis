<%-- 
    Document   : index
    Created on : 30/11/2012, 03:58:33 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>
<%@page import="java.util.Vector"%>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    int i = 0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../recursos/Tablas/js/jquery-ui-1.8.23.custom.min.js"></script>
        <script type="text/javascript" src="../recursos/Tablas/js/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="../recursos/Tablas/js/jquery.dataTables.min.js"></script>
        
        <link type="text/css" href="../recursos/Tablas/css/trontastic/jquery-ui-1.8.23.custom.css" rel="stylesheet"/>
        <link type="text/css" href="../recursos/Tablas/css/trontastic/jquery.ui.base.css" rel="stylesheet"/>
        <link type="text/css" href="../recursos/Tablas/css/trontastic/jquery.ui.all.css" rel="stylesheet"/>
        <link type="text/css" href="../recursos/Tablas/css/demo_page.css" rel="stylesheet"/>
        <link type="text/css" href="../recursos/Tablas/css/jquery.dataTables_themeroller.css" rel="stylesheet"/>
        
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />

        <script>
            $(document).ready(function() {
                $('#examplepad').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })      
        </script>
    </head>
    <body>
       <div id="container" >
            <h1 class="tituloreporte" style="text-align: center; margin-top: 55px;">PROYECTOS DE INVESTIGACIÓN</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplepad" width="100%" style="text-align: center">
                    <thead >
                        <tr><td class="columna1">No.</td><td class="columna3">Titulo</td><td class="columna4">Etapa</td><td class="columna5">Fecha Inicio</td><td class="columna6">Estado</td><td class="columna7">Integrantes</td><td class="columna8">Jurado(s)</td><td class="columna9">Asesor(@)</td><td>Programa</td></tr>
                    </thead>
                    <tbody class="tbod">
                        <%
                            String sql = "select DISTINCT proyecto.idproyecto, proyecto.tituloproyecto, etapa.nombreetapa, proyecto.fechainicioproyecto, proyecto.esstadoproyecto, programa.nombreprograma  from etapa, usuario, programa, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and etapa.idetapa=proyecto.etapaproyecto and programa.codigoprograma=usuario.codigoprograma;";
                            ResultSet datos = control.consultas(sql);
                            
                            while (datos.next()) {
                                
                                String estado = "Inactivo";
                                String cadenaIntegrantes = "";
                                String cadenaJurados = "";
                                String cadenaAsesor = "";
                                String idp = datos.getString("idproyecto");
                                    
                                String sql1 = "select usuario.nombres,usuario.apellidos from usuario, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and proyecto.idproyecto='" + idp + "';";
                                String sql2 = "select usuario.nombres,usuario.apellidos from usuario, usuarioevaluador, proyecto where usuario.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=usuarioevaluador.idproyecto and proyecto.idproyecto='" + idp + "';";
                                String sql3 = "select usuario.nombres,usuario.apellidos from usuario, usuarioasesor, proyecto where usuario.idusuario=usuarioasesor.idusuario and proyecto.idproyecto=usuarioasesor.idproyecto and proyecto.idproyecto='" + idp + "';";
                                    
                                ResultSet datos1 = control.consultas(sql1);
                                ResultSet datos2 = control.consultas(sql2);
                                ResultSet datos3 = control.consultas(sql3);
                                    
                                while (datos1.next()) {
                                    cadenaIntegrantes += (datos1.getString("nombres").trim() + " " + datos1.getString("apellidos").trim() + "<br>");
                                }
                                    
                                while (datos2.next()) {
                                    cadenaJurados += (datos2.getString("nombres").trim() + " " + datos2.getString("apellidos").trim() + "<br>");
                                }
                                    
                                while (datos3.next()) {
                                    cadenaAsesor += (datos3.getString("nombres").trim() + " " + datos3.getString("apellidos").trim() + "<br>");
                                }
                                    
                                if (datos.getString("esstadoproyecto").equals("1")) {
                                    estado = "Activo";
                                }
                                    
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='titulop'>" + datos.getString("tituloproyecto") + "</td>"
                                        + "<td name='nometapa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='fechainicio'>" + datos.getString("fechainicioproyecto") + "</td>"
                                        + "<td name='estadop'>" + estado + "</td>"
                                        + "<td name='nombres'>" + cadenaIntegrantes + "</td>"
                                        + "<td name='jurados'>" + cadenaJurados + "</td>"
                                        + "<td name='asesores'>" + cadenaAsesor + "</td>"
                                        + "<td name='idproyec'>" + datos.getString("nombreprograma") + "</td>");
                                    
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>            
        </div>
    </body>
</html>
