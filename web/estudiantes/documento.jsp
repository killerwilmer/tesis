<%-- 
    Document   : insert1
    Created on : 02-may-2012, 8:39:32
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    HttpSession sesionOk = request.getSession();
    String codigoEst = (String) sesionOk.getAttribute("estudiante");

    String inicio = "select ";
    String campo = "idusuario";
    String fin = " from usuario where codigousuario='" + codigoEst + "';";
    String idEstu = control.retornoCodigo(inicio, campo, fin);

    int idEstudiante = Integer.parseInt(idEstu.trim());


    String inicio1 = "select ";
    String campo1 = "idproyecto";
    String fin1 = " from usuarioproyecto where idusuario=" + idEstudiante + ";";
    String idPro = control.retornoCodigo(inicio1, campo1, fin1);

    String desProyecto = "Aun no le han asignado un proyecto";

    if (!idPro.equals("")) {
        int idProyecto = Integer.parseInt(idPro.trim());


        String inicio2 = "select ";
        String campo2 = "descripcionproyecto";
        String fin2 = " from proyecto where idproyecto=" + idProyecto + ";";
        desProyecto = control.retornoCodigo(inicio2, campo2, fin2);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Estudiantes/estiloFormularios.css" />
        <script type="text/javascript" src="ckeditor.js"></script>
        <script type="text/javascript" src="sample.js"></script>
        <link href="sample.css" rel="stylesheet" type="text/css" />    

        <script type="text/javascript">
            CKEDITOR.config.height = 330
        </script>
    </head>
    <body>
        <!-- This div will hold the editor. -->
        <form action="guardarProyecto.jsp" method="post">
            <p>
                <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10"><%=desProyecto%></textarea>
            </p>
        </form>         
    </body>
</html>

<%
    }
       else{
            out.print("<h1>" + desProyecto + "</h1>");
       }
%>

<script>
    instance = CKEDITOR.instances['editor1'];
    if(instance)
    {
        CKEDITOR.remove(instance);
    }
    CKEDITOR.replace( 'editor1');
</script>