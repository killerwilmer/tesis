<%-- 
    Document   : insertarprograma
    Created on : 26-mar-2012, 1:12:42
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
                String idfacultad = request.getParameter("combo");
                String codigoPrograma = request.getParameter("codigop");
                String nombrePrograma = request.getParameter("nomp");       
                
                if ( (codigoPrograma.length() == 0 ) || (nombrePrograma.length()==0))
                {                    
                    out.print("Faltan datos");
                } 
          
                else
                {
                    String SqlIdenumero = "Select * from programa where codigoprograma = '"+codigoPrograma+"'";
                    String SqlIden = "Select * from programa where nombreprograma = '"+nombrePrograma+"'";
                    if ( control.iden(SqlIdenumero) || control.iden(SqlIden))
                    {
                        out.print("Ya existe");
                    }
                    else
                    {          
                        int numero =Integer.parseInt(idfacultad);
                        String SqlInsert = "insert into programa (idfacultad,codigoprograma,nombreprograma) values('" + numero + "','" + codigoPrograma + "','" + nombrePrograma + "');";
  
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
