<%-- 
    Document   : registroGrupoInvestigacion
    Created on : 19-sep-2012, 14:17:22
    Author     : usuarui
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
            String nombreGrupo = request.getParameter("nombreGrupo");
            String nomLinea = request.getParameter("nombrelinea");
            String combonomLinea = request.getParameter("combolinea");
            String idprogram = request.getParameter("idprograma");
            int numero = Integer.parseInt(idprogram);
                
            if ((nombreGrupo.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre del Grupo');</script>");
            } else if ((nomLinea.length() == 0) && (combonomLinea.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione o Digite Linea de Investigación');</script>");
            } else if((!combonomLinea.equals("*")) && (nomLinea.length()!=0)){
                out.print("<script languaje = javascript>showNoticeToast('Solo Un campo de la linea debe estar lleno');</script>");
            }     
            else if (nomLinea.length() != 0) {
                String SQLIdenli = "Select nombrelinea from linea where nombrelinea ='" + nomLinea.toUpperCase() + "'";
                String SQLIden = "Select nombregrupoinvestigacion from grupoinvestigacion where nombregrupoinvestigacion ='" + nombreGrupo.toUpperCase() + "'";                  
                if (control.iden(SQLIdenli)) {
                    out.print("<script languaje = javascript>showNoticeToast('Linea de Investigación ya Esta Registrada');</script>");
                } else if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Grupo ya Esta Registrado');</script>");
                } else {
                    String SqlInsert = "insert into linea  (nombrelinea)  values('" + nomLinea.toUpperCase() + "');";
                    control.ejecutarOperacion(SqlInsert);         
                    int idl = control.darTipoUsuario("select ", "idlinea", " from linea where nombrelinea='" + nomLinea.toUpperCase() + "';");                       
                    //out.print("<script languaje = javascript>showNoticeToast('Grupo ya Esta Registrado');</script>");
                    String SqlInsertgrupo = "insert into grupoinvestigacion  (idprograma,nombregrupoinvestigacion,idlinea)  values('" + numero + "','" + nombreGrupo.toUpperCase() + "','" + idl + "');";                      
                    if (control.ejecutarOperacion(SqlInsertgrupo)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }                     
                }
            }else if((!combonomLinea.equals("*")) && (nomLinea.length()==0)) 
            {
                int idlinea = Integer.parseInt(combonomLinea);
                String SQLIden = "Select nombregrupoinvestigacion from grupoinvestigacion where nombregrupoinvestigacion ='" + nombreGrupo.toUpperCase() + "'";                  
                if(control.iden(SQLIden)){
                    out.print("<script languaje = javascript>showNoticeToast('Grupo ya Esta Registrado');</script>");
                }else{
                    String SqlInsertgrupo = "insert into grupoinvestigacion  (idprograma,nombregrupoinvestigacion,idlinea)  values('" + numero + "','" + nombreGrupo.toUpperCase() + "','" + idlinea + "');";                      
                    if (control.ejecutarOperacion(SqlInsertgrupo)) {
                        out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                    } else {
                        out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                    }    
                }
            }                 
        %>
    </body>
</html>
