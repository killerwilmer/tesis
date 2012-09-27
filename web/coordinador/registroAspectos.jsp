<%-- 
    Document   : registroAspectos
    Created on : 19-feb-2012, 15:23:09
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConectaDb cont = new ConectaDb();
%>
<%
    HttpSession sesionOk = request.getSession();
    String idLlega = (String) sesionOk.getAttribute("coordinador");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        <script src="../recursos/Js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="funciones.js"></script>
        
        <script type="text/javascript">
            // Limpiar todos los campos
            function clearAll()
            {
                $("#comboetapas").val("*");
                $("#aspecto").val("");
                $("#indicador").val("");
            }
            // Limpiar esolo el campo indicador
            function clearIndicador()
            {
                $("#indicador").val("");
            }
        </script>
    </head>
    <body>
        <form id="formu">
            <h1>Registro Aspectos e Indicadores</h1>        
            <fieldset id="fielaspectos">
                
                <label for="surname">Nombre Etapa</label><br/>
                <select id="comboetapas" name="comboetapas">
                    <option selected="" value="*">Seleccione Etapa del Proyecto</option>
                    <%
                        out.print(cont.combofiltro("etapa", idLlega));
                    %>
                </select><br/>
                
                <label for="surname">Nombre Apecto</label><textarea name="aspecto" id="aspecto"></textarea><br/>
                <label for="surname">Nombre Indicador</label><textarea name="indicador" id="indicador"></textarea><br/>
                <input type="hidden" name="idPrograma" id="idPrograma" value="<%out.print(idLlega);%>">
                <br/>
                <span><input id="resetall" type="button" onclick="clearAll()" value="Reset All" name="resetall"/></span>
                <span><input id="reset" type="button" onclick="clearIndicador()" value="Reset Indicador" name="reset"/></span>
                <span><input id="enviar" type="button" value="Guardar" name="enviar"/></span>
                <br/>
                <div id="resultados" >
                </div>
            </fieldset>
        </form> 
    </body>
</html>
