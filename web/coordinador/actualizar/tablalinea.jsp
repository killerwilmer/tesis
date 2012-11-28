<%-- 
    Document   : tablalinea
    Created on : 20/11/2012, 06:05:51 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>
<%@ page session="true" %>
<!DOCTYPE html>
<%
    ConectaDb control = new ConectaDb();
    int i =0;
    String idProgram = "";
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idProgram = (String) sesionOk.getAttribute("coordinador");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>       
        <script>           
           $(document).ready(function() {
                $('#examplelinea tbody tr a.deletelinea img').live( 'click', function (e) {
                    var rowIDL = $(this).parent().attr('id');                 
                    //sesionOk.setAttribute("pro", rowID);
                    $("#cont1").load('actualizar/formularioLinea.jsp?rowIDL=' + rowIDL);
                    //alert(rowID);
                });
            } );
        </script>
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 25px; margin-right: 25px">
            <h1 id="titulolinea">LISTA LINEAS DE INVESTIGACIÓN</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplelinea" width="100%">
                    <thead id="inte">
                        <tr><td>#</td><td>Nombre Linea</td><td class="eliminarintegrante">Actualizar</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                       String sql ="select linea.idlinea, nombrelinea from grupoinvestigacion, linea where linea.idlinea=grupoinvestigacion.idlinea and grupoinvestigacion.idprograma='" + idProgram + "';";                      
                        ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='nomlinea'>" + datos.getString("nombrelinea") + "</td>"
                                        + "<td name='actualizar' id='" + i + "'><a id='"+datos.getString("idlinea")+"' class='deletelinea'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>");                                                                       
                                i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>                    
        </div>
    </body>
</html>
