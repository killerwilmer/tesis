<%-- 
    Document   : formgrupoinv
    Created on : 19/11/2012, 07:17:48 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    ConectaDb cont = new ConectaDb();
    String idSe = "";
    String nombreGrupo="";
    int idgrupo =0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
        idgrupo = Integer.parseInt(request.getParameter("rowIDS"));
        String inicio = "select ";
        String campo = "nombregrupoinvestigacion";
        String fin = " from grupoinvestigacion where idgrupoinvestigacion='" + idgrupo + "';";
        nombreGrupo = cont.retornoCodigo(inicio, campo, fin);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volvergp").click(function(event) {
                    $("#cont1").load('actualizar/tablagrupoinv.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volvergp" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <form id="formutitulogrupinv">
            <h1>Grupo Investigación</h1>        
            <fieldset id="fiel">
                <input type="hidden" name="idgrupo" id="idgrupo" value="<%out.print(idgrupo);%>"/>
                Nombre<input type="text" name="grup" id="grup" value="<%out.print(nombreGrupo);%>"/><br/><br/>
                <span><input id="enviar1" type="submit" value="Actualizar" name="enviar"/></span>
                <br/>
                <div id="resultados" >
                </div>
            </fieldset>
        </form> 
    </body>
</html>
