<%-- 
    Document   : listaAspectos
    Created on : 21/11/2012, 05:42:15 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    ConectaDb control = new ConectaDb();
    int i = 0;
    String idLlega = "";
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
                $('#exampleaspecto').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
            $(document).ready(function() {
                $('#exampleaspecto tbody tr a.deleteaspecto img').live( 'click', function (e) {
                    var rowIDAP = $(this).parent().attr('id');
                    $("#wraper").load('actualizar/formularioAspecto.jsp?rowIDAP=' + rowIDAP);
                });
                $('#exampleaspecto tbody tr a.deleteasverasp img').live( 'click', function (e) {
                    var rowIDAPV = $(this).parent().attr('id');
                    $("#wraper").load('actualizar/verindicadores.jsp?rowIDAPV=' + rowIDAPV);
                });
            } );
        </script>

    </head>
    <body>
       <div id="container" style="margin-left: 30px; margin-right: 30px; margin-bottom: 20px;">
            <h1 style="text-align: center">LISTA ASPECTOS</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="exampleaspecto" width="100%">
                    <thead id="inte">
                        <tr><td class="columnanumeral">#</td><td class="ne">Nombre Etapa</td><td>Aspecto</td><td class="columaactualizara">Actualizar</td><td class="columaver">Ver Indicadores</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                       String sql ="select nombreetapa, idaspecto, nombreaspecto from etapa, aspecto where aspecto.idetapa=etapa.idetapa and etapa.idprograma='" + idLlega + "';";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='nometapa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='nomaspecto'>" + datos.getString("nombreaspecto") + "</td>"
                                        + "<td name='actualizar' id='" + i + "'><a id='"+datos.getString("idaspecto")+"' class='deleteaspecto'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>"
                                        + "<td name='ver' id='" + i + "'><a id='"+datos.getString("idaspecto")+"' class='deleteasverasp'><img id='act' src='../recursos/Imagenes/Coordinador/lupa.png' alt='' /></a></td>");                                                                                                              
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
