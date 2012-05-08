<%-- 
    Document   : mensaje
    Created on : 04-may-2012, 11:23:50
    Author     : zzz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="jquerymin.js"></script>
        <script type="text/javascript" src="javascript/jquery.toastmessage.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <script type="text/javascript">

            function showSuccessToast(mensaje) {
                $().toastmessage('showSuccessToast', mensaje);
            }
            function showStickySuccessToast() {
                $().toastmessage('showToast', {
                    text     : 'Success Dialog which is sticky',
                    sticky   : true,
                    position : 'top-right',
                    type     : 'success',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });

            }
            function showNoticeToast() {
                $().toastmessage('showNoticeToast', "Notice  Dialog which is fading away ...");
            }
            function showStickyNoticeToast() {
                $().toastmessage('showToast', {
                    text     : 'Notice Dialog which is sticky',
                    sticky   : true,
                    position : 'top-right',
                    type     : 'notice',
                    closeText: '',
                    close    : function () {console.log("toast is closed ...");}
                });
            }
            function showWarningToast() {
                $().toastmessage('showWarningToast', "Warning Dialog which is fading away ...");
            }
            function showStickyWarningToast() {
                $().toastmessage('showToast', {
                    text     : 'Warning Dialog which is sticky',
                    sticky   : true,
                    position : 'top-right',
                    type     : 'warning',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });
            }
            function showErrorToast() {
                $().toastmessage('showErrorToast', "Error Dialog which is fading away ...");
            }
            function showStickyErrorToast() {
                $().toastmessage('showToast', {
                    text     : 'Error Dialog which is sticky',
                    sticky   : true,
                    position : 'top-right',
                    type     : 'error',
                    closeText: '',
                    close    : function () {
                        console.log("toast is closed ...");
                    }
                });
            }

        </script>
        <% String hola = "ola";%>
        <span class="description">Show a success toast</span> <a href="javascript:showSuccessToast('<%=hola%>');">Automatico</a>
    </body>
</html>
