<%-- 
    Document   : actualizarprograma
    Created on : 04-sep-2012, 14:23:45
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="../recursos/Mensajes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../recursos/Mensajes/jquerymin.js"></script>
        <script type="text/javascript" src="../recursos/Mensajes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
    </head>
    <body>
        <%
                String miCodigo = request.getParameter("codigop");
                String miPrograma = request.getParameter("nombre");                 
                int numero = Integer.parseInt(request.getParameter("idpro"));

                if ( (miCodigo.length()==0 ))
                {                    
                    out.print("<script languaje = javascript>showWarningToast('Digite un Codigo');</script>");
                } 
                else if((miPrograma.length() == 0)){
                    out.print("<script languaje = javascript>showWarningToast('Digite un Nombre');</script>");              
                }     
               else{
                   String SQL = "Update programa SET codigoprograma='"+miCodigo+"', nombreprograma='"+miPrograma+"' where idprograma='"+numero+"'";
                   if (control.ejecutarOperacion(SQL))
                        {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Actualizados Correctamente');</script>");
                        }
                        else
                        {
                            out.print("<script languaje = javascript>showErrorToast('Error al Actualizar los Datos');</script>");
                        }
               }
                
        %>
        
    </body>
</html>
