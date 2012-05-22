<%-- 
    Document   : addetapa
    Created on : 03-may-2012, 11:45:55
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
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <title>JSP Page</title>
        
            <script type="text/javascript">

            function showSuccessToast(mensaje) {
                $().toastmessage('showSuccessToast', mensaje);
            }
            function showStickySuccessToast() {
                $().toastmessage('showToast', {
                    text     : 'Success Dialog which is sticky',
                    sticky   : true,
                    position : 'middle-center',
                    type     : 'success',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });

            }
            function showNoticeToast(mensaje) {
                $().toastmessage('showNoticeToast', mensaje);
            }
            function showStickyNoticeToast() {
                $().toastmessage('showToast', {
                    text     : 'Notice Dialog which is sticky',
                    sticky   : true,
                    position : 'middle-center',
                    type     : 'notice',
                    closeText: '',
                    close    : function () {console.log("toast is closed ...");}
                });
            }
            function showWarningToast(mensaje) {
                $().toastmessage('showWarningToast', mensaje);
            }
            function showStickyWarningToast() {
                $().toastmessage('showToast', {
                    text     : 'Warning Dialog which is sticky',
                    sticky   : true,
                    position : 'middle-center',
                    type     : 'warning',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });
            }
            function showErrorToast(mensaje) {
                $().toastmessage('showErrorToast', mensaje);
            }
            function showStickyErrorToast() {
                $().toastmessage('showToast', {
                    text     : 'Error Dialog which is sticky',
                    sticky   : true,
                    position : 'top-center',
                    type     : 'error',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });
            }

        </script>
        
    </head>
    <body>
        <%
            String nometapa = request.getParameter("nombre");
            String idprogram = request.getParameter("idprograma");
                
            if ((nometapa.length() == 0)) {
              
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre');</script>");
                
            } else if ((idprogram.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Programa');</script>");
            } else {
                int numero = Integer.parseInt(idprogram);
                String SQLIden = "Select nombreetapa from etapa where nombreetapa ='" + nometapa.toUpperCase() + "'";
                    
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Etapa ya existe');</script>");
                } else {
                    String SqlInsert = "insert into etapa  (idprograma,nombreetapa)  values('" + numero + "','" + nometapa.toUpperCase() + "');";
                        
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


