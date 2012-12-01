<%@page import="org.w3c.dom.Document"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page import="java.util.StringTokenizer"%>
<%@page language="java" import="java.util.Enumeration" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<% ConectaDb control = new ConectaDb();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String miCodigo = request.getParameter("codigof");
            String miFacultad = request.getParameter("numero");
                
            if ((miCodigo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Codigo');</script>");
            } else if ((miFacultad.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre');</script>");
            } else {
                String SqlIdenumero = "Select * from facultad where codigofacultad = '" + miCodigo + "'";
                String SqlIden = "Select * from facultad where nombrefacultad = '" + miFacultad + "'";
                if (control.iden(SqlIdenumero) || control.iden(SqlIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Facultad Ya Existe');</script>");
                } else {
                    String SqlInsert = "insert into facultad (codigofacultad,nombrefacultad) values('" + miCodigo + "','" + miFacultad + "');";
                        
                    if (control.ejecutarOperacion(SqlInsert)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }
                }
            }
        %>
    </body>
</html>

