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
        
    Vector codest = new Vector();
    Vector nombres = new Vector();
    Vector apellidos = new Vector();
    Vector email = new Vector();
    Vector numbercel = new Vector();
    Vector titleproyect = new Vector();
        
    int i = 0;
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
            <h1 class="tituloreporte" style="text-align: center">INFORMACIÓN ESTUDIANTES</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%" style="text-align: center">
                    <thead>
                        <tr><td class="columna1">No.</td><td>Codigo</td><td>Nombres</td><td>Apellidos</td><td>E-mail</td><td>Numero Telefonico</td><td>Titulo Proyecto</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql="select usuario.codigousuario, usuario.nombres, usuario.apellidos, usuario.email, usuario.celular, proyecto.tituloproyecto from usuario, programa, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='" + idLlega + "';";
                            ResultSet datos = control.consultas(sql);

                            while (datos.next()) {
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("codigousuario") + "</td>"
                                        + "<td name='nombres'>" + datos.getString("nombres") + "</td>"
                                        + "<td name='apellidos'>" + datos.getString("apellidos") + "</td>"
                                        + "<td name='email'>" + datos.getString("email") + "</td>"
                                        + "<td name='numbercel'>" + datos.getString("celular") + "</td>"
                                        + "<td name='titleproyecto'><a href=''>" + datos.getString("tituloproyecto") + "</a></td>");
                                            
                                codest.add(datos.getString("codigousuario"));
                                nombres.add(datos.getString("nombres"));
                                apellidos.add(datos.getString("apellidos"));
                                email.add(datos.getString("email"));
                                numbercel.add(datos.getString("celular"));
                                titleproyect.add(datos.getString("tituloproyecto"));
                                    
                                i++;
                            }
                                
                            sesionOk.setAttribute("codest", codest);
                            sesionOk.setAttribute("nombres", nombres);
                            sesionOk.setAttribute("apellidos", apellidos);
                            sesionOk.setAttribute("email", email);
                            sesionOk.setAttribute("numbercel", numbercel);
                            sesionOk.setAttribute("title", titleproyect);
                        %>
                    </tbody>
                </table>
            </div>
            <p style="text-align: center"><input id="pdf" type="button" value="VER PDF" onclick="window.open('informes/imprimireporteproyecto.jsp')"></p>                
        </div>
    </body>
</html>
