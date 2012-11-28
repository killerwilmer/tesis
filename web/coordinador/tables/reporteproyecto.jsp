<%-- 
    Document   : repor1
    Created on : 07-oct-2012, 5:10:33
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>
<%@page import="java.util.Vector"%>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idLlega = "";
    int i = 0;
    Vector idproyecto = new Vector();
    Vector tituloproyecto = new Vector();
    Vector etapa = new Vector();
    Vector fechainicio = new Vector();
    Vector estados = new Vector();
    Vector integrantes = new Vector();
    Vector jurados = new Vector();
    Vector asesores = new Vector();
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
       idLlega = (String) sesionOk.getAttribute("coordinador");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes</title>
        <script type="text/javascript" src="tables/js/jquery-ui-1.8.23.custom.min.js"></script>
        <script type="text/javascript" src="tables/js/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="tables/js/jquery.dataTables.min.js"></script>

        <link type="text/css" href="tables/css/trontastic/jquery-ui-1.8.23.custom.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/trontastic/jquery.ui.base.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/trontastic/jquery.ui.all.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/demo_page.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/jquery.dataTables_themeroller.css" rel="stylesheet"/>
        
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />

        <script>
            $(document).ready(function() {
                $('#examplep3').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })      
        </script>
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 5px; margin-right: 5px">
            <h1 class="tituloreporte" style="text-align: center">PROYECTOS DE INVESTIGACIÓN</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplep3" width="100%" style="text-align: center">
                    <thead >
                        <tr><td class="columna1">No.</td><td class="columna2">Id</td><td class="columna3">Titulo</td><td class="columna4">Etapa Actual</td><td class="columna5">Fecha Inicio</td><td class="columna6">Estado</td><td class="columna7">Integrantes</td><td class="columna8">Jurado(s)</td><td class="columna9">Asesor(@)</td></tr>
                    </thead>
                    <tbody class="tbod">
                        <%
                            String sql = "select DISTINCT proyecto.idproyecto, proyecto.tituloproyecto, etapa.nombreetapa, proyecto.fechainicioproyecto, proyecto.esstadoproyecto from etapa, usuario, programa, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and etapa.idetapa=proyecto.etapaproyecto and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='" + idLlega + "';";
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
                                        + "<td name='idproyec'>" + datos.getString("idproyecto") + "</td>"
                                        + "<td name='titulop'>" + datos.getString("tituloproyecto") + "</td>"
                                        + "<td name='nometapa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='fechainicio'>" + datos.getString("fechainicioproyecto") + "</td>"
                                        + "<td name='estadop'>" + estado + "</td>"
                                        + "<td name='nombres'>" + cadenaIntegrantes + "</td>"
                                        + "<td name='jurados'>" + cadenaJurados + "</td>"
                                        + "<td name='asesores'>" + cadenaAsesor + "</td>");
                                            
                                            
                                idproyecto.add(datos.getString("idproyecto"));
                                tituloproyecto.add(datos.getString("tituloproyecto"));
                                etapa.add(datos.getString("nombreetapa"));
                                fechainicio.add(datos.getString("fechainicioproyecto"));
                                estados.add(estado);
                                integrantes.add(cadenaIntegrantes);
                                jurados.add(cadenaJurados);
                                asesores.add(cadenaAsesor);
                                    
                                i++;
                            }
                                
                            sesionOk.setAttribute("idpro", idproyecto);
                            sesionOk.setAttribute("titulo", tituloproyecto);
                            sesionOk.setAttribute("etapa", etapa);
                            sesionOk.setAttribute("fechainicio", fechainicio);
                            sesionOk.setAttribute("estados", estados);
                            sesionOk.setAttribute("integrantes", integrantes);
                            sesionOk.setAttribute("jurados", jurados);
                            sesionOk.setAttribute("asesores", asesores);
                        %>
                    </tbody>
                </table>
            </div>
            <p style="text-align: center"><input id="pdf" type="button" value="VER PDF" onclick="window.open('informes/imprimireporteproyecto.jsp')"></p>            
        </div>
    </body>
</html>
