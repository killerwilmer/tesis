<%-- 
    Document   : lisindicadores
    Created on : 24/11/2012, 08:30:09 PM
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
    //String idSe = "";
    String idLlega="";
    String idLlegaproyecto="";
    int idaspect=0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es Obligación Identificarse"/>
</jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
        //idLlega = (String) sesionOk.getAttribute("idp");
        idLlegaproyecto = (String) sesionOk.getAttribute("idpro");
        idaspect = Integer.parseInt(request.getParameter("rowIDINDI"));  
    }
   double sumatoria=0;
   int contador=0;
   double sumatoriaindi=0;
   ResultSet datosdos;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>           
            $(document).ready(function() {              
                $('#ex tr a.deletesevaluandos img').live( 'click', function (e) {
                    var rowEva = $(this).parent().attr('id');
                    $("#contenedorapectos").load('listaevaluandos.jsp?rowEva=' + rowEva);
                });
            } );
        </script>
    </head>
    <body>
        <div id="container" style="margin-left: 20px; margin-right: 20px">
            <h1 style="text-align: center; margin-top: -20px;">Indicadores</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="ex" width="100%">
                    <thead>
                        <tr style="font-size: 15px; font-weight: bold;"><td class="columnanumeros">#</td><td class="columnaidproyecto">Id Indicador</td><td>Nombre Indicador</td><td class="columnanumeros">Jurados</td><td class="columnanumeros">Notas</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "select indicador.idindicador, nombreindicador from aspecto, etapa, indicador where aspecto.idetapa=etapa.idetapa and aspecto.idaspecto=indicador.idaspecto and aspecto.idaspecto='" + idaspect + "' and etapa.idprograma='" + idLlega + "';";
                            ResultSet datos = control.consultas(sql);
                            while (datos.next()) {
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idindicador") + "</td>"
                                        + "<td name='nomindi'>" + datos.getString("nombreindicador") + "</td>"
                                        + "<td name='evaluandos' id='" + i + "'><a id='" + datos.getString("idindicador") + "' class='deletesevaluandos'><img id='act' src='../recursos/Imagenes/Coordinador/lupa.png' alt='' /></a></td>");
                                            
                                String sqldoss = "select notaevaluacion from usuarioevaluador, evaluacion, indicador, proyecto where indicador.idindicador=evaluacion.idindicador and evaluacion.idusuario=usuarioevaluador.idusuario and proyecto.idproyecto=evaluacion.idproyecto and usuarioevaluador.idproyecto=proyecto.idproyecto and evaluacion.idproyecto='" + idLlegaproyecto + "' and indicador.idindicador='" + datos.getString("idindicador") + "';";
                                    
                                datosdos = control.consultas(sqldoss);
                                while (datosdos.next()) {
                                    sumatoria += Integer.parseInt(datosdos.getString("notaevaluacion"));
                                    contador++;
                                }
                                sumatoria = sumatoria / contador;
                                out.print("<td name='cod'>" + sumatoria + "</td>");
                                i++;
                                sumatoriaindi += sumatoria;
                                sumatoria = 0;
                                contador = 0;
                            }
                            sumatoriaindi = sumatoriaindi / i;
                        %>                       
                        <tr style="font-size: 15px; font-weight: bold;"><td colspan="4">Calificación Final del Aspecto</td><td name="calificacionfinal"><%out.print(sumatoriaindi);%></td></tr>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
