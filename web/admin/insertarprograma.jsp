<%-- 
    Document   : insertarprograma
    Created on : 26-mar-2012, 1:12:42
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

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
            String idfacultad = request.getParameter("combo");
            String codigoPrograma = request.getParameter("codigop");
            String nombrePrograma = request.getParameter("nomp");
                
            if ((codigoPrograma.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Codigo');</script>");
            } 
            else if((nombrePrograma.length() == 0)){
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre');</script>");     
            }else if ((idfacultad.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione una Facultad');</script>");
            }
            else {
                String SqlIdenumero = "Select * from programa where codigoprograma = '" + codigoPrograma + "'";
                String SqlIden = "Select * from programa where nombreprograma = '" + nombrePrograma + "'";
                if (control.iden(SqlIdenumero) || control.iden(SqlIden)) {
                    out.print("<script languaje = javascript>showNoticeToast('Programa ya existe');</script>");
                } else {
                    int numero = Integer.parseInt(idfacultad);
                    String SqlInsert = "insert into programa (idfacultad,codigoprograma,nombreprograma) values('" + numero + "','" + codigoPrograma + "','" + nombrePrograma + "');";
                        
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


