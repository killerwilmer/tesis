<%-- 
    Document   : listafacultad
    Created on : 14-abr-2012, 3:48:52
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../recursos/Css/admin/estiloFormularios.css" />
        <link rel="stylesheet" type="text/css" href="../recursos/Css/admin/estiloFormularios.css" />
    </head>
    <body>
        
            <fieldset id="fiel">
                
                <%
                        String idfacultad = request.getParameter("codigo");
                        int numero =Integer.parseInt(idfacultad);
                        String sqlString = "select *  from  facultad where idfacultad = '"+numero+"'";

                        ResultSet resultado = control.consultas(sqlString);

                        while (resultado.next()) {
                            out.print(" Codigio<input type='text' name='codigo' maxlength='100' id='codigo' value='"+ resultado.getString("codigofacultad") +"'/>");
                            out.print(" Nombre<input type='text' name='facultad1' maxlength='100' id='facultad1' value='"+ resultado.getString("nombrefacultad") +"'/>");
                            out.print("<br/>");out.print("<br/>");
                            out.print("<span><input id='enviar' type='submit' value='Modificar' name='enviar'/></span>");
                            out.print("<br/>");
                            out.println("<a href=eliminarfacultad.jsp?cod=" + resultado.getString("codigofacultad") + ">" +"<img id='imagen' alt='img' src='../recursos/Imagenes/admin/eliminarv.png'>"+ "</a>");
            
                        }
                %>

            </fieldset>
    </body>
</html>
