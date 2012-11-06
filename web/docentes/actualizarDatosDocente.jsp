<%-- 
    Document   : listafacultad
    Created on : 14-abr-2012, 3:48:52
    Author     : usuarui
--%>
<%@page session="true" %>
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
        <link rel="stylesheet" type="text/css" href="../recursos/Css/Docente/estiloFormularios.css" />

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
        <h1 class="actualizar">Actualizar Datos</h1>
        <form id="from1" name="form1" action="#" method="post">
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
                <input type="submit" name="enviar" id="enviar" value="Enviar">
            </fieldset>
            
        </form>
    </body>
</html>

<%
    if (request.getParameter("combomunicipios") != null) {
        int idfac = Integer.parseInt(request.getParameter("combodepartamento"));
        int idPro = Integer.parseInt(request.getParameter("combomunicipios"));

        String codFac = "";
        String nomFac = "";
        String codPro = "";
        String nomPro = "";
                

        try {
            String sql = "select codigofacultad, nombrefacultad from facultad where idfacultad=" + idfac + ";";
            //System.out.print(sql);
            ResultSet rs = control.consultas(sql);
            while (rs.next()) {
                codFac = rs.getString("codigofacultad").trim();
                nomFac = rs.getString("nombrefacultad").trim();
            }
        } catch (Exception e) {
            out.println("Exception is ;" + e);
        }

        try {
            String sql = "select codigoprograma, nombreprograma from programa where idprograma=" + idPro + ";";
            //System.out.print(sql);
            ResultSet rs = control.consultas(sql);
            while (rs.next()) {
                codPro = rs.getString("codigoprograma").trim();
                nomPro = rs.getString("nombreprograma").trim();
            }
        } catch (Exception e) {
            out.println("Exception is ;" + e);
        }
        
        if (!codFac.trim().equals("") & codFac != null){
            String sql = "UPDATE usuario SET codigofacultad='"+codFac+"' WHERE codigousuario='" + docentes + "';";
            String sql1 = "UPDATE usuario SET nombrefacultad='"+nomFac+"' WHERE codigousuario='" + docentes + "';";
            String sql2 = "UPDATE usuario SET nombreprograma='"+nomPro+"' WHERE codigousuario='" + docentes + "';";
            String sql3 = "UPDATE usuario SET codigoprograma='"+codPro+"' WHERE codigousuario='" + docentes + "';";
            control.ejecutarOperacion(sql);
            control.ejecutarOperacion(sql1);
            control.ejecutarOperacion(sql2);
            control.ejecutarOperacion(sql3);
            out.print("<script>window.location='index.jsp'</script>");
        }

        //out.print(codFac + "  " + nomFac + "  " + codPro + "  " + nomPro);
    }
%>