<%-- 
    Document   : liproyectos
    Created on : 23/11/2012, 05:08:06 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>

<% ConectaDb control = new ConectaDb();
   HttpSession sesionOk = request.getSession();
   int i = 0;    
   String idLlega = (String) sesionOk.getAttribute("coordinador");
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
            
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
            
        <script>
            $(document).ready(function() {
                $('#examplelp').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
            $(document).ready(function() {              
                $('#examplelp tbody tr a.deletesslp img').live( 'click', function (e) {
                    var rowIDPRR = $(this).parent().attr('id');
                    $("#wraper").load('formularioevaluaciones.jsp?rowIDPRR=' + rowIDPRR);
                });
            } );
        </script>
    </head>
    <body>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center">PROYECTOS</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplelp" width="100%">
                    <thead>
                        <tr><td class="columnanumeros">#</td><td class="columnaidproyecto">IdProyecto</td><td>Nombre Proyecto</td><td>Etapa</td><td id="columnaact" class="columaactualizar">Estado</td><td id="columnaact" class="columaactualizar">Evaluación</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "select DISTINCT proyecto.idproyecto, proyecto.tituloproyecto, nombreetapa, esstadoproyecto from proyecto, programa, usuario, usuarioproyecto, etapa where etapa.idetapa=proyecto.etapaproyecto and usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='" + idLlega + "';";
                            ResultSet datos = control.consultas(sql);
                            while (datos.next()) {
                                String estado = "Inactivo";
                                if (datos.getString("esstadoproyecto").equals("1")) {
                                    estado = "Activo";
                                }
                                
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idproyecto") + "</td>"
                                        + "<td name='nomproyecto'>" + datos.getString("tituloproyecto") + "</td>"
                                        + "<td name='nometa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='nomest'>" + estado + "</td>"
                                        + "<td name='actualizaractores' id='" + i + "'><a id='" + datos.getString("idproyecto") + "' class='deletesslp'><img id='act' src='../recursos/Imagenes/Coordinador/lupa.png' alt='' /></a></td>");
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
