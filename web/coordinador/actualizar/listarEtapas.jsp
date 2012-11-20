<%-- 
    Document   : listarEtapas
    Created on : 15/11/2012, 05:49:50 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>

<% ConectaDb control = new ConectaDb();
   HttpSession sesionOk = request.getSession();
   int i = 0;    
   String idLlega = (String) sesionOk.getAttribute("coordinador");
%>
<!DOCTYPE html>
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
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
           $(document).ready(function() {
                $('#example tbody tr a.delete img').live( 'click', function (e) {
                    var rowID = $(this).parent().attr('id');                 
                    //sesionOk.setAttribute("pro", rowID);
                    $("#wraper").load('actualizar/formularioEtapa.jsp?rowID=' + rowID);
                    //alert(rowID);
                });
            } );
        </script>
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 150px; margin-right: 150px">
            <h1 style="text-align: center">LISTA ETAPAS</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead>
                        <tr><td>#</td><td>IdEtapa</td><td>Nombre Etapa</td><td id="columaactualizar">Actualizar</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                       String sql ="select idetapa, nombreetapa from etapa where etapa.idprograma='" + idLlega + "';";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idetapa") + "</td>"
                                        + "<td name='nometapa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='actualizar' id='" + i + "'><a id='"+datos.getString("idetapa")+"' class='delete'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>");                                                                       
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
