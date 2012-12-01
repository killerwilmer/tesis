<%-- 
    Document   : veraspectos
    Created on : 30/11/2012, 07:40:02 AM
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
    int idprograma = 0;
    HttpSession sesionOk = request.getSession();       
    idprograma = Integer.parseInt(request.getParameter("rowIDPRRA"));
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
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })      
        </script>
    </head>
    <body>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: 0px;">LISTA DE ETAPAS DE LOS PROGRAMAS</h1>
            <div id="demo">
                <table cellpadding="0"  cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead id="inte">
                        <tr><td>#</td><td>Nombre Etapa</td><td>Nombre Aspectos</td><td>Nombre Indicadores</td></tr>
                    </thead>
                    <tbody>
                       <%   
                        String sql ="select nombreetapa, idetapa from etapa, programa where programa.idprograma=etapa.idprograma and etapa.idprograma='"+idprograma+"';";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) { 
                                String cad="";
                                String cad1="";
                                String cadena = ("select nombreaspecto, idaspecto from aspecto, etapa where etapa.idetapa=aspecto.idetapa and etapa.idetapa='" + datos.getString("idetapa") + "'");
                                ResultSet datos1 = control.consultas(cadena);
                                while (datos1.next()) {
                                    cad += "<table cellpadding='0'  cellspacing='0' border='0'><tr><td id='tablados'>"+(datos1.getString("nombreaspecto").trim()+ "</td></tr></table>");
                                
                                    String cadenados = ("select nombreindicador from indicador, aspecto where aspecto.idaspecto=indicador.idaspecto and indicador.idaspecto='" + datos1.getString("idaspecto") + "'");
                                    ResultSet datos2 = control.consultas(cadenados);
                                    while (datos2.next()){
                                           cad1 += "<table cellpadding='0'  cellspacing='0' border='0'><tr><td id='tablados'>"+(datos2.getString("nombreindicador").trim()+ "</td></tr></table>");      
                                    }
                                } 
                                        out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("nombreetapa") +"</td>"
                                        + "<td name='codigo'>" + cad +"</td>"
                                        + "<td name='codigo'>" + cad1 +"</td>");                                              
                                 i++;
                            }
                        %>
                    <div style="padding: "></div>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
