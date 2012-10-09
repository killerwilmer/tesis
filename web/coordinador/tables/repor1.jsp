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

<%
        HttpSession sesionOk = request.getSession();
        
        Vector codigo = new Vector();
        Vector nombreprograma = new Vector();
        Vector idPrograma = new Vector();
        Vector idFacultad = new Vector();
        
        sesionOk.setAttribute("codigo", codigo);
        sesionOk.setAttribute("idpro", idPrograma);
        sesionOk.setAttribute("idfacul", idFacultad);
        sesionOk.setAttribute("nombreprograma", nombreprograma);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes</title>

        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        
        <script type="text/javascript" src="tables/js/jquery-ui-1.8.23.custom.min.js"></script>
        <script type="text/javascript" src="tables/js/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="tables/js/jquery.dataTables.min.js"></script>

        <link type="text/css" href="tables/css/trontastic/jquery-ui-1.8.23.custom.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/trontastic/jquery.ui.base.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/trontastic/jquery.ui.all.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/demo_page.css" rel="stylesheet"/>
        <link type="text/css" href="tables/css/jquery.dataTables_themeroller.css" rel="stylesheet"/>

        <script>
            $(document).ready(function() {
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
        </script>

    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 50px; margin-right: 50px">
            <h1 style="text-align: center">REPORTE</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead>
                        <tr><td>#</td><td>IdPrograma</td><td>IdFacultad</td><td>Codigo Programa</td><td>Nombre Programa</td></tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet datos = control.consultas("select * from programa;");
                                
                            int i = 0;
                            while (datos.next()) {
                                out.print(control.linea(i) + "<td name='codigo'>" + (i + 1) + "</td><td name='idprogra'>" + datos.getString("idprograma") + "</td><td name='idfacu'>"
                                        + datos.getString("idfacultad") + "</td><td name='codigopro'>" + datos.getString("codigoprograma") + "</td><td name='nombre'>"
                                        + datos.getString("nombreprograma")
                                        + "</td>");
                                            
                                idPrograma.add(datos.getString("idprograma"));
                                idFacultad.add(datos.getString("idfacultad"));
                                codigo.add(datos.getString("codigoprograma"));
                                nombreprograma.add(datos.getString("nombreprograma"));
                                    
                                i++;
                            }
                                
                            sesionOk.setAttribute("idpro", idPrograma);
                            sesionOk.setAttribute("idfacul", idFacultad);
                            sesionOk.setAttribute("nombreprograma", codigo);
                            sesionOk.setAttribute("codigo", nombreprograma);
                        %>
                    </tbody>
                </table>
            </div>
                    <p style="text-align: center"><input id="pdf" type="button" value="VER PDF" onclick="window.open('tables/imprimir.jsp')"></p>
                    
        </div>
    </body>
</html>
