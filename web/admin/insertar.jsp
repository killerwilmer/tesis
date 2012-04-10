<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
                String miCodigo = request.getParameter("codigof");
                String miFacultad = request.getParameter("numero");        
                
                if ( (miFacultad.length() == 0 ) || (miCodigo.length()==0))
                {                    
                    out.print("Faltan datos");
                } 
          
                else
                {
                    String SqlIdenumero = "Select * from facultad where codigofacultad = '"+miCodigo+"'";
                    String SqlIden = "Select * from facultad where nombrefacultad = '"+miFacultad+"'";
                    if ( control.iden(SqlIdenumero) || control.iden(SqlIden))
                    {
                        out.print("Ya existe");
                    }
                    else
                    {                       
                        String SqlInsert = "insert into facultad (codigofacultad,nombrefacultad) values('"+miCodigo+"','"+miFacultad+"');";
                      
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