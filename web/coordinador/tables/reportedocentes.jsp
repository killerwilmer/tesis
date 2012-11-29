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
        String idLlega ="";
        int i = 0;
        
        Vector codusu = new Vector();
        Vector nomusu = new Vector();
        Vector apeusu = new Vector();
        Vector emailusu = new Vector();
        Vector teleusu = new Vector();
        Vector usujur = new Vector();
        Vector usuase = new Vector();
        Vector totpro = new Vector();
        
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
                $('#examplepp').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
            
           $(document).ready(function() {
                $('#examplepp tbody tr a.projurados img').live( 'click', function (e) {
                    var rowI = $(this).parent().attr('id');
                    $("#wraper").load('informes/verproyectosjurado.jsp?rowI=' + rowI);
                });
                $('#examplepp tbody tr a.proase img').live( 'click', function (e) {
                    var rowA = $(this).parent().attr('id');
                    $("#wraper").load('informes/verproyectosasesor.jsp?rowA=' + rowA);
                });
            } );
            
        </script>

    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 5px; margin-right: 5px">
            <h1 style="text-align: center">INFORMACÓN DOCENTES</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplepp" width="100%">
                    <thead>
                        <tr><td>#</td><td>Codigo</td><td>Nombres</td><td>Apellidos</td><td>E-mail</td><td>Número Telefónico</td><td>Jurado</td><td>Asesor</td><td>Total Proyectos</td></tr>
                    </thead>
                    <tbody>
                        <%
                            //String sql = "select proyecto.idproyecto, proyecto.tituloproyecto from etapa, usuario, programa, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and etapa.idetapa=proyecto.etapaproyecto and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='" + idLlega + "';";
                            int suma = 0;
                            //String sql = "select usuario.idusuario, usuario.codigousuario, usuario.nombres, usuario.apellidos, usuario.email, usuario.telefono from usuarioevaluador, proyecto, usuario, programa where usuario.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=usuarioevaluador.idproyecto and usuario.codigoprograma=programa.codigoprograma and programa.idprograma='" + idLlega + "';";
                            String sql = "select DISTINCT ON (usuario.idusuario) usuario.idusuario, usuario.codigousuario, usuario.nombres, usuario.apellidos, usuario.email, usuario.telefono  from usuario,usuarioevaluador,usuarioasesor,programa where usuario.idusuario=usuarioevaluador.idusuario or usuario.idusuario=usuarioasesor.idusuario and programa.idprograma='" + idLlega + "';";
                                
                            ResultSet datos = control.consultas(sql);
                                
                            while (datos.next()) {
                                
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("codigousuario") + "</td>"
                                        + "<td name='nombres'>" + datos.getString("nombres") + "</td>"
                                        + "<td name='apellidos'>" + datos.getString("apellidos") + "</td>"
                                        + "<td name='email'>" + datos.getString("email") + "</td>"
                                        + "<td name='numbercel'>" + datos.getString("telefono") + "</td>");
                                int dato = -1;
                                int datodos = -1;
                                String cadena = ("usuario, usuarioevaluador where usuario.idusuario=usuarioevaluador.idusuario and usuarioevaluador.idusuario='" + datos.getString("idusuario") + "'");
                                String cadenados = ("usuario, usuarioasesor where usuario.idusuario=usuarioasesor.idusuario and usuarioasesor.idusuario='" + datos.getString("idusuario") + "'");
                                    
                                dato = control.darCont(cadena);
                                datodos = control.darCont(cadenados);
                                int jur = dato;
                                int ase = datodos;
                                suma = jur + ase;
                                out.print("<td>" + dato + "<a id='"+datos.getString("idusuario")+"' class='projurados'><img id='ico' src='../recursos/Imagenes/Coordinador/lupa.png' alt='' /></a></td>");
                                out.print("<td>" + datodos + "<a id='"+datos.getString("idusuario")+"' class='proase'><img id='ico' src='../recursos/Imagenes/Coordinador/lupa.png' alt='' /></a></td>");
                                out.print("<td>" + suma + "</td>");
                                
                                codusu.add(datos.getString("codigousuario"));
                                nomusu.add(datos.getString("nombres"));
                                apeusu.add(datos.getString("apellidos"));
                                emailusu.add(datos.getString("email"));
                                teleusu.add(datos.getString("telefono"));
                                usujur.add(jur);
                                usuase.add(ase);
                                totpro.add(suma);                                                             

                                suma = 0;
                                jur = 0;
                                ase = 0;
                                i++;
                            }
                                
                            sesionOk.setAttribute("codusu", codusu);
                            sesionOk.setAttribute("nomusu", nomusu);
                            sesionOk.setAttribute("apeusu", apeusu);
                            sesionOk.setAttribute("emailusu", emailusu);
                            sesionOk.setAttribute("telusu", teleusu);
                            sesionOk.setAttribute("usuj", usujur);
                            sesionOk.setAttribute("usase", usuase);
                            sesionOk.setAttribute("totp", totpro);
%>
                    </tbody>
                </table>
            </div>
                    <p style="text-align: center"><input id="pdf" type="button" value="VER PDF" onclick="window.open('informes/imprimirreportedocente.jsp')"></p>
                    
        </div>
    </body>
</html>
