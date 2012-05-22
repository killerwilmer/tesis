<%-- 
    Document   : actualizarfacultad
    Created on : 22-may-2012, 1:02:40
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
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
    </head>
    <body>
        <%
                String miCodigo = request.getParameter("codigof");
                String miFacultad = request.getParameter("numero");                 
                int numero = Integer.parseInt(request.getParameter("idf"));
                if ( (miCodigo.length()==0 ))
                {                    
                    out.print("<script languaje = javascript>showWarningToast('Digite un Codigo');</script>");
                } 
                else if((miFacultad.length() == 0)){
                    out.print("<script languaje = javascript>showWarningToast('Digite un Nombre');</script>");              
                }     
               else{
                   String SQL = "Update facultad SET codigofacultad='"+miCodigo+"', nombrefacultad='"+miFacultad+"' where idfacultad='"+numero+"'";
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
