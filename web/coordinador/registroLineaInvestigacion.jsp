<%-- 
    Document   : registroLineaInvestigacion
    Created on : 19-sep-2012, 
    Author     : usuarui
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idSe = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es Obligación Identificarse"/>
</jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
    }
%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/mensajespoput.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String comboGrupo = request.getParameter("coboggrupoi");
            String comboCampo = request.getParameter("combocampoi");
            String nomLinea = request.getParameter("nombrelinea");
            String nomLineaCombo = request.getParameter("nombrelineacombo");
                
            //out.print("<script languaje = javascript>alert('"+nomLinea+"');</script>");  
            if (comboGrupo.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Grupo de Investigación');</script>");
            } else if ((nomLinea.length() == 0) && (nomLineaCombo.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Digite ó Seleccione un Nombre de la Linea de Investigación');</script>");
            } else if (comboCampo.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Campo de Investigación');</script>");
            } else if (nomLinea.length() != 0 && nomLineaCombo.equals("*")) {
                
                int idgrupo = Integer.parseInt(comboGrupo);
                int idcampo = Integer.parseInt(comboCampo);
                    
                String SQLIden = "Select nombrelinea from linea where nombrelinea ='" + nomLinea.toUpperCase() + "'";
                    
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Linea de Investigación ya Esta Registrada');</script>");
                } else {
                    String SqlInsert = "insert into linea  (idgrupoinvestigacion,idcampo,nombrelinea)  values('" + idgrupo + "','" + idcampo + "','" + nomLinea.toUpperCase() + "');";
                        
                    if (control.ejecutarOperacion(SqlInsert)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }
                        
                }
            } else if (nomLinea.length() == 0 && !nomLineaCombo.equals("*")) {
                
                int idgrupo = Integer.parseInt(comboGrupo);
                int idcampo = Integer.parseInt(comboCampo);
                String nomlin = control.retornaInt("select ", "nombrelinea", " from linea where idlinea ='" + nomLineaCombo + "';");
                    
                //String SQLIden = "Select nombrelinea from linea where idlinea ='" + nomLineaCombo + "'";
                    
                    
                String SqlInsert = "insert into linea  (idgrupoinvestigacion,idcampo,nombrelinea)  values('" + idgrupo + "','" + idcampo + "','" + nomlin.toUpperCase() + "');";
                    
                if (control.ejecutarOperacion(SqlInsert)) {
                    out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                } else {
                    out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                }
                    
            } else {
                if (nomLinea.length() != 0 && !nomLineaCombo.equals("*")) {
                    out.print("<script languaje = javascript>showWarningToast('Solo un campo de la linea debe estar maracado');</script>");
                }
            }
                
        %>
    </body>
</html>