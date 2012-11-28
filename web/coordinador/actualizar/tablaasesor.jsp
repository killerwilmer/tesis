<%-- 
    Document   : tablaasesor
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
    int i =0;
    int idProyecto=0;
    String idSe = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
        idProyecto = (Integer) sesionOk.getAttribute("idProyecto");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../recursos/Js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="wizard/funciones.js"></script>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        
        <script type="text/javascript">
            // Limpiar el div de asesor
            function clearAsesor()
            {
                $("#asesor").val("");
                $("#result_asesor").empty();
            }
            
            //Para buscar el docente
            $(document).ready(function(){
                $("#asesor").autocomplete("wizard/docente_buscar.jsp");
                $('#asesor').result(function(event, data, formatted) {
                    if (data) {
                        // Extraemos los valores
                        var name = data[0];
                        var id = data[1];
                        // Mostramos los resultados
                        $("#result_asesor").html( "<p>Nombre<br/> <input disabled=\"true\" type=\"text\" value=\""+name+"\"/> <br/>" + "</p>Id<br/><input disabled=\"true\" type=\"text\" name=\"idAse\" id=\"idAse\" readonly=\"true\" value=\""+id+"\"/>");
                    }
                });
            });
        </script>
    </head>
    <body>
        <h1 id="titulolistaintegrantes" style="text-align: center">LISTA DE ASESOR(S)</h1>
        <div id="demo1">
            <table cellpadding="1" cellspacing="1" border="0" class="display1" id="example3" width="100%">
                <thead id="inte">
                    <tr><td>#</td><td>Nombres</td><td>Apellidos</td><td class="eliminarintegrante">Eliminar</td></tr>
                </thead>
                <tbody>
                    <%
                        String sql = "select usuarioasesor.idusuario, nombres, apellidos from usuario, usuarioasesor, proyecto where usuario.idusuario=usuarioasesor.idusuario and proyecto.idproyecto=usuarioasesor.idproyecto and proyecto.idproyecto='" + idProyecto + "';";
                        //out.print(sql);
                        ResultSet datos = control.consultas(sql);
                        while (datos.next()) {
                            out.print(control.linea(i) + "<td id='uno' name='cod'>" + (i + 1) + "</td>"
                                    + "<td name='nombres'>" + datos.getString("nombres") + "</td>"
                                    + "<td name='apellidos'>" + datos.getString("apellidos") + "</td>"
                                    //+"<input type='hidden' name='ids' id='ids' value='" + datos.getString("idusuario") + "'/>"
                                    + "<td name='eliminar' id='" + i + "'><a id='" + datos.getString("idusuario") + "' class='deletes4'><img id='act' src='../recursos/Imagenes/Coordinador/eliminar.png' alt='' /></a></td>");
                            i++;
                        }
                    %>
                <div id="result_id"></div>
                </tbody>
            </table>
        </div>
        <h1 id="titulonuevointegrante">Vinculación de Nuevo(s) Asesor al Proyecto</h1>
        <fieldset id="fieladvinculacionactores">
            <form id="demoForm" method="post" action="json.html" class="bbq">                                                        
                <span id="finland2" class="step">
                    <span style="margin-left: 25%; font-size: 20px; font: bold" class="font_normal_07em_black">Selección Asesor(@s)</span><hr />
                    <br/><label for="surname">Digite Nombre Asesor(@)</label><br />
                    <input type="hidden" id="idPro" name="idPro" value='<% out.print(idProyecto);%>'/><input type="text" id="asesor" name="asesor" class="input_field_12em"/><input id="reset" value="Reset" type="button" onclick="clearAsesor()"/>
                    <span ><input id="boton_ases" type="button" value="Vincular Asesor" name="enviar"/></span>
                    <div id="result_asesor"></div>
                    <div id="resultados_ases" ></div>
                </span>
            </form>   
        </fieldset>
    </body>
</html>
