<%-- 
    Document   : formularioAspecto
    Created on : 21/11/2012, 06:13:57 AM
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
    int idaspecto = Integer.parseInt(request.getParameter("rowIDAP"));
    int i=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script type="text/javascript" src="actualizar/funcion2.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volveraspecto").click(function(event) {
                    $("#wraper").load('actualizar/listaAspectos.jsp');
                    $.getScript('js/b.js');
                });
            });
            
            function clearA()
            {
                $("#nuevoindicador").val("");
            }
        </script>
    </head>
    <body>
        <img class="volveraspecto" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="ticactualizaraspecto">ACTUALIZAR ASPECTO</h1>
        <fieldset id="fielactualizaraspecto">
            <%
                String sql = "select nombreetapa, nombreaspecto from etapa, aspecto where aspecto.idetapa=etapa.idetapa and aspecto.idaspecto='" + idaspecto + "'";
                ResultSet datos = cont.consultas(sql);
                while (datos.next()) {
                    out.print("<label for='surname'>Nombre Etapa Actual</label><br/><input type='text' disabled='true' name='nombreactualetapa' id='nombreactualetapa' value='" + datos.getString("nombreetapa") + "'/>");
                    out.print("<select id='comboetapaactualizar' name='comboetapaactualizar'>"
                            + "<option selected='' value='*'>Seleccione Etapa</option>" + cont.combofiltro("etapa", idProgram) + "</select><br/>");
                    out.print("<input type='hidden' name='idaspect' id='idaspect' value='" + idaspecto + "'/>");
                    out.print("<label for='surname'>Nombre</label><br/><textarea id='nombreaspectos' name='nombreaspectos' class='input_field_12em'>" + datos.getString("nombreaspecto") + "</textarea>");
                    i++;
                }
            %>
            <br/><input id="boton_actualizaraspecto" type="button" value="Actualizar" name="boton_actualizaraspecto"/>
            <br/><br/>
            <label for="surname">Asiganar Nuevos Indicadores</label><br/><textarea name="nuevoindicador" id="nuevoindicador"></textarea><br/>
            <input id="resetindi" type="button" onclick="clearA()" value="Reset Indicador" name="reset"/>
            <input id="boton_asignarnuevoindicador" type="button" value="Asignar" name="boton_asignarnuevoindicador"/>
            <br/><br/><div id="resultados" >
            </div>
        </fieldset>
    </body>
</html>
