<%-- 
    Document   : lisapectos
    Created on : 23/11/2012, 10:26:39 PM
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
    String idLlegaproyecto = "";
    int idetapa = 0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es Obligación Identificarse"/>
</jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
        idLlegaproyecto = (String) sesionOk.getAttribute("idpro");
        idetapa = Integer.parseInt(request.getParameter("rowIDPRRA"));
    }
    double sumatoria = 0;
    int contador = 0;
    double sumatoriaindi = 0;
    int contadoruno = 0;
    double notaaspecto = 0;
    double notaetapa = 0;
    ResultSet datosuno, datosdos;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>           
        $(document).ready(function() {              
            $('#exampleindicador tr a.deletesindicador img').live( 'click', function (e) {
                var rowIDINDI = $(this).parent().attr('id');
                $("#contenedorapectos").load('lisindicadores.jsp?rowIDINDI=' + rowIDINDI);
            });
        } );
    </script>
    <body>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: -20px;">Aspectos</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="exampleindicador" width="100%">
                    <thead>
                        <tr style="font-size: 15px; font-weight: bold;"><td class="columnanumeros">#</td><td class="columnaidproyecto">Id Aspecto</td><td>Nombre Aspecto</td><td id="columnaact" class="columaactualizar">Ver Indicadores</td><td class="columnanumeros">Notas</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "select aspecto.idaspecto, nombreaspecto from aspecto, etapa where aspecto.idetapa=etapa.idetapa and etapa.idetapa='" + idetapa + "' and etapa.idprograma='" + idLlega + "';";
                            ResultSet datos = control.consultas(sql);
                            while (datos.next()) {
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idaspecto") + "</td>"
                                        + "<td name='nomproyecto'>" + datos.getString("nombreaspecto") + "</td>"
                                        + "<td name='actualizaractores' id='" + i + "'><a id='" + datos.getString("idaspecto") + "' class='deletesindicador'><img id='act' src='../recursos/Imagenes/Coordinador/lupa.png' alt='' /></a></td>");
                                            
                                String sqluno = "select indicador.idindicador from aspecto, etapa, indicador where aspecto.idetapa=etapa.idetapa and aspecto.idaspecto=indicador.idaspecto and aspecto.idaspecto='" + datos.getString("idaspecto") + "' and etapa.idprograma='" + idLlega + "';";
                                datosuno = control.consultas(sqluno);
                                while (datosuno.next()) {
                                    String sqldos = "select notaevaluacion from usuarioevaluador, evaluacion, indicador, proyecto where indicador.idindicador=evaluacion.idindicador and evaluacion.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=evaluacion.idproyecto and usuarioevaluador.idproyecto=proyecto.idproyecto and evaluacion.idproyecto='" + idLlegaproyecto + "' and indicador.idindicador='" + datosuno.getString("idindicador") + "';";
                                    //out.print(sqldos);
                                    datosdos = control.consultas(sqldos);
                                    while (datosdos.next()) {
                                        sumatoria += Integer.parseInt(datosdos.getString("notaevaluacion"));
                                        contador++;
                                    }
                                    sumatoria = sumatoria / contador;
                                    sumatoriaindi += sumatoria;
                                    contadoruno++;
                                }
                                notaaspecto = sumatoriaindi / contadoruno;
                                out.print("<td name='cod'>" + notaaspecto + "</td>");
                                i++;
                                sumatoria = 0;
                                sumatoriaindi = 0;
                                contadoruno = 0;
                                contador = 0;
                                notaetapa+=notaaspecto;
                            }                         
                        %>                       
                        <tr style="font-size: 15px; font-weight: bold;"><td colspan="4">Calificación Final de la Etapa</td><td name="calificacionfinal"><% out.print(notaetapa);%></td></tr>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
