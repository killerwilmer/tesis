<%-- 
    Document   : formEtapa
    Created on : 29/10/2011, 12:27:31 AM
    Author     : Alex
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
      ConectaDb cont = new ConectaDb();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        <link rel="stylesheet" href="../recursos/Css/Coordinador/formLight.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/mootools/1.2.3/mootools-yui-compressed.js"></script>
        <script type="text/javascript" src="../recursos/Js/Coordinador/win7.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>

        
        <script type="text/javascript">
             campoNuevo = 3;
             //Funcion de agregar campos
             function AgregarCampos() {
                 campoNuevo = campoNuevo + 1;
                 campo = '<br/><div><label>Etapa ' + campoNuevo + ' </label><input type="text" size="25" name="etapa' + campoNuevo + '"  /></div>';
                 $("#cont").append(campo);
             }
             //
        </script>
    </head>
    <body onload="formu.etapa1.focus()">
        <form method="post" id="formu">
            <h1>Etapas del Proceso de Investigación</h1>
            
            <fieldset id="fiel">
                Etapa 1 <input type="text" name="etapa1" maxlength="100"/><br/><br/>
                Etapa 2 <input type="text" name="etapa2" maxlength="100"/><br/><br/>
                Etapa 3 <input type="text" name="etapa3" maxlength="100"/>
                <div id="cont"></div><br/><br/>
            
                <span class="win7 win7blue" name="enviar"><a href="#" >Guardar</a></span>
                <span class="win7 win7yellow" onclick="AgregarCampos(this);"><a href="#">Agregar Campo</a></span>
      
            </fieldset>
        </form> 
    </body>
</html>


<%
            if (request.getParameter("enviar") != null)
            {
                String etapa1 = request.getParameter("etapa1");
                String etapa2 = request.getParameter("etapa2");
                String etapa3 = request.getParameter("etapa3");
                
                String SqlInsert = "insert into personas values('" + etapa1 + "','" + etapa2 + "','" + etapa3 + "');";
                    
                    if (cont.ejecutarOperacion(SqlInsert)) {
                        out.print("<script lenguage=>'Javascript'> alert('Datos Insertados Correctamente')</script>");
                    } else {
                        out.print("<script lenguage=>'Javascript'> alert('Error al insertar los datos')</script>");
                    }
            }
                
%>