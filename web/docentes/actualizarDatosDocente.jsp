<%-- 
    Document   : listafacultad
    Created on : 14-abr-2012, 3:48:52
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<%
    HttpSession sesionOk = request.getSession();
    String docentes = (String) sesionOk.getAttribute("docente");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../recursos/Js/jquery-1.7.1.js"></script>

        <script language="javascript">
            $(document).ready(function(){
                // Parametros para e combo1
                $("#combodepartamento").change(function () {
                    $("#combodepartamento option:selected").each(function () {
                        //alert($(this).val());
                        elegido=$(this).val();
                        $.post("combomunicipios.jsp", { elegido: elegido }, function(data){
                            $("#combomunicipios").html(data);
                            $("#combo3").html("");
                        });			
                    });
                })
            });
        </script>

    </head>
    <body>

        <fieldset id="fiel">               
            <%
                String sqlString = "SELECT * FROM facultad;";

                ResultSet resultado = control.consultas(sqlString);

                while (resultado.next()) {
                    out.print("<select name='combodepartamento' id='combodepartamento'>");
                    out.print("<option value='0'>Elija uno</option>");
                    out.print("<option value='" + resultado.getString("idfacultad") + "'>" + resultado.getString("nombrefacultad") + "</option>");
                    out.print("</select>");
                    out.print("</select>");
                    out.print("<br/>");
                    out.print("<select name='combomunicipios' id='combomunicipios'>");
                    out.print("</select>");
                }
            %>
        </fieldset>
    </body>
</html>