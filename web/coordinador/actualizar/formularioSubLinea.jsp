<%-- 
    Document   : formularioSubLinea
    Created on : 21/11/2012, 02:33:58 AM
    Author     : Alex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    ConectaDb cont = new ConectaDb();
    HttpSession sesionOk = request.getSession();
    String idProgram = (String) sesionOk.getAttribute("idp");
    int idsublinea = Integer.parseInt(request.getParameter("rowIDS"));
    int i=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volverasublineas").click(function(event) {
                    $("#cont1").load('actualizar/tablasublinea.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volverasublineas" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="ticactualizarcampo">ACTUALIZAR SUB-LINEA DE INVESTIGACIÓN</h1>
        <fieldset id="fielsublinea">
            <%
                String sql = "select linea.nombrelinea, nombresublinea from linea, sublinea where sublinea.idlinea=linea.idlinea and idsublinea='" + idsublinea + "'";
                ResultSet datos = cont.consultas(sql);
                while (datos.next()) {
                    out.print("<label for='surname'>Nombre Linea Actual</label><br/><input type='text' disabled='true' name='nombreactuallinea' id='nombreactuallinea' value='" + datos.getString("nombrelinea") + "'/>"); 
                    out.print("<select id='combolineaactualizar' name='combolineaactualizar'>"
                    + "<option selected='' value='*'>Seleccione Linea de Investigación</option>"+cont.combolineainvestigacion("linea, grupoinvestigacion", idProgram)+"</select><br/>");
                    out.print("<input type='hidden' name='idsublinea' id='idsublinea' value='" + idsublinea + "'/>"); 
                    out.print("<label for='surname'>Nombre</label><br/><textarea id='nombresublinea' name='nombresublinea' class='input_field_12em'>" + datos.getString("nombresublinea") + "</textarea>");
                    i++;
                }
            %>
            <br/><input id="boton_actualizarsublinea" type="button" value="Actualizar" name="boton_actualizarsublinea"/>
            <br/><br/><div id="resultados" >
            </div>
        </fieldset>
    </body>
</html>
