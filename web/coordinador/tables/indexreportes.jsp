<%-- 
    Document   : indexreportes
    Created on : 10-oct-2012, 4:22:44
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Coordinador/estiloFormularios.css" />
        
        <script type="text/javascript">          
            $(document).ready(function(){
                $("#reportes").click(function(){
                    var codigo1 = $(this).val()
                    if(codigo1=='proyecto')
                    {
                        $("#salida").load('tables/reporteproyecto.jsp?codigo1='+codigo1);
                    }
                    else if(codigo1=='estudiantes'){
                        $("#salida").load('tables/reporteestudiantes.jsp?codigo1='+codigo1);
                    }
                    else if(codigo1=='docentes'){
                        $("#salida").load('tables/reportedocentes.jsp?codigo1='+codigo1);
                    }
                });
            });
        </script>
    </head>
    <body>

        <p class="report" ><select id="reportes" name="reportes">
            <option selected="" value="*">Seleccione Reporte A Visualizar</option>
            <option value="proyecto">PROYECTOS</option>
            <option value="estudiantes">ESTUDIANTES</option>
            <option value="docentes">DOCENTES</option>
            <option value="asesores">ASESORES</option>
            <option value="jurados">JURADOS</option>
        </select>
        <div id="salida"></div>
    </body>
</html>
