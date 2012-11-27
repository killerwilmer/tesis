<%-- 
    Document   : tablasublinea
    Created on : 21/11/2012, 02:01:41 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.umariana.control.ConectaDb"%>

<% 
    ConectaDb control = new ConectaDb();
    HttpSession sesionOk = request.getSession();
    String idProgram = (String) sesionOk.getAttribute("idp");
    int i =0;
    //out.print(idProgram);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="actualizar/funciones.js"></script>
        <script>           
           $(document).ready(function() {
                $('#examplesublinea tbody tr a.deletesublinea img').live( 'click', function (e) {
                    var rowIDS = $(this).parent().attr('id');                 
                    //sesionOk.setAttribute("pro", rowID);
                    $("#cont1").load('actualizar/formularioSubLinea.jsp?rowIDS=' + rowIDS);
                    //alert(rowID);
                });
            } );
        </script>
    </head>
    <body id="dt_example">
        <div id="container" style="margin-left: 50px; margin-right: 50px">
            <h1 id="titulolinea">LISTA SUB-LINEAS DE INVESTIGACIÓN</h1>
            <div id="demo">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="examplesublinea" width="100%">
                    <thead id="inte">
                        <tr><td>#</td><td>Nombre Linea</td><td>Nombre Sub-Linea</td><td id="columaactualizar">Actualizar</td><td class="eliminarintegrante">Eliminar</td></tr>
                    </thead>
                    <tbody>
                       <%                            
                       String sql ="select distinct sublinea.idsublinea, linea.nombrelinea, sublinea.nombresublinea from linea, sublinea, grupoinvestigacion where sublinea.idlinea=linea.idlinea and linea.idlinea=grupoinvestigacion.idlinea and grupoinvestigacion.idprograma='" + idProgram + "';";                      
                        //out.print(sql);
                       ResultSet datos = control.consultas(sql);                                                
                            while (datos.next()) {         
                                out.print(control.linea(i) + "<td name='cod'>" + (i + 1) + "</td>"
                                        + "<td name='nomlinea'>" + datos.getString("nombrelinea") + "</td>"
                                        + "<td name='nomsublinea'>" + datos.getString("nombresublinea") + "</td>"
                                        + "<td name='actualizar' id='" + i + "'><a id='"+datos.getString("idsublinea")+"' class='deletesublinea'><img id='act' src='../recursos/Imagenes/Coordinador/actualizar.png' alt='' /></a></td>"                                                                       
                                        + "<td name='eliminar' id='" + i + "'><a id='" + datos.getString("idsublinea") + "' class='deletesublineaeliminar'><img id='act' src='../recursos/Imagenes/Coordinador/eliminar.png' alt='' /></a></td>");
                                i++;
                            }
                        %>
                    </tbody>
                </table>
                <br/>
                <div id="resultados" >
                </div>
            </div>                    
        </div>
    </body>
</html>
