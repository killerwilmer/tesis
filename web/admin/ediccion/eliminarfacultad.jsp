<%-- 
    Document   : eliminarfacultad
    Created on : 14-abr-2012, 6:11:21
    Author     : usuarui
--%>

<%@page import="java.beans.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    
            String codigo = request.getParameter("cod");
            String consultas = "delete from facultad where codigofacultad = '"+codigo+"'";
 
            if (control.ejecutarOperacion(consultas)) {          
                        out.print("<script lenguage='Javascript'> alert('Datos Insertados Correctamente')</script>");
                    } else {
                      out.print("<script lenguage='Javascript'> alert('Error al insertar los datos')+codigo</script>");
                      
                    }
       
        %>
    </body>
</html>
