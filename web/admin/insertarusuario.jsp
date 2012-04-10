<%-- 
    Document   : insertarusuario
    Created on : 06-abr-2012, 12:00:25
    Author     : usuarui
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
      
    String idtipousuario = request.getParameter("comtusu");
    String identificacion = request.getParameter("identificacion");
    String genero = request.getParameter("genero");
    String estadocivil = request.getParameter("estcivil");
    String codigociudad = request.getParameter("codciudad");
    String nombreciudad = request.getParameter("nomciudad");
    String fechanaciomiento = request.getParameter("fechanac");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String codigoprograma = request.getParameter("codprog");
    String nombrePrograma = request.getParameter("nomprog");
    String codigofaculta = request.getParameter("codfacu");
    String nombrefaculta = request.getParameter("nomfacu");
    String direccion = request.getParameter("dir");
    String email = request.getParameter("email");
    String numcelular = request.getParameter("celu");
    String numtelcasa = request.getParameter("numcasa");
    String eps = request.getParameter("ep");
    String rh = request.getParameter("trh");
    String contraseña = request.getParameter("clave");


    if ((nombres.length() == 0) || (apellidos.length() == 0) || (identificacion.length() == 0) || (contraseña.length() == 0)|| (codigofaculta.length() == 0) || (nombrefaculta.length() == 0) || (codigoprograma.length() == 0) || (nombrePrograma.length() == 0) || (email.length() == 0)) {
            out.print("Faltan datos");
        } else {
            String SqlIdenumero = "Select * from usuario where codigousuario = '" + identificacion + "'";
            String SQLIdenfacultad = "Select codigofacultad from facultad where codigofacultad ='" + codigofaculta + "'";
            String SQLIdenprograma = "Select codigoprograma from programa where codigoprograma ='" + codigoprograma + "'";

            if (!control.iden(SQLIdenfacultad)) {
                String SqlInsertfacultad = "insert into facultad(codigofacultad, nombrefacultad) values('" + codigofaculta + "','" + nombrefaculta + "');";
                control.ejecutarOperacion(SqlInsertfacultad);
            }
            if (!control.iden(SQLIdenprograma)) {
                int idfacultad = control.darTipoUsuario("select ", "idfacultad", " from facultad where nombrefacultad='" + nombrefaculta + "';");
                String SqlInsertprograma = "insert into programa(idfacultad, codigoprograma, nombreprograma) values('" + idfacultad + "','" + codigoprograma + "','" + nombrePrograma + "');";
                control.ejecutarOperacion(SqlInsertprograma);
            }
            if (control.iden(SqlIdenumero)) {
                out.print("Ya Existe Usuario");
            } else {
                int numero = Integer.parseInt(idtipousuario);
                String SqlInsert = "insert into usuario (idtipousuario,codigousuario,genero,estadocivil,codigociudad,nombreciudad,fechanacimiento,nombres,apellidos,codigoprograma,nombreprograma,codigofacultad,nombrefacultad,direccioncasa,email,celular,telefono,eps,rh,contrasena)"
                        + " values('" + numero + "','" + identificacion + "','" + genero + "','" + estadocivil + "','" + codigociudad + "','" + nombreciudad + "','" + fechanaciomiento + "','" + nombres + "','" + apellidos + "','" + codigoprograma + "','" + nombrePrograma + "','" + codigofaculta + "','" + nombrefaculta + "','" + direccion + "','" + email + "','" + numcelular + "','" + numtelcasa + "','" + eps + "','" + rh + "','" + contraseña + "');";

                if (control.ejecutarOperacion(SqlInsert)) {
                    out.print("Datos Insertados Correctamente");
                } else {
                    out.print("Error al Insertar los Datos");
                }
            }
        }

%>
