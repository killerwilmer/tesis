<%-- 
    Document   : tablagrupoinv
    Created on : 19/11/2012, 06:33:18 AM
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
    String idProgram = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idProgram = (String) sesionOk.getAttribute("coordinador");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>           
           $(document).ready(function() {
                $('#examplegrupo tbody tr a.deletes5 img').live( 'click', function (e) {
                    var rowIDS = $(this).parent().attr('id');                 
                    //sesionOk.setAttribute("pro", rowID);
                    $("#cont1").load('actualizar/formgrupoinv.jsp?rowIDS=' + rowIDS);
                    //alert(rowID);
                });
                
                $('#examplegrupo tbody tr a.deletes55 img').live( 'click', function (e) {
                    var rowID2 = $(this).parent().attr('id');
                    $("#cont1").load('actualizar/formularioIntegrantes.jsp?rowID2=' + rowID2);
                });
                
            } );
        </script>
    </head>
    <body>
        <h1 id="titulolistaintegrantes" style="text-align: center">LISTA GRUPOS DE INVESTIGACÓN</h1>
        <div id="demo1" style="margin-left: 25px; margin-right: 25px">
            <table cellpadding="1" cellspacing="1" border="0" class="display1" id="examplegrupo" width="100%">
                <thead id="inte">
                    <tr><td>#</td><td>Nombre Linea</td><td>Nombres</td><td class="eliminarintegrante">Actualizar</td><td class="eliminarintegrante">Integrantes</td></tr>
                </thead>
                <tbody>
                    <%
                        String sql = "select idgrupoinvestigacion, nombregrupoinvestigacion, linea.nombrelinea from linea, grupoinvestigacion where linea.idlinea=grupoinvestigacion.idlinea and idprograma='" + idProgram + "';";
                        ResultSet datos = control.consultas(sql);
                        while (datos.next()) {
                            out.print(control.linea(i) + "<td id='uno' name='cod'>" + (i + 1) + "</td>"
                                    + "<td name='nombrel'>" + datos.getString("nombrelinea") + "</td>"
                                    + "<td name='nombregrup'>" + datos.getString("nombregrupoinvestigacion") + "</td>"
                                    //+"<input type='hidden' name='ids' id='ids' value='" + datos.getString("idusuario") + "'/>"
                                    + "<td name='actualizar' id='" + i + "'><a id='" + datos.getString("idgrupoinvestigacion") + "' class='deletes5'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>"
                                    + "<td name='actualizarintegrantes' id='" + i + "'><a id='"+datos.getString("idgrupoinvestigacion")+"' class='deletes55'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>");
                            i++;
                        }
                    %>
                <div id="result_id"></div>
                </tbody>
            </table>
        </div>
    </body>
</html>
