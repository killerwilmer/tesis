<%-- 
    Document   : verindicadores
    Created on : 21/11/2012, 07:29:33 AM
    Author     : Alex
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>

<% 
    ConectaDb control = new ConectaDb();
    int idaspecto = Integer.parseInt(request.getParameter("rowIDAPV"));
    int i=0;
    String inicio = "select ";
    String campo = "nombreaspecto";
    String fin = " from aspecto where idaspecto='" + idaspecto + "';";
    String nombreAspecto = control.retornoCodigo(inicio, campo, fin);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volverindicador").click(function(event) {
                    $("#wraper").load('actualizar/listaAspectos.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    
    <body>
        <img class="volverindicador" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <div id="container" style="margin-left: 30px; margin-right: 30px">
            <h1 style="text-align: center" id="titindicadores">LISTA INDICADORES</h1>
            <div id="demo">
                <input type="text" id="nomaspecto" disabled="true" value='<% out.print(nombreAspecto);%>'><br/><br/>
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="exampleeliindi" width="100%">
                    <thead id="inte">
                        <tr><td class="columnanumeral">#</td><td>Indicador</td><td id="eliminarintegrante">Eliminar</td></tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "select idindicador, nombreindicador from indicador, aspecto where indicador.idaspecto=aspecto.idaspecto and aspecto.idaspecto='" + idaspecto + "';";
                            ResultSet datos = control.consultas(sql);
                            while (datos.next()) {
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='nomindica'>" + datos.getString("nombreindicador") + "</td>"
                                        + "<td name='eliminar' id='" + i + "'><a id='" + datos.getString("idindicador") + "' class='deletesindicador'><img id='act' src='../recursos/Imagenes/Coordinador/eliminar.png' alt='' /></a></td>");
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="resultados" >
            </div>                    
        </div>
    </body>
</html>
