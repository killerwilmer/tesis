<%-- 
    Document   : formulariogrupoinvesstigacion
    Created on : 19/11/2012, 05:59:25 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".btngrupinv").click(function(event) {
                    $("#cont1").load('actualizar/tablagrupoinv.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".btncampo").click(function(event) {
                    $("#cont1").load('actualizar/tablacampo.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".btnlinea").click(function(event) {
                    $("#cont1").load('actualizar/tablalinea.jsp');
                    $.getScript('js/b.js');
                });
                
                $(".btnsublinea").click(function(event) {
                    $("#cont1").load('actualizar/tablasublinea.jsp');
                    $.getScript('js/b.js');
                });           
            });
        </script>
    </head>
    <body>
        <div>
            <div style="margin-top: 20px;" id="actoresproyecto">
                <ul class="menactores">
                    <li><a href="#" class="btngrupinv"><span>GRUPO INVESTIGACIÓN</span></a></li>
                    <li><a href="#" class="btncampo"><span>CAMPO</span></a></li>
                    <li><a href="#" class="btnlinea"><span>LINEA INVESTIGACIÓN</span></a></li>
                    <li><a href="#" class="btnsublinea"><span>SUB-LINEA INVESTIGACIÓN</span></a></li>
                </ul>
            </div>
            <div id="cont1"></div>
        </div>
    </body>
</html>
