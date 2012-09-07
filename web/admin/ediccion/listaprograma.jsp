<%-- 
    Document   : listaprograma
    Created on : 22-may-2012, 4:18:10
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
        <link rel="stylesheet" type="text/css" href="../../recursos/Css/admin/estiloFormularios.css" />
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="../admin/ediccion/funcionesModificar.js"></script>
        
    </head>
    <body>

        <fieldset id="fiel">               
            <%
                String idfacultad = request.getParameter("codigo");
                int numero = Integer.parseInt(idfacultad);
                String sqlString = "select *  from  programa where idprograma = '" + numero + "'";

                ResultSet resultado = control.consultas(sqlString);

                while (resultado.next()) {                         
                    out.print(" <input type='hidden' name='idp' id='idp' value='" + numero + "'/>");
                    out.print(" Codigio<input type='text' disabled='true' name='codigo' id='codigo' value='" + resultado.getString("codigoprograma") + "'/>");
                    out.print(" Nombre<input type='text' name='facultad1' id='facultad1' value='" + resultado.getString("nombreprograma") + "'/>");
                    out.print("<br/>");
                    out.print("<br/>");
                    out.print("<span><input id='enviarp' type='submit' value='Modificar' name='enviarp'/></span>");
                    out.print("<br/>");
                    out.println("<a href='#' id='eliminarp' name='eliminarp'>" + "<img id='imagen' alt='img' src='../recursos/Imagenes/admin/eliminarv.png'>" + "</a>");
                    out.print("<div id='resultados'></div>");
                }
            %>
        </fieldset>
    </body>
</html>
