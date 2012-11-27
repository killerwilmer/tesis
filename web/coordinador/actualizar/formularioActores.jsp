<%-- 
    Document   : formularioActores
    Created on : 17/11/2012, 10:47:29 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesionOk = request.getSession();
    int idproyecto = Integer.parseInt(request.getParameter("rowIDPR"));
    sesionOk.setAttribute("idProyecto", idproyecto);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $(".btnintegrantes").click(function(event) {
                    $("#cont").load('actualizar/tablaactores.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".btnjurados").click(function(event) {
                    $("#cont").load('actualizar/tablajurados.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".btnasesores").click(function(event) {
                    $("#cont").load('actualizar/tablaasesor.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".volver").click(function(event) {
                    $("#wraper").load('actualizar/listarProyectos.jsp');
                    $.getScript('js/b.js');
                });           
            });
        </script>
    </head>
    <body>
        <div>
            <img class="volver" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
            <div id="actoresproyecto">
                <ul class="menactores">
                    <li><a href="#" class="btnintegrantes"><span>Integrantes</span></a></li>
                    <li><a href="#" class="btnjurados"><span>Jurados</span></a></li>
                    <li><a href="#" class="btnasesores"><span>Asesor</span></a></li>
                </ul>
            </div>
            <div id="cont"></div>
        </div>
    </body>
</html>
