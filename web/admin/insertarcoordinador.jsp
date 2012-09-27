<%-- 
    Document   : insertarcoordinador
    Created on : 13-abr-2012, 18:59:23
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="../estudiantes/resources/css/jquery.toastmessage.css" rel="stylesheet"/>
        <script type="text/javascript" src="../estudiantes/jquerymin.js"></script>
        <script type="text/javascript" src="../estudiantes/javascript/jquery.toastmessage.js"></script>
        <script type="text/javascript" src="../recursos/Js/mensajespoput.js"></script>
        <title>JSP Page</title>
        
    </head>
    <body>
<%
                String idcoordinador = request.getParameter("idnombrescordinador");
                String idprograma = request.getParameter("idprograma");
                String estado = request.getParameter("idestadoa");       
                
                if ( (idcoordinador.length() == 0 ))
                {                    
                    out.print("<script languaje = javascript>showWarningToast('Digite Nombre');</script>");
                } else if ((idprograma.equals("*"))) {
                    out.print("<script languaje = javascript>showWarningToast('Seleccione un Programa');</script>");
                 } 
                else{
                    int idusu = control.darTipoUsuario("select ", "idusuario", " from usuario where (nombres || ' ' || apellidos)='" + idcoordinador + "';");
                    String SqlIdenumero = "Select * from coordinador where idusuario = '"+idusu+"'";
                    if ( control.iden(SqlIdenumero))
                    {
                        out.print("<script languaje = javascript>showNoticeToast('Ya Esta Vinculado a Un Programa');</script>");
                    }
                    else
                    {          
                        int numero =Integer.parseInt(idprograma);
                        int estados = Integer.parseInt(estado);
                        String SqlInsert = "insert into coordinador (idusuario,idprograma,activo) values('" + idusu + "','" + numero + "','" + estados + "');";
  
                        if ( control.ejecutarOperacion(SqlInsert))
                            {
                                out.print("<script languaje = javascript>showSuccessToast('Datos Insertados Correctamente');</script>");
                            }
                            else
                            {
                                out.print("<script languaje = javascript>showErrorToast('Error al Insertar los Datos');</script>");
                            }  
                    }                     
                }                            
%>
    </body>
</html>