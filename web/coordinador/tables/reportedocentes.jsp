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
        
        String idLlega = (String) sesionOk.getAttribute("coordinador");
        int i = 0;
        
        /*Vector codigo = new Vector();
        Vector nombreprograma = new Vector();
        Vector idPrograma = new Vector();
        Vector idFacultad = new Vector();
        
        sesionOk.setAttribute("codigo", codigo);
        sesionOk.setAttribute("idpro", idPrograma);
        sesionOk.setAttribute("idfacul", idFacultad);
        sesionOk.setAttribute("nombreprograma", nombreprograma);*/
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
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
        </script>

    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 5px; margin-right: 5px">
            <h1 style="text-align: center">INFORMACÓN DOCENTES</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead>
                        <tr><td>#</td><td>IdPrograma</td><td>IdFacultad</td><td>Codigo Programa</td><td>Nombre Programa</td><td>seis</td></tr>
                    </thead>
                    <tbody>
                        <%
                        //String sql = "select proyecto.idproyecto, proyecto.tituloproyecto from etapa, usuario, programa, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and etapa.idetapa=proyecto.etapaproyecto and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='" + idLlega + "';";
                                  
                       String sql ="select usuario.codigousuario, usuario.nombres, usuario.apellidos, usuario.email, usuario.telefono from usuarioevaluador, proyecto, usuario where usuario.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=usuarioevaluador.idproyecto and proyecto.idproyecto='" + idLlega + "';";
                       
                        ResultSet datos = control.consultas(sql);                         
                            
                            while (datos.next()) {
               
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("codigousuario") + "</td>"
                                        + "<td name='nombres'>" + datos.getString("nombres") + "</td>"
                                        + "<td name='apellidos'>" + datos.getString("apellidos") + "</td>"
                                        + "<td name='email'>" + datos.getString("email") + "</td>"
                                        + "<td name='numbercel'>" + datos.getString("telefono") + "</td>");
                                                               
                                
                                            
                                //idPrograma.add(datos.getString("idprograma"));
                                //idFacultad.add(datos.getString("idfacultad"));
                                //codigo.add(datos.getString("codigoprograma"));
                                //nombreprograma.add(datos.getString("nombreprograma"));
                                    
                                i++;
                            }
                                
                            //sesionOk.setAttribute("idpro", idPrograma);
                            //sesionOk.setAttribute("idfacul", idFacultad);
                            //sesionOk.setAttribute("nombreprograma", codigo);
                            //sesionOk.setAttribute("codigo", nombreprograma);
                        %>
                    </tbody>
                </table>
            </div>
                    <p style="text-align: center"><input id="pdf" type="button" value="VER PDF" onclick="window.open('tables/imprimir.jsp')"></p>
                    
        </div>
    </body>
</html>
