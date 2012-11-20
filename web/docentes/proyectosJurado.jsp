<%-- 
    Document   : proyectosJurado
    Created on : 5/11/2012, 10:19:28 AM
    Author     : Alex
--%>

<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>
<%@page import="java.util.Vector"%>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesionOk = request.getSession();
    int idDocente = (Integer) sesionOk.getAttribute("idDocente");
    sesionOk.setAttribute("tipodoc", 2 );
    int i = 0;
    String miRutaImg = config.getServletContext().getRealPath("/") + "img/lupa.png";
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

        <link rel="stylesheet" type="text/css" href="../recursos/Css/Docente/estiloFormularios.css" />

        <script>
            $(document).ready(function() {
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })      
        </script>

        <script type="text/javascript">
            $(document).ready(function() {
                $(".documento").click(function(event) {
                    alert("old " + document.getElementsByName("titulop").id);
                    $("#wraper").load('documento.jsp');
                });
            });
            
            $(document).ready(function() {
                $('#example tbody tr a.delete img').live( 'click', function (e) {
                    var rowID = $(this).parent().attr('id');
                    
                    //sesionOk.setAttribute("pro", rowID);
                    $("#wraper").load('documento.jsp?rowID=' + rowID);
                    //alert(rowID);
                });
            } );
        </script>
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 5px; margin-right: 5px">
            <h1 class="tituloreporte" style="text-align: center">PROYECTOS DE INVESTIGACIÓN ASIGNADOS COMO JURADO</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%" style="text-align: center">
                    <thead >
                        <tr><td class="columna1">No.</td><td class="columna2">Id</td><td class="columna3">Nombre Proyecto</td><td class="columna4">Etapa</td><td class="columna5">Integrantes</td><td class="columna6">Jurados</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "select proyecto.idproyecto, proyecto.tituloproyecto, etapa.nombreetapa from proyecto, usuarioevaluador, etapa where proyecto.idproyecto=usuarioevaluador.idproyecto and etapa.idetapa=proyecto.etapaproyecto and usuarioevaluador.idusuario='" + idDocente + "';";
                            ResultSet datos = control.consultas(sql);

                            while (datos.next()) {

                                String cadenaIntegrantes = "";
                                String cadenaAsesor = "";
                                String idp = datos.getString("idproyecto");

                                String sql1 = "select usuario.nombres,usuario.apellidos from usuario, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and proyecto.idproyecto='" + idp + "';";
                                String sql3 = "select usuario.nombres,usuario.apellidos from usuario, usuarioasesor, proyecto where usuario.idusuario=usuarioasesor.idusuario and proyecto.idproyecto=usuarioasesor.idproyecto and proyecto.idproyecto='" + idp + "';";

                                ResultSet datos1 = control.consultas(sql1);
                                ResultSet datos3 = control.consultas(sql3);

                                while (datos1.next()) {
                                    cadenaIntegrantes += (datos1.getString("nombres").trim() + " " + datos1.getString("apellidos").trim() + "<br>");
                                }

                                while (datos3.next()) {
                                    cadenaAsesor += (datos3.getString("nombres").trim() + " " + datos3.getString("apellidos").trim() + "<br>");
                                }

                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='idproyec'>" + datos.getString("idproyecto") + "</td>"
                                        + "<td name='titulop' id='" + i + "'>"+datos.getString("tituloproyecto")+" <a id='"+datos.getString("idproyecto")+"' class='delete'><img src='../img/lupa.gif' alt='' /></a></td>"
                                        + "<td name='etapa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='nombres'>" + cadenaIntegrantes + "</td>"
                                        + "<td name='asesores'>" + cadenaAsesor + "</td>");
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>           
        </div>
    </body>
</html>
