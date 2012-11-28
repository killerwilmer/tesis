<%-- 
    Document   : listaevaluandos
    Created on : 24/11/2012, 08:40:09 PM
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
    String idSe = "";
    String idLlega="";
    int idindi=0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es Obligación Identificarse"/>
</jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
        idLlega = (String) sesionOk.getAttribute("idpro");
        idindi = Integer.parseInt(request.getParameter("rowEva"));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>                      
            $(document).ready(function() {
                $(".vole").click(function(event) {
                    $("#contenedorapectos").load('lisindicadores.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="vole" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: -38px;">Nota Indicador Por Jurados</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="exx" width="100%">
                    <thead>
                        <tr style="font-size: 15px; font-weight: bold;"><td class="columnanumeros">#</td><td class="columnaidproyecto">Id Jurado</td><td>Observaciones</td><td class="columnanumeros">Fecha</td><td class="columnanumeros">Notas</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "select usuarioevaluador.idusuario, observacionevaluacion, fechaevaluacion, notaevaluacion from usuarioevaluador, evaluacion, indicador, proyecto where indicador.idindicador=evaluacion.idindicador and evaluacion.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=evaluacion.idproyecto and usuarioevaluador.idproyecto=proyecto.idproyecto and evaluacion.idproyecto='" + idLlega + "' and indicador.idindicador='" + idindi + "';";
                            //out.print(idLlega);
                            ResultSet datos = control.consultas(sql);
                            while (datos.next()) {
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idusuario") + "</td>"
                                        + "<td name='nomindi'>" + datos.getString("observacionevaluacion") + "</td>"
                                        + "<td name='nomindi'>" + datos.getString("fechaevaluacion") + "</td>"
                                        + "<td name='nomindi'>" + datos.getString("notaevaluacion") + "</td>");
                                i++;
                            }
                        %>                       
                        <tr style="font-size: 15px; font-weight: bold;"><td  colspan="4">Calificación Final del Indicador</td><td name="calificacionfinal">5</td></tr>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
