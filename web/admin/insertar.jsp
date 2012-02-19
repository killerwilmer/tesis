<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
                String miFacultad = request.getParameter("numero");

                if ( miFacultad.length() == 0 )
                {                    
                    out.print("Faltan datos");
                }
                else
                {
                    String SqlIden = "Select * from facultad where nomfacultad = '"+miFacultad+"'";
                    if ( control.iden(SqlIden))
                    {
                        out.print("Ya existe");
                    }
                    else
                    {
                        String SqlInsert = "insert into facultad (nomfacultad) values('"+miFacultad+"');";
                        if ( control.transaccion(SqlInsert))
                            {
                                out.print("Exito");
                            }
                            else
                            {
                                out.print("Error");
                            }
                    }                    
                }               
%>