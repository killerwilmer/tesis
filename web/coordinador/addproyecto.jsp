<%-- 
    Document   : addproyecto
    Created on : 30-abr-2012, 8:50:57
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
                String titulo = request.getParameter("titulo");
                String tituloabreviado = request.getParameter("titucorto");  
                String descripcion = request.getParameter("descripcion");
                String institucion = request.getParameter("institu");  
                String estado = request.getParameter("estado");                                   
                String fecha = request.getParameter("fecha");
                String tipo = request.getParameter("tipo");
                String activo = request.getParameter("activo");
                        
                
                if ( (titulo.length() == 0 ) || (tituloabreviado.length()==0) || (descripcion.length()==0))
                {                    
                    out.print("Faltan datos");
                }
                else if(fecha.length()==0){
                    out.print("Seleccione una Fecha");
                } 
                else if(estado.equals("*")){
                    out.print("Seleccione un Estado");
                }  
                else if(tipo.equals("*")){
                    out.print("Seleccione un Tipo");
                }       
                else
                {
                    String SqlIdenumero = "Select * from proyecto where tituloproyecto = '"+titulo.toUpperCase()+"'";
                    String SqlIden = "Select * from institucion where nombreinstitucion = '"+institucion.toUpperCase()+"'";
                    if ( control.iden(SqlIdenumero))
                    {
                        out.print("Proyecto Ya Existe");
                    }
                    
                    if ( !control.iden(SqlIden))
                    {
                      String SqlInsertusu = "insert into institucion (nombreinstitucion) values('" + institucion.toUpperCase() + "');";
                      control.ejecutarOperacion(SqlInsertusu);
                    }
                    
                    else
                    {       
                        int idInstitucion= control.darTipoUsuario("select ", "idinstitucion", " from institucion where nombreinstitucion='" + institucion.toUpperCase() + "';");                  
                        int etapaproyecto= Integer.parseInt(estado);
                        int estadoproyecto=Integer.parseInt(activo);
                        String SqlInsert = "insert into proyecto (idinstitucion, tituloproyecto,titulopequeproyecto, descripcionproyecto, etapaproyecto,fechainicioproyecto, tipoproyecto, esstadoproyecto) values('" + idInstitucion + "','" + titulo + "','" + tituloabreviado + "','" + descripcion + "','" + etapaproyecto + "','" + fecha + "','" + estadoproyecto +  "','" + activo + "');";
                      
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
