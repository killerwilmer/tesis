<%-- 
    Document   : formularioevaluaciones
    Created on : 23/11/2012, 08:33:35 PM
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
    int i = 1;
    String idLlega = "";
    String idproyecto = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idLlega = (String) sesionOk.getAttribute("coordinador");
        idproyecto = request.getParameter("rowIDPRR");
        sesionOk.setAttribute("idpro", idproyecto);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>           
            $(document).ready(function() {              
                $('.menactores li a.deletesslpetapa span').live( 'click', function (e) {
                    var rowIDPRRA = $(this).parent().attr('id');
                    $("#contenedorapectos").load('lisapectos.jsp?rowIDPRRA=' + rowIDPRRA);
                });
            } );
            
            $(document).ready(function() {
                $(".volverproyectodos").click(function(event) {
                    $("#wraper").load('liproyectos.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volverproyectodos" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <div style="margin-top: -63px;" id="actoresproyecto">
            <ul class="menactores">
            <%
                String sql = "select idetapa, nombreetapa from etapa where etapa.idprograma='" + idLlega + "';";
                ResultSet datos = control.consultas(sql);
                while (datos.next()) {
                    out.print("<li><a id='" + datos.getString("idetapa") + "' class='deletesslpetapa'><span>" + datos.getString("nombreetapa") + "</span></a></li>");
                    i++;
                }
            %>
            </ul>
        </div>
            <div id="contenedorapectos"></div>
    </body>
</html>
