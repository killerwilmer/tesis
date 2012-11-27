<%-- 
    Document   : tablacampo
    Created on : 19/11/2012, 08:19:35 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%
    ConectaDb control = new ConectaDb();
    HttpSession sesionOk = request.getSession();
    String idProgram = (String) sesionOk.getAttribute("idp");
    int i =0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>       
        <script>           
           $(document).ready(function() {
                $('#examplegrupo tbody tr a.deletescampo img').live( 'click', function (e) {
                    var rowIDC = $(this).parent().attr('id');                 
                    //sesionOk.setAttribute("pro", rowID);
                    $("#cont1").load('actualizar/formulariocampo.jsp?rowIDC=' + rowIDC);
                    //alert(rowID);
                });
            } );
        </script>
    </head>
    <body>
        <h1 id="titulolistaintegrantes" style="text-align: center">LISTA CAMPOS DE INVESTIGACÓN</h1>
        <div id="demo1" style="margin-left: 25px; margin-right: 25px">
            <table cellpadding="1" cellspacing="1" border="0" class="display1" id="examplegrupo" width="100%">
                <thead id="inte">
                <tr><td>#</td><td>Nombre Linea</td><td>Nombre</td><td>Descripción</td><td class="eliminarintegrante">Actualizar</td></tr>
                </thead>
                <tbody>
                    <%
                        String sql = "select DISTINCT campo.idcampo, linea.nombrelinea, nombrecampo, descripcioncampo from campo, grupoinvestigacion, linea where campo.idlinea=linea.idlinea and linea.idlinea=grupoinvestigacion.idlinea and grupoinvestigacion.idprograma='" + idProgram + "';";
                        ResultSet datos = control.consultas(sql);
                        while (datos.next()) {
                            out.print(control.linea(i) + "<td id='uno' name='cod'>" + (i + 1) + "</td>"
                                    + "<td name='nombrelin'>" + datos.getString("nombrelinea") + "</td>"
                                    + "<td name='nombrecamp'>" + datos.getString("nombrecampo") + "</td>"
                                    + "<td name='descamp'>" + datos.getString("descripcioncampo") + "</td>"
                                    + "<td name='actualizarcampo' id='" + i + "'><a id='" + datos.getString("idcampo") + "' class='deletescampo'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>");
                            i++;
                        }
                    %>
                <div id="result_id"></div>
                </tbody>
            </table>
        </div>
    </body>
</html>
