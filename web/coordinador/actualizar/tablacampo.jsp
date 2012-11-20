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
    </head>
    <body>
        <h1 id="titulolistaintegrantes" style="text-align: center">LISTA CAMPOS DE INVESTIGACÓN</h1>
        <div id="demo1">
            <table cellpadding="1" cellspacing="1" border="0" class="display1" id="examplegrupo" width="100%">
                <thead id="inte">
                    <tr><td>#</td><td>Nombres</td><td class="eliminarintegrante">Actualizar</td></tr>
                </thead>
                <tbody>
                    <%
                        String sql = "select idcampo, nombrecampo, descrpcioncampo from campo where idprograma='" + idProgram + "';";
                        ResultSet datos = control.consultas(sql);
                        while (datos.next()) {
                            out.print(control.linea(i) + "<td id='uno' name='cod'>" + (i + 1) + "</td>"
                                    + "<td name='nombregrup'>" + datos.getString("nombregrupoinvestigacion") + "</td>"
                                    //+"<input type='hidden' name='ids' id='ids' value='" + datos.getString("idusuario") + "'/>"
                                    + "<td name='actualizar' id='" + i + "'><a id='" + datos.getString("idgrupoinvestigacion") + "' class='deletes5'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>");
                            i++;
                        }
                    %>
                <div id="result_id"></div>
                </tbody>
            </table>
        </div>
    </body>
</html>
