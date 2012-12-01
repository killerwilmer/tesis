<%-- 
    Document   : listafacultad
    Created on : 14-abr-2012, 3:48:52
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../admin/ediccion/funcionesModificar.js"></script>        
    </head>
    <body>

        <fieldset id="fiel">               
            <%
                String idfacultad = request.getParameter("codigo");
                int numero = Integer.parseInt(idfacultad);
                String sqlString = "select *  from  facultad where idfacultad = '" + numero + "'";

                ResultSet resultado = control.consultas(sqlString);

                while (resultado.next()) {
                    out.print(" <input type='hidden' name='idf' id='idf' value='" + numero + "'/>");
                    out.print(" Codigio<input type='text' disabled='true'  name='codigo' id='codigo' value='" + resultado.getString("codigofacultad") + "'/>");
                    out.print(" Nombre<input type='text' name='facultad1' id='facultad1' value='" + resultado.getString("nombrefacultad") + "'/>");
                    out.print("<br/>");
                    out.print("<br/>");
                    out.print("<span><input id='enviar' type='submit' value='Modificar' name='enviar'/></span>");
                    out.print("<br/>");
                    out.println("<a href='#' id='eliminar' name='eliminar'>" + "<img id='imagen' alt='img' src='../recursos/Imagenes/admin/eliminarv.png'>" + "</a>");
                    out.print("<div id='resultados'></div>");
                }
            %>
        </fieldset>
    </body>
</html>
