<%-- 
    Document   : listanombresprogramas
    Created on : 30/11/2012, 07:01:40 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>           
            $(document).ready(function() {              
                $('.menactores li a.delepro span').live( 'click', function (e) {
                    var rowIDPRRA = $(this).parent().attr('id');
                    $("#contenedoradmin").load('reportes/veraspectos.jsp?rowIDPRRA=' + rowIDPRRA);
                });
            } );
        </script>
    </head>
    <body>
        <h1 class="tituloreporte" style="text-align: center; margin-top: 35px; margin-bottom: 0px;">ASPECTOS E INDICADORES POR PROGRAMA</h1>
        <div style="margin-top: 20px;" id="actoresproyecto">
            <ul class="menactores">
                <%
                    String sql = "select nombreprograma, idprograma from programa;";
                    ResultSet datos = control.consultas(sql);
                    while (datos.next()) {
                        out.print("<li><a id='" + datos.getString("idprograma") + "' class='delepro'><span>" + datos.getString("nombreprograma").toUpperCase() + "</span></a></li>");
                        i++;
                    }
                %>
            </ul>
        </div>
        <div id="contenedoradmin"></div>
    </body>
</html>
