<%-- 
    Document   : documento
    Created on : 5/11/2012, 11:35:11 AM
    Author     : Alex
--%>
<%@page session="true" %>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ConectaDb control = new ConectaDb();%>
<% String idProducto = request.getParameter("valor");
    HttpSession sesionOk = request.getSession();
//int idProyecto = (Integer) sesionOk.getAttribute("pro");
    int idProyecto = Integer.parseInt(request.getParameter("rowID"));
    int tipodoc = (Integer) sesionOk.getAttribute("tipodoc");
    sesionOk.setAttribute("idProyecto", idProyecto);

    String desProyecto = "";
    String titulo = "";

    String inicio2 = "select ";
    String campo2 = "descripcionproyecto";
    String fin2 = " from proyecto where idproyecto=" + idProyecto + ";";
    desProyecto = control.retornoCodigo(inicio2, campo2, fin2);

    String inicio3 = "select ";
    String campo3 = "tituloproyecto";
    String fin3 = " from proyecto where idproyecto=" + idProyecto + ";";
    titulo = control.retornoCodigo(inicio3, campo3, fin3);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volver1").click(function(event) {
                    $("#wraper").load('proyectosAsesor.jsp');
                });
            });
            
            $(document).ready(function() {
                $(".volver2").click(function(event) {
                    $("#wraper").load('proyectosJurado.jsp');
                });
            });
            
            $(document).ready(function() {
                $(".ver1").click(function(event) {
                    $("#wraper").load('histoAsesorias.jsp');
                });
            });
            
            $(document).ready(function() {
                $(".ver2").click(function(event) {
                    $("#wraper").load('histoCorrecciones.jsp');
                });
            });
        </script>
    </head>
    <body>
        <%
            if (tipodoc == 1) {%>
        <form name="form1" id="form1" action="guardarAsesoria.jsp" method="post">
            <p>
                <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10"><%=desProyecto%></textarea>

            <h3>Registrar asesorias para : <%=titulo%></h3>
            <a href="#" class="volver1">Volver</a>
            <a href="#" class="ver1">Ver historial Asesorias</a>
            <textarea class="ckeditor" id="editor2" name="editor2" cols="100" rows="10">Digite su asesoria.</textarea>
        </p>
    </form>
    <%} else {%>
    <form name="form2" id="form2" action="guardarCorrecion.jsp" method="post">
        <p>
            <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10"><%=desProyecto%></textarea>
        <h3>Registrar correciones para : <%=titulo%></h3>
        <a href="#" class="volver2">Volver</a>
        <a href="#" class="ver2">Ver historial Correcciones</a>
        <textarea class="ckeditor" id="editor2" name="editor2" cols="100" rows="10">Digite las correciones.</textarea>
    </p>
</form> 
<%
    }
%> 
</body>
</html>

<script>
    instance = CKEDITOR.instances['editor1'];
    if(instance)
    {
        CKEDITOR.remove(instance);
    }
    CKEDITOR.replace( 'editor1', {toolbar : [['Maximize'],['FontSize'],['TextColor'],['BGColor']]});
    
    inst = CKEDITOR.instances['editor2'];
    if(inst)
    {
        CKEDITOR.remove(inst);      
    }
    CKEDITOR.replace( 'editor2', {toolbar : [['Maximize'],['FontSize'],['Save'],['TextColor'],['BGColor']]});
</script>
