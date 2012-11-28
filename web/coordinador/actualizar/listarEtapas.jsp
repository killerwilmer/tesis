<%-- 
    Document   : listarEtapas
    Created on : 15/11/2012, 05:49:50 PM
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
    String idLlega = "";
    HttpSession sesionOk = request.getSession();
        
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
        <title>JSP Page</title>  
        <script>           
           $(document).ready(function() {
                $('#example tbody tr a.delete img').live( 'click', function (e) {
                    var rowID = $(this).parent().attr('id');                 
                    //sesionOk.setAttribute("pro", rowID);
                    $("#wraper").load('actualizar/formularioEtapa.jsp?rowID=' + rowID);
                    //alert(rowID);
                });
            } );
        </script>
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 150px; margin-right: 150px">
            <h1 style="text-align: center">LISTA ETAPAS</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead id="inte">
                        <tr><td>#</td><td>IdEtapa</td><td>Nombre Etapa</td><td id="columaactualizar">Actualizar</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                       String sql ="select idetapa, nombreetapa from etapa where etapa.idprograma='" + idLlega + "';";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='codigo'>" + datos.getString("idetapa") + "</td>"
                                        + "<td name='nometapa'>" + datos.getString("nombreetapa") + "</td>"
                                        + "<td name='actualizar' id='" + i + "'><a id='"+datos.getString("idetapa")+"' class='delete'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>");                                                                       
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
