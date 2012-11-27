<%-- 
    Document   : formulariocampo
    Created on : 20/11/2012, 03:15:26 AM
    Author     : Alex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    ConectaDb cont = new ConectaDb();
    int idecampo = Integer.parseInt(request.getParameter("rowIDC"));
    int i=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volveracampos").click(function(event) {
                    $("#cont1").load('actualizar/tablacampo.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volveracampos" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="ticactualizarcampo">ACTUALIZAR CAMPO DE INVESTIGACIÓN</h1>
        <fieldset id="fiel">
            <%
                String sql = "select nombrecampo, descripcioncampo from campo where idcampo='" + idecampo + "'";
                ResultSet datos = cont.consultas(sql);
                while (datos.next()) {
                    out.print("<input type='hidden' name='idcampo' id='idcampo' value='" + idecampo + "'/>"); 
                    out.print("<label for='surname'>Nombre</label><br/><input type='text' name='nombrecampo' id='nombrecampo' value='" + datos.getString("nombrecampo") + "'/><br/>");
                    out.print("<label for='surname'>Descripción</label><br/><textarea id='descricioncampo' name='descricioncampo' class='input_field_12em'>" + datos.getString("descripcioncampo") + "</textarea>");
                    i++;
                }
            %>
            <input id="boton_actualizarcampo" type="button" value="Actualizar" name="boton_actualizarcampo"/>
            <br/><br/><div id="resultadoscampos" >
            </div>
        </fieldset>
    </body>
</html>
