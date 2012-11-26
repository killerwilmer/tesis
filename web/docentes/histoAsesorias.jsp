<%-- 
    Document   : histoAsesorias
    Created on : 24-nov-2012, 9:04:28
    Author     : wilmerarteaga
--%>

<%@page import="java.sql.ResultSet"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    HttpSession sesionOk = request.getSession();
    int idProyecto = (Integer) sesionOk.getAttribute("idProyecto");
    int idDocente = (Integer) sesionOk.getAttribute("idDocente");
    int i = 0;

    //out.print(idProyecto + " " + idDocente);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de asesorias</title>
    </head>
    <body>
    <center>
        <br>
        <br>
        <table cellpadding="1" cellspacing="1" border="1" class="display" id="example" width="90%" style="text-align: center">
            <thead >
                <tr><td class="columna1">No.</td><td class="columna2">Fecha</td><td class="columna3">Asesoria</td></tr>
            </thead>
            <tbody>
                <%
                    String sql = "select fechaasesoria, temaasesoria from asesoria where idproyecto=" + idProyecto + " and idusuario=" + idDocente + ";";
                    ResultSet datos = control.consultas(sql);

                    while (datos.next()) {

                        out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                + "<td name='idproyec'>" + datos.getString("fechaasesoria") + "</td>"
                                + "<td name='titulop'>" + datos.getString("temaasesoria") + "</td>");
                        i++;
                    }

                %>
            </tbody>
        </table>
    </center>
</body>
</html>