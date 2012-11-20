<%-- 
    Document   : formularioProyecto
    Created on : 16/11/2012, 01:37:34 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<%
    HttpSession sesionOk = request.getSession();
    String idLlega = (String) sesionOk.getAttribute("coordinador");
    int idproyecto = Integer.parseInt(request.getParameter("rowID"));
    
    int i = 0; 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../recursos/datepicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        
        <link rel="stylesheet" href="../recursos/datepicker/jquery.ui.all.css">
        <link rel="stylesheet" type="text/css" href="../recursos/datepicker/demos.css" />
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.core.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="../recursos/datepicker/jquery.ui.datepicker.js"></script>
        
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat:'yy-mm-dd'
                });
            }); 
            
            $(document).ready(function() {
                $(".volver").click(function(event) {
                    $("#wraper").load('actualizar/listarProyectos.jsp');
                    $.getScript('js/b.js');
                });
            });
            
            function radiomarcado(radios)
            {
                for(i=0; radio=radios[i]; i++)
                {
                    if(radio.checked)
                    {
                        return radio.value;
                    }
                }
            }
            var grupo = document.getElementById("formularioproy").estado;
        </script>
    </head>
    <body>
        <img class="volver" src='../recursos/Imagenes/Coordinador/volver.png' alt=''/>
        <h1 id="titulosactpro">Actualizar Proyecto</h1>
        <form id="formularioproy">
            <fieldset id="fieladdproyecto">
                <%
                    String sql = "select idproyecto, tituloproyecto, titulopequeproyecto, institucion.idinstitucion, institucion.nombreinstitucion, etapaproyecto, etapa.nombreetapa, descripcionproyecto, fechainicioproyecto, tipoproyecto, esstadoproyecto from proyecto, institucion, etapa where institucion.idinstitucion=proyecto.idinstitucion and etapa.idetapa=proyecto.etapaproyecto and idproyecto='" + idproyecto + "';";
                    ResultSet datos = control.consultas(sql);
                    int estado = 0;
                    while (datos.next()) {
                        out.print("<input type='hidden' name='idp' id='idp' value='" + datos.getString("idproyecto") + "'/>");       
                        out.print("<label for='surname'>Titulo</label><input type='text' name='titulop' id='titulop' value='" + datos.getString("tituloproyecto") + "'/><br/>");
                        out.print("<label for='surname'>Titulo Abreviado</label><input type='text' name='tituloabreviado' id='tituloabreviado' value='" + datos.getString("titulopequeproyecto") + "'/><br/>");
                        out.print("<label for='surname'>Institución</label><input type='text' name='institucion' id='institucion' value='" + datos.getString("nombreinstitucion") + "'/><input type='hidden' name='idinstitucion' id='idinstitucion' value='" + datos.getString("idinstitucion") + "'/><br/>");
                        out.print("<label for='surname'>Etapa</label><select id='comboestado' name='comboestado'><option selected='' value='" + datos.getString("etapaproyecto") + "'>" + datos.getString("nombreetapa") + "</option>" + control.combofiltro("etapa", idLlega) + "</select><br/><br/>");
                        out.print("<label for='surname'>Descripción</label><textarea name='descripcion' id='descripcion'>" + datos.getString("descripcionproyecto") + "</textarea><br/>");
                        out.print("<div class='demo'><label for='surname'>Fecha Inicio</label><input type='text' name='datepicker' id='datepicker' value='" + datos.getString("fechainicioproyecto") + "'/></div>");
                        out.print("<label for='surname'>Tipo</label><select id='tipo' name='tipo'><option selected='' value='Trabajo de Grado'>" + datos.getString("tipoproyecto") + "</option></select><br/><br/>");
                        estado = Integer.parseInt(datos.getString("esstadoproyecto"));
                        if (estado == 1) {
                            out.print("<span id='radios'><label for='surname'>Activo</label><input type='radio' name='estado' id='activo' checked='checked' value='1'>"
                                    + "<label for='surname'>Inactivo</label><input type='radio' name='estado' id='inactivo' value='0'</span><br/><br/>");
                        } else {
                            out.print("<span id='radios'><label for='surname'>Activo</label><input type='radio' name='estado' id='activo' value='1'>"
                                    + "<label for='surname'>Inactivo</label><input type='radio' name='estado' id='inactivo' checked='checked' value='0'</span><br/><br/>");
                        }                 
                        i++;
                    }
                %>                               
                <input id="enviarproyecto" type="submit" value="Actualizar" onsubmit="radio_marcado();"  name="enviarproyecto"/>
                <br/>
                <div id="resultados" >
                </div>  
            </fieldset>
        </form>
    </body>
</html>
