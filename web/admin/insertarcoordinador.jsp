<%-- 
    Document   : insertarcoordinador
    Created on : 13-abr-2012, 18:59:23
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
                String idcoordinador = request.getParameter("idnombrescordinador");
                String idprograma = request.getParameter("idprograma");
                String estado = request.getParameter("idestadoa");       
                
                if ( (idcoordinador.length() == 0 ))
                {                    
                    out.print("Faltan datos");
                } 
          
                else{
                    int idusu = control.darTipoUsuario("select ", "idusuario", " from usuario where nombres='" + idcoordinador + "';");
                    String SqlIdenumero = "Select * from coordinador where idusuario = '"+idusu+"'";
                    if ( control.iden(SqlIdenumero))
                    {
                        out.print("Ya Esta Vinculado a Un Programa");
                    }
                    else
                    {          
                        int numero =Integer.parseInt(idprograma);
                        int estados = Integer.parseInt(estado);
                        String SqlInsert = "insert into coordinador (idusuario,idprograma,activo) values('" + idusu + "','" + numero + "','" + estados + "');";
  
                        if ( control.ejecutarOperacion(SqlInsert))
                            {
                                out.print("Datos Insertados Correctamente");
                            }
                            else
                            {
                                out.print("Error al Insertar los Datos");
                            }  
                    }                     
                }                            
%>
