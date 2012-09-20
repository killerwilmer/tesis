<%-- 
    Document   : registroSublineaInvestigacion
    Created on : 19-sep-2012
    Author     : usuarui
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String comboLinea = request.getParameter("idLineaInvestigacion");
            String nomSubLinea = request.getParameter("nombreSublinea");
                
            if(comboLinea.equals("*")){
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Linea de Investigación');</script>");
            }
            else if ((nomSubLinea.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre de la Sublinea de Investigación');</script>");
            }                 
            else {
                int idLinea = Integer.parseInt(comboLinea);
                
                String SQLIden = "Select nombresublinea from sublinea where nombresublinea ='" + nomSubLinea.toUpperCase() + "'";
                
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Sublinea de Investigación ya Esta Registrada');</script>");              
                }
                else {
                    String SqlInsert = "insert into sublinea  (idlinea,nombresublinea)  values('" + idLinea + "','" + nomSubLinea.toUpperCase() + "');";
                        
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
