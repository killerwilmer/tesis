<%-- 
    Document   : formularioIntegrantes
    Created on : 19/11/2012, 06:37:23 PM
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
    String idSe = "";
    int idgrupoinv=0;
    int i =0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
        idgrupoinv = Integer.parseInt(request.getParameter("rowID2"));
    }  
    //sesionOk.setAttribute("idProyecto", idproyecto);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="funciones.js"></script>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        
        <script type="text/javascript">
            // Limpiar el div del Integrante
            function clearIntegrante()
            {
                $("#integrante").val("");
                $("#result_integrante").empty();
            }
            //Para buscar el estudiante
            $(document).ready(function(){
                $("#integrante").autocomplete("wizard/integrante_buscar.jsp");
                $('#integrante').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_integrante").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/> <input disabled=\"true\" type=\"text\" name=\"idInt\" id=\"idInt\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
            
            $(document).ready(function() {
                $(".volverint").click(function(event) {
                    $("#cont1").load('actualizar/tablagrupoinv.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volverint" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="titulointegrantes" style="text-align: center">LISTA INTEGRANTES</h1>
        <div id="demo1">
            <table cellpadding="1" cellspacing="1" border="0" class="display1" id="example22" width="100%">
                <thead id="inte">
                    <tr><td>#</td><td>Nombres</td><td>Apellidos</td><td class="eliminarintegrante">Eliminar</td></tr>
                </thead>
                <tbody>
                    <%
                        String sql = "select usuario.idusuario, nombres, apellidos from usuario, usuariogrupoinvestigacion, grupoinvestigacion where usuario.idusuario=usuariogrupoinvestigacion.idusuario and grupoinvestigacion.idgrupoinvestigacion=usuariogrupoinvestigacion.idgrupoinvestigacion and grupoinvestigacion.idgrupoinvestigacion='" + idgrupoinv + "';";
                        //out.print(sql);
                        ResultSet datos = control.consultas(sql);
                        while (datos.next()) {
                            out.print(control.linea(i) + "<td id='uno' name='cod'>" + (i + 1) + "</td>"
                                    + "<td name='nombres'>" + datos.getString("nombres") + "</td>"
                                    + "<td name='apellidos'>" + datos.getString("apellidos") + "</td>"
                                    //+"<input type='hidden' name='ids' id='ids' value='" + datos.getString("idusuario") + "'/>"
                                    + "<td name='eliminar' id='" + i + "'><a id='" + datos.getString("idusuario") + "' class='deletes10'><img id='act' src='../recursos/Imagenes/Coordinador/eliminar.png' alt='' /></a></td>");
                            i++;
                        }
                    %>
                <div id="result_id2"></div>
                </tbody>
            </table>
        </div>
            
        <h1>Vinculacion de Nuevo Integrantes al Grupo Investigación</h1>
        <fieldset id="fieladvinculacionactores">
                <form id="demoForm" method="post" action="json.html" class="bbq">                                  
                        <span id="finland1" class="step">
                            <span style="margin-left: 30%; font-size: 20px; font: bold" class="font_normal_07em_black">Selección de Integrante</span><hr />
                            <br/><label for="surname">Digite Nombre</label><br />
                            <input type="hidden" id="idGru" name="idGru" value='<% out.print(idgrupoinv);%>'/><input type="text" id="integrante" name="integrante" class="input_field_12em"/> <input id="reset" value="Reset" type="button" onclick="clearIntegrante()"/>
                            <span ><input id="boton_estu" type="button" value="Vincular Integrante" name="enviar"/></span>
                            <div id="result_integrante"></div>
                            <div id="resultados_inte" ></div>
                            <div id="resultados_i" ></div>
                        </span>
                </form>
        </fieldset>
    </body>
</html>
