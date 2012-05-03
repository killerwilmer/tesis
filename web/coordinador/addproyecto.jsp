<%-- 
    Document   : addproyecto
    Created on : 30-abr-2012, 8:50:57
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
                String codigo = request.getParameter("codigo");
                String titulo = request.getParameter("titulo");
                String tituloabreviado = request.getParameter("titucorto");  
                String descripcion = request.getParameter("descripcion");
                String institucion = request.getParameter("institu");                      
                
                if ( (titulo.length() == 0 ) || (tituloabreviado.length()==0) || (descripcion.length()==0))
                {                    
                    out.print("Faltan datos");
                } 
          
                else
                {
                    String SqlIdenumero = "Select * from proyecto where idproyecto = '"+codigo+"'";
                    String SqlIden = "Select * from institucion where nombreinstitucion = '"+institucion+"'";
                    if ( control.iden(SqlIdenumero))
                    {
                        out.print("Ya existe");
                    }
                    
                    if ( !control.iden(SqlIden))
                    {
                      String SqlInsertusu = "insert into institucion (nombreinstitucion) values('" + institucion + "');";
                      control.ejecutarOperacion(SqlInsertusu);
                    }
                    
                    else
                    {                       
                        String SqlInsert = "insert into proyecto (tituloproyecto,titulopequeproyecto, descripcionproyecto) values('" + titulo + "','" + tituloabreviado + "','" + descripcion + "');";
                      
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
