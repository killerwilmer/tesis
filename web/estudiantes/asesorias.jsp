<%-- 
    Document   : insert1
    Created on : 02-may-2012, 8:39:32
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="com.umariana.control.ConectaDb" %>
<% ConectaDb control = new ConectaDb();%>

<%
    HttpSession sesionOk = request.getSession();
    String codigoEst = (String) sesionOk.getAttribute("estudiante");
    int idEstudiante = (Integer) sesionOk.getAttribute("idEstudiante");
    String idPro = (String) sesionOk.getAttribute("idProyecto");

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
        <title>Asesorias</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Estudiantes/estiloFormularios.css" />
        <script type="text/javascript" src="ckeditor.js"></script>

    </head>
    <body>
        <h1>Asesorias</h1>
        <!-- This div will hold the editor. -->
        <form action="guardarProyecto.jsp" method="post">
            <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10">Asesorias</textarea>
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
    CKEDITOR.replace( 'editor1', {toolbar : [['Maximize'],['FontSize']]});
    
    inst = CKEDITOR.instances['editor2'];
    if(inst)
    {
        CKEDITOR.remove(inst);      
    }
    CKEDITOR.replace( 'editor2', {toolbar : [['Maximize'],['FontSize']]});
</script>