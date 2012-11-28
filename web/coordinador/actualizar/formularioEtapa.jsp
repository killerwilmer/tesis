<%-- 
    Document   : actualizarEtapa
    Created on : 16/11/2012, 04:32:26 AM
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
    String nombreEtapa="";
    int idetapa=0;
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
        idetapa = Integer.parseInt(request.getParameter("rowID"));
        String inicio = "select ";
        String campo = "nombreetapa";
        String fin = " from etapa where idetapa='" + idetapa + "';";
        nombreEtapa = cont.retornoCodigo(inicio, campo, fin);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>      
        <script type="text/javascript">
            $(document).ready(function() {
                $(".volveretapa").click(function(event) {
                    $("#wraper").load('actualizar/listarEtapas.jsp');
                    $.getScript('js/b.js');
                });
            });
        </script>
    </head>
    <body>
        <img class="volveretapa" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <form id="formu">
            <h1 id="ticactualizar">ACTUALIZAR ETAPA</h1>        
            <fieldset id="fiel">
                <span>
                    <input type="hidden" name="idetapa" id="idetapa" value="<%out.print(idetapa);%>"/>
                    Nombre <input type="text" name="programa" id="nometapa" value="<%out.print(nombreEtapa);%>"/><br/>
                </span><br/>
                <span><input id="enviar" type="submit" value="Actualizar" name="enviar"/></span>
                <br/>
                <div id="resultados" >
                </div>
            </fieldset>
        </form> 
    </body>
</html>
