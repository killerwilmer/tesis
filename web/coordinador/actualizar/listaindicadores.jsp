<%-- 
    Document   : listaindicadores
    Created on : 21/11/2012, 10:34:33 AM
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
        <script type="text/javascript" src="actualizar/funcion2.js"></script>
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
                $('#exampleind').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
            $(document).ready(function() {
                $('#exampleind tbody tr a.deleteindi img').live( 'click', function (e) {
                    var rowIDAPI = $(this).parent().attr('id');
                    $("#wraper").load('actualizar/formularioindicador.jsp?rowIDAPI=' + rowIDAPI);
                });
            } );
        </script>

    </head>
    <body>
       <div id="container" style="margin-left: 30px; margin-right: 30px">
            <h1 style="text-align: center">LISTA INDICADORES</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="exampleind" width="100%">
                    <thead id="inte">
                        <tr><td class="columnanumeral">#</td><td>Nombre Indicador</td><td class="columaactualizara">Actualizar</td><td class="columaver">Eliminar</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                       String sql ="select idindicador, nombreindicador from etapa, aspecto, indicador where indicador.idaspecto=aspecto.idaspecto and aspecto.idetapa=etapa.idetapa and etapa.idprograma='" + idLlega + "';";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='nomindi'>" + datos.getString("nombreindicador") + "</td>"
                                        + "<td name='actualizar' id='" + i + "'><a id='"+datos.getString("idindicador")+"' class='deleteindi'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>"
                                        + "<td name='eliminar' id='" + i + "'><a id='" + datos.getString("idindicador") + "' class='deleteindieliminar'><img id='act' src='../recursos/Imagenes/Coordinador/eliminar.png' alt='' /></a></td>");
                              i++;
                            }
                        %>
                    </tbody>
                </table>
            </div> 
            <div id="resultados" >
            </div>  
        </div>
    </body>
</html>
