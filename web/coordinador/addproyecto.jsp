<%-- 
    Document   : addproyecto
    Created on : 30-abr-2012, 8:50:57
    Author     : usuarui
--%>

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
            String titulo = request.getParameter("titulo");
            String tituloabreviado = request.getParameter("titucorto");
            String descripcion = request.getParameter("descripcion");
            String institucion = request.getParameter("institu");
            String estado = request.getParameter("estado");
            String fecha = request.getParameter("fecha");
            String tipo = request.getParameter("tipo");
            String activo = request.getParameter("activo");


            if ((titulo.length() == 0) || (tituloabreviado.length() == 0) || (descripcion.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Faltan datos');</script>");
            } else if (fecha.length() == 0) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Fecha');</script>");
            } else if (estado.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Estado');</script>");
            } else if (tipo.equals("*")) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Tipo');</script>");
            } else {
                if (institucion.equals("")) {
                    institucion = "NO TIENE";
                }
                String CosultaTitulo = "Select * from proyecto where tituloproyecto = '" + titulo.toUpperCase() + "'";
                String ConsultaInstitucion = "Select * from institucion where nombreinstitucion = '" + institucion.toUpperCase() + "'";
                if (control.iden(CosultaTitulo)) {
                    out.print("<script languaje = javascript>showNoticeToast('Proyecto Ya Existe');</script>");
                } else {
                    if (!control.iden(ConsultaInstitucion)) {
                        String SqlInsertusu = "insert into institucion (nombreinstitucion) values('" + institucion.toUpperCase() + "');";
                        control.ejecutarOperacion(SqlInsertusu);

                        int idInstitucion = control.darTipoUsuario("select ", "idinstitucion", " from institucion where nombreinstitucion='" + institucion.toUpperCase() + "';");
                        int etapaproyecto = Integer.parseInt(estado);
                        int estadoproyecto = Integer.parseInt(activo);
                        String SqlInsert = "insert into proyecto (idinstitucion, tituloproyecto,titulopequeproyecto, descripcionproyecto, etapaproyecto,fechainicioproyecto, tipoproyecto, esstadoproyecto) values('" + idInstitucion + "','" + titulo.toUpperCase() + "','" + tituloabreviado + "','" + descripcion + "','" + etapaproyecto + "','" + fecha + "','" + estadoproyecto + "','" + activo + "');";

                        if (control.ejecutarOperacion(SqlInsert)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                        }

                    } else {
                        int idInstitucion = control.darTipoUsuario("select ", "idinstitucion", " from institucion where nombreinstitucion='" + institucion.toUpperCase() + "';");
                        int etapaproyecto = Integer.parseInt(estado);
                        int estadoproyecto = Integer.parseInt(activo);
                        String SqlInsert = "insert into proyecto (idinstitucion, tituloproyecto,titulopequeproyecto, descripcionproyecto, etapaproyecto,fechainicioproyecto, tipoproyecto, esstadoproyecto) values('" + idInstitucion + "','" + titulo.toUpperCase() + "','" + tituloabreviado + "','" + descripcion + "','" + etapaproyecto + "','" + fecha + "','" + estadoproyecto + "','" + activo + "');";

                        if (control.ejecutarOperacion(SqlInsert)) {
                            out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                        } else {
                            out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                        }
                    }
                }

            }
        %>     
    </body>
</html>

