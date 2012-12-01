<%-- 
    Document   : modificarfacultad
    Created on : 14-abr-2012, 2:00:31
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>      
        <script type="text/javascript">
            $(document).ready(function(){
                $("#comboprograma").click(function(){
                    var codigo = $(this).val()
                    $("#salida").load('ediccion/listaprograma.jsp?codigo='+codigo);
                    $("#salida").slideDown();
                });
            });
        </script>      
    </head>
    <body>
        <fieldset id="combomodfac">
            <span>
                <select id="comboprograma" name="comboprograma" style="margin-left: 10px; border-radius: 5px;">
                    <option selected="" value="*">Seleccione Programa a Modificar</option>
                    <%
                      out.print(control.comboprograma("programa"));
                    %>
                </select>
            </span>
        </fieldset><br/>
        <div id="salida"> </div>
    </body>
</html>
