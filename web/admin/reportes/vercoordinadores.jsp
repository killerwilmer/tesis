<%-- 
    Document   : vercoordinadores
    Created on : 30/11/2012, 05:20:54 AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: 55px;">LISTA COORDINADORES</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead id="inte">
                        <tr><td>#</td><td>Nombre</td><td>Programa</td><td>Facultad</td><td id="columaactualizar">Numero de Proyectos</td></tr>
                    </thead>
                    <tbody>
                       <%    
                       int contador=0;
                        String sql ="select nombres, apellidos, programa.nombreprograma, programa.idprograma, facultad.nombrefacultad from  usuario, coordinador, programa, facultad where usuario.idusuario=coordinador.idusuario and programa.idfacultad=facultad.idfacultad and programa.idprograma=coordinador.idprograma;";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("nombres") + " " +datos.getString("apellidos") +"</td>"
                                        + "<td name='nometapa'>" + datos.getString("nombreprograma") + "</td>"
                                        + "<td name='nometap'>" + datos.getString("nombrefacultad") + "</td>");  
                                int dato = -1;  
                                String cadena = ("proyecto, etapa, programa where proyecto.etapaproyecto=etapa.idetapa and etapa.idprograma=programa.idprograma and programa.idprograma='" + datos.getString("idprograma") + "'");
                                dato = control.darCont(cadena);
                                out.print("<td>" + dato + "</td>");
                                contador+=dato;
                                i++;
                            }
                            out.print("<tr><td colspan='4'>Total Proyectos Universidad Mariana</td><td>" + contador + "</td></tr>");
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>

