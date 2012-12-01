<%-- 
    Document   : insertarusuario
    Created on : 06-abr-2012, 12:00:25
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
      
    String idtipousuario = request.getParameter("comtusu");
    String identificacion = request.getParameter("identificacion");
    String genero = request.getParameter("genero");
    String estadocivil = request.getParameter("estcivil");
    String codigociudad = request.getParameter("codciudad");
    String nombreciudad = request.getParameter("nomciudad");
    String fechanaciomiento = request.getParameter("fechanac");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String codigoprograma = request.getParameter("codprog");
    String nombrePrograma = request.getParameter("nomprog");
    String codigofaculta = request.getParameter("codfacu");
    String nombrefaculta = request.getParameter("nomfacu");
    String direccion = request.getParameter("dir");
    String email = request.getParameter("email");
    String numcelular = request.getParameter("celu");
    String numtelcasa = request.getParameter("numcasa");
    String eps = request.getParameter("ep");
    String rh = request.getParameter("trh");
    String contraseña = request.getParameter("clave");


    if ((nombres.length() == 0)) {
            out.print("<script languaje = javascript>showWarningToast('Digite Nombre');</script>");
        }else if ((apellidos.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Apellidos');</script>");
        }else if ((identificacion.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Identificación');</script>");
            }else if ((contraseña.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Contraseña');</script>");
            }else if ((idtipousuario.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Tipo Usuario');</script>");
            }else if ((genero.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un Genero');</script>");
            }else if ((codigofaculta.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Codigo Facultad');</script>");
            }else if ((nombrefaculta.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre Facultad');</script>");
            }else if ((codigoprograma.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Codigo Programa');</script>");
            }else if ((nombrePrograma.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Nombre Programa');</script>");
            }else if ((estadocivil.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione su Estado Civil');</script>");
            }else if ((email.length() == 0)) {
                out.print("<script languaje = javascript>showWarningToast('Digite Su E-Mail');</script>");
            }else if ((rh.equals("*"))) {
                out.print("<script languaje = javascript>showWarningToast('Seleccione un RH');</script>");
            }

            else {
            String SqlIdenumero = "Select * from usuario where codigousuario = '" + identificacion + "'";
            String SQLIdenfacultad = "Select codigofacultad from facultad where codigofacultad ='" + codigofaculta + "'";
            String SQLIdenprograma = "Select codigoprograma from programa where codigoprograma ='" + codigoprograma + "'";

            if (!control.iden(SQLIdenfacultad)) {
                String SqlInsertfacultad = "insert into facultad(codigofacultad, nombrefacultad) values('" + codigofaculta + "','" + nombrefaculta + "');";
                control.ejecutarOperacion(SqlInsertfacultad);
            }
            if (!control.iden(SQLIdenprograma)) {
                int idfacultad = control.darTipoUsuario("select ", "idfacultad", " from facultad where nombrefacultad='" + nombrefaculta + "';");
                String SqlInsertprograma = "insert into programa(idfacultad, codigoprograma, nombreprograma) values('" + idfacultad + "','" + codigoprograma + "','" + nombrePrograma + "');";
                control.ejecutarOperacion(SqlInsertprograma);
            }
            if (control.iden(SqlIdenumero)) {
               out.print("<script languaje = javascript>showNoticeToast('Usuario ya existe');</script>");
            } else {
                int numero = Integer.parseInt(idtipousuario);
                String SqlInsert = "insert into usuario (idtipousuario,codigousuario,genero,estadocivil,codigociudad,nombreciudad,fechanacimiento,nombres,apellidos,codigoprograma,nombreprograma,codigofacultad,nombrefacultad,direccioncasa,email,celular,telefono,eps,rh,contrasena)"
                        + " values('" + numero + "','" + identificacion + "','" + genero + "','" + estadocivil + "','" + codigociudad + "','" + nombreciudad + "','" + fechanaciomiento + "','" + nombres + "','" + apellidos + "','" + codigoprograma + "','" + nombrePrograma + "','" + codigofaculta + "','" + nombrefaculta + "','" + direccion + "','" + email + "','" + numcelular + "','" + numtelcasa + "','" + eps + "','" + rh + "','" + contraseña + "');";

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
