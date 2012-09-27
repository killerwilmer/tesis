<%-- 
    Document   : index
    Created on : 18/09/2012, 02:52:59 PM
    Author     : skynet
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes</title>

        <script type="text/javascript" src="js/jquery-ui-1.8.23.custom.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>

        <link type="text/css" href="css/trontastic/jquery-ui-1.8.23.custom.css" rel="stylesheet"/>
        <link type="text/css" href="css/trontastic/jquery.ui.base.css" rel="stylesheet"/>
        <link type="text/css" href="css/trontastic/jquery.ui.all.css" rel="stylesheet"/>
        <link type="text/css" href="css/demo_page.css" rel="stylesheet"/>
        <link type="text/css" href="css/jquery.dataTables_themeroller.css" rel="stylesheet"/>

        <script>
            $(document).ready(function() {
                $('#example').dataTable({
                    "bJQueryUI" : "true",
                    "sPaginationType": "full_numbers"
                });
            })
        </script>

    </head>
    <body id="dt_example">
        <div id="container">
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
                    <thead>
                        <tr><td>columna 1</td><td>columna 2</td><td>columna 3</td><td>columna 4</td></tr>
                    </thead>
                    <tbody>
                        <tr><td>uno</td><td>dos</td><td>tres</td><td>cuatro</td></tr>
                        <tr><td>cinco</td><td>seis</td><td>siete</td><td>ocho</td></tr>
                        <tr><td>nueve</td><td>diez</td><td>once</td><td>doce</td></tr>
                        <tr><td>trece</td><td>catorce</td><td>quince</td><td>dieciseis</td></tr>
                        <tr><td>uno</td><td>dos</td><td>tres</td><td>cuatro</td></tr>
                        <tr><td>cinco</td><td>seis</td><td>siete</td><td>ocho</td></tr>
                        <tr><td>nueve</td><td>diez</td><td>once</td><td>doce</td></tr>
                        <tr><td>trece</td><td>catorce</td><td>quince</td><td>dieciseis</td></tr>
                        <tr><td>uno</td><td>dos</td><td>tres</td><td>cuatro</td></tr>
                        <tr><td>cinco</td><td>seis</td><td>siete</td><td>ocho</td></tr>
                        <tr><td>nueve</td><td>diez</td><td>once</td><td>doce</td></tr>
                        <tr><td>trece</td><td>catorce</td><td>quince</td><td>dieciseis</td></tr>
                        <tr><td>uno</td><td>dos</td><td>tres</td><td>cuatro</td></tr>
                        <tr><td>cinco</td><td>seis</td><td>siete</td><td>ocho</td></tr>
                        <tr><td>nueve</td><td>diez</td><td>once</td><td>doce</td></tr>
                        <tr><td>trece</td><td>catorce</td><td>quince</td><td>dieciseis</td></tr>
                        <tr><td>uno</td><td>dos</td><td>tres</td><td>cuatro</td></tr>
                        <tr><td>cinco</td><td>seis</td><td>siete</td><td>ocho</td></tr>
                        <tr><td>nueve</td><td>diez</td><td>once</td><td>doce</td></tr>
                        <tr><td>trece</td><td>catorce</td><td>quince</td><td>dieciseis</td></tr>
                        <tr><td>uno</td><td>dos</td><td>tres</td><td>cuatro</td></tr>
                        <tr><td>cinco</td><td>seis</td><td>siete</td><td>ocho</td></tr>
                        <tr><td>nueve</td><td>diez</td><td>once</td><td>doce</td></tr>
                        <tr><td>trece</td><td>catorce</td><td>quince</td><td>dieciseis</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
