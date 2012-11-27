<%-- 
    Document   : formularioLinea
    Created on : 20/11/2012, 06:29:34 AM
    Author     : Alex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    ConectaDb cont = new ConectaDb();
    int idlinea = Integer.parseInt(request.getParameter("rowIDL"));
    int i=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volveralineas").click(function(event) {
                    $("#cont1").load('actualizar/tablalinea.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volveralineas" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="ticactualizarcampo">ACTUALIZAR LINEA DE INVESTIGACIÓN</h1>
        <fieldset id="fiel">
            <%
                String sql = "select nombrelinea from linea where idlinea='" + idlinea + "'";
                ResultSet datos = cont.consultas(sql);
                while (datos.next()) {
                    out.print("<input type='hidden' name='idlinea' id='idlinea' value='" + idlinea + "'/>"); 
                    out.print("<label for='surname'>Nombre</label><br/><textarea id='nombrelinea' name='nombrelinea' class='input_field_12em'>" + datos.getString("nombrelinea") + "</textarea>");
                    i++;
                }
            %>
            <br/><input id="boton_actualizarlinea" type="button" value="Actualizar" name="boton_actualizarlinea"/>
            <br/><br/><div id="resultados" >
            </div>
        </fieldset>
    </body>
</html>
