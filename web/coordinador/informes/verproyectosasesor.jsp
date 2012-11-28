<%-- 
    Document   : verproyectosjurado
    Created on : 28/11/2012, 12:59:55 AM
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
    String idLlega = "";
    int idproyecto=0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
        idproyecto = Integer.parseInt(request.getParameter("rowA"));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script>
            $(document).ready(function() {
                $(".volverproyectodocc").click(function(event) {
                    $("#wraper").load('tables/reportedocentes.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volverproyectodocc" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: -40px;">LISTA PROYECTOS COMO ASESOR</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead>
                        <tr><td class="columnanumeros">#</td><td class="columnaidproyecto">IdProyecto</td><td>Nombre Proyecto</td><td>Etapa</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                        String sql ="select proyecto.idproyecto, proyecto.tituloproyecto, etapa.nombreetapa from proyecto, usuarioasesor, etapa where usuarioasesor.idproyecto=proyecto.idproyecto and proyecto.etapaproyecto=etapa.idetapa and usuarioasesor.idusuario='" + idproyecto + "';";
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idproyecto") + "</td>"
                                        + "<td name='nomproyecto'>" + datos.getString("tituloproyecto") + "</td>"
                                        + "<td name='nomproyecto'>" + datos.getString("nombreetapa") + "</td>");
                                           i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>

