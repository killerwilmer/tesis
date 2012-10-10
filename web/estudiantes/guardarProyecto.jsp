<%-- 
    Document   : recive
    Created on : 24-abr-2012, 10:14:20
    Author     : Admin
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ConectaDb control = new ConectaDb(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%
String editor = request.getParameter("editor1");
out.println(editor); 
String titulo = "hola";
String peque = "h";

try {

    String SqlInsert = "insert into proyecto (tituloproyecto,titulopequeproyecto,descripcionproyecto) values('"+titulo+"','"+peque+"','"+editor+"');";
    if ( control.ejecutarOperacion(SqlInsert))
    {
        out.print("Exito");
    }
    else
    {
        out.print("Error");
    }
 
} 
catch (Exception e) 
{
out.println(e.toString()); 
}
%>