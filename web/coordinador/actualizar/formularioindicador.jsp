<%-- 
    Document   : formularioindicador
    Created on : 21/11/2012, 05:34:32 PM
    Author     : Alex
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    ConectaDb cont = new ConectaDb();
    String idProgram = "";
    int idindicador=0;
    int i=0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idProgram = (String) sesionOk.getAttribute("coordinador");
        idindicador = Integer.parseInt(request.getParameter("rowIDAPI"));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funsionesindi.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volverindicador").click(function(event) {
                    $("#wraper").load('actualizar/listaindicadores.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volverindicador" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="ticactualizaraspecto">ACTUALIZAR ASPECTO</h1>
        <fieldset id="fielactualizaraspecto">
            <%
                String sql = "select aspecto.idaspecto, aspecto.nombreaspecto, nombreindicador from aspecto, indicador where indicador.idaspecto=aspecto.idaspecto and indicador.idindicador='" + idindicador + "'";
                ResultSet datos = cont.consultas(sql);
                while (datos.next()) {
                    out.print("<label for='surname'>Nombre Aspecto Actual</label><br/><input type='text' disabled='true' name='nombreasp' id='nombreasp' value='" + datos.getString("nombreaspecto") + "'/><input type='hidden'name='idaspact' id='idaspact' value='" + datos.getString("idaspecto") + "'/><br/>");
                    out.print("<select id='comboaspecto' name='comboaspecto'>"
                            + "<option selected='' value='*'>Seleccione Aspecto</option>" + cont.comboaspecto("etapa, aspecto", idProgram) + "</select><br/>");
                    out.print("<input type='hidden' name='idindi' id='idindi' value='" + idindicador + "'/>");
                    out.print("<label for='surname'>Nombre</label><br/><textarea id='nombreindicador' name='nombreindicador' class='input_field_12em'>" + datos.getString("nombreindicador") + "</textarea>");
                    i++;
                }
            %>
            <br/><input id="boton_actualizarindicador" type="button" value="Actualizar" name="boton_actualizarindicador"/>
            <br/><br/>
            <div id="resultados" >
            </div>
        </fieldset>
    </body>
</html>
