<%-- 
    Document   : veretapas
    Created on : 30/11/2012, 06:24:19 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    ConectaDb control = new ConectaDb();
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
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })      
        </script>
    </head>
    <body>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: 55px;">LISTA DE ETAPAS DE LOS PROGRAMAS</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead id="inte">
                        <tr><td>#</td><td>Nombre Facultad</td><td>Nombre Programa</td><td>Nombre Etapas Por Programa</td></tr>
                    </thead>
                    <tbody>
                       <%    
                        String sql ="select nombreprograma, nombrefacultad, idprograma from programa, facultad where programa.idfacultad=facultad.idfacultad;";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) { 
                                String cadenaetapas = "";                                       
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("nombrefacultad") +"</td>"
                                        + "<td name='codigo'>" + datos.getString("nombreprograma") +"</td>");                                           
                                String cadena = ("select nombreetapa from etapa where etapa.idprograma='" + datos.getString("idprograma") + "'");
                                ResultSet datos1 = control.consultas(cadena);
                                while (datos1.next()) {
                                    cadenaetapas += (datos1.getString("nombreetapa").trim()+ "<br>");
                                }                    
                                out.print("<td>" + cadenaetapas + "</td>");
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
