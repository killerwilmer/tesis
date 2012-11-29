<%-- 
    Document   : repor1
    Created on : 28-nov-2012, 5:10:33
    Author     : ALEX-PC
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
        int j = 0;
        
        Vector nombresape = new Vector();
        Vector totaljur = new Vector();
        Vector totalase = new Vector();
        Vector totalpro = new Vector();
        
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
            
        </script>

    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 5px; margin-right: 5px">
            <h1 style="text-align: center">PROYECTO ASIGNADOS POR DOCENTE</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplepp" width="100%">
                    <thead>
                        <tr><td>#</td><td class="nomape">Nombres</td>
                        <% 
                            String sqle = "select idetapa, nombreetapa from etapa where etapa.idprograma='" + idLlega + "';";
                            ResultSet datose = control.consultas(sqle);
                            while (datose.next()) {
                                out.print("<td>" + datose.getString("nombreetapa") + "</td>");                                
                            }
                        %>
                        <td>N° Jurado</td><td>N° Asesor</td><td>Total Proyectos</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            //String sql = "select proyecto.idproyecto, proyecto.tituloproyecto from etapa, usuario, programa, usuarioproyecto, proyecto where usuario.idusuario=usuarioproyecto.idusuario and proyecto.idproyecto=usuarioproyecto.idproyecto and etapa.idetapa=proyecto.etapaproyecto and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='" + idLlega + "';";
                            int suma = 0;int total=0;
                            //String sql = "select usuario.idusuario, usuario.nombres, usuario.apellidos from usuarioevaluador, proyecto, usuario, programa where usuario.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=usuarioevaluador.idproyecto and usuario.codigoprograma=programa.codigoprograma and programa.idprograma='" + idLlega + "';";                                
                            String sql = "select DISTINCT ON (usuario.idusuario) usuario.idusuario, usuario.nombres, usuario.apellidos from usuario,usuarioevaluador,usuarioasesor,programa where usuario.idusuario=usuarioevaluador.idusuario or usuario.idusuario=usuarioasesor.idusuario and programa.idprograma='" + idLlega + "';";
                            
                            ResultSet datos = control.consultas(sql);
                                
                            while (datos.next()) {                               
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='nombres'>" + datos.getString("nombres") +" "+datos.getString("apellidos")+"</td>");  
                                                                    
                                String sqlee = "select idetapa, nombreetapa from etapa where etapa.idprograma='" + idLlega + "';";
                                ResultSet datosee = control.consultas(sqlee);
                                while (datosee.next()) {
                                    int datox = -1;                                   
                                    String cadena = ("etapa, proyecto, usuarioevaluador where proyecto.idproyecto=usuarioevaluador.idproyecto and proyecto.etapaproyecto=etapa.idetapa and etapa.idetapa='" + datosee.getString("idetapa") + "' and etapa.idprograma='" + idLlega+ "' and usuarioevaluador.idusuario='"+ datos.getString("idusuario") +"';");                                  
                                    datox = control.darCont(cadena);                                   
                                    int jurx = datox;                                   
                                    out.print("<td>" + jurx + "</td>");
                                    suma += jurx;                                   
                                    jurx=0;
                                }
                                int datodos = -1;
                                out.print("<td>" + suma + "</td>");
                                String cadenados = ("usuario, usuarioasesor where usuario.idusuario=usuarioasesor.idusuario and usuarioasesor.idusuario='" + datos.getString("idusuario") + "'");
                                datodos = control.darCont(cadenados);
                                out.print("<td>" + datodos + "</td>");
                                total = suma + datodos;
                                out.print("<td>" + total + "</td>");
                                /*codusu.add(datos.getString("codigousuario"));
                                nomusu.add(datos.getString("nombres"));
                                apeusu.add(datos.getString("apellidos"));
                                emailusu.add(datos.getString("email"));
                                teleusu.add(datos.getString("telefono"));
                                usujur.add(jur);
                                usuase.add(ase);
                                totpro.add(suma); */                                                            

                                suma = 0;
                                i++;
                            }
                                
                            /*sesionOk.setAttribute("codusu", codusu);
                            sesionOk.setAttribute("nomusu", nomusu);
                            sesionOk.setAttribute("apeusu", apeusu);
                            sesionOk.setAttribute("emailusu", emailusu);
                            sesionOk.setAttribute("telusu", teleusu);
                            sesionOk.setAttribute("usuj", usujur);
                            sesionOk.setAttribute("usase", usuase);
                            sesionOk.setAttribute("totp", totpro);*/
%>
                    </tbody>
                </table>
            </div>
                    <p style="text-align: center"><input id="pdf" type="button" value="VER PDF" onclick="window.open('informes/imprimirreportedocente.jsp')"></p>
                    
        </div>
    </body>
</html>

