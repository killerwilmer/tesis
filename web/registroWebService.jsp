<%-- 
    Document   : registroWebService
    Created on : 25-feb-2012, 14:19:09
    Author     : zzz
--%>

<%@page import="com.umariana.control.ConectaDb"%>
<%@page import="java.util.StringTokenizer"%>
<%@page language="java" import="java.util.Enumeration" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>
<% ConectaDb control = new ConectaDb(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Usuario</title>
        <link rel="stylesheet" href="recursos/Css/registroUsuario.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="recursos/Css/milk.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="recursos/Css/jquery.validate.password.css" type="text/css" media="screen" />
        <script type="text/javascript" src="recursos/Js/index/jquery.js"></script>
        <script type="text/javascript" src="recursos/Js/index/jquery.validate.js"></script>
        <script type="text/javascript" src="recursos/Js/index/jquery.validate.password.js"></script>
      
        <script id="demo" type="text/javascript">
            $(document).ready(function() {
                // validate signup form on keyup and submit
                var validator = $("#signupform").validate({
                    rules: {
                        password: {
                            password: "#username"
                        },
                        password_confirm: {
                            required: true,
                            equalTo: "#password"
                        }
                    },
                    messages: {
                        username: {
				required: "Enter a username",
				minlength: jQuery.format("Enter at least {0} characters")
			},
                        password_confirm: {
                            required: "Repetir Tú Contraseña",
                            minlength: jQuery.format("Enter at least {0} characters"),
                            equalTo: "Digite La Misma Contraseña"
                        }
                    },
                    // the errorPlacement has to take the table layout into account
                    errorPlacement: function(error, element) {
                        error.prependTo( element.parent().next() );
                    },
                    // set this class to error-labels to indicate valid fields
                    success: function(label) {
                        // set &nbsp; as text for IE
                        label.html("&nbsp;").addClass("checked");
                    }
                });
                
            });
        </script>
        
    </head>
    <body style="border-radius: 10px; background: url(recursos/Imagenes/index/transparente.png)">
        
        <div id="stylized" class="myform">
            <h1>Registro Usuario</h1>
        <form name="form1" action="registroWebService.jsp" method="POST">
            <label>Tipo de Usuario
                <span class="small">Escoja el tipo de usuario</span>
            </label>
            <select name="tipo">
                <option value="E">Estudiante</option>
                <option value="F">Funcionario</option>
            </select>
            <label>N° Identificación:
                <span class="small">Digite su número</span>
            </label>
            <input type="text" name="codigo" value="" />
            
            <input id="boton" type="submit" value="Enviar" name="enviar" />
            <div class="spacer"></div>
        </form>
        </div>
 
        <% boolean ocultar=false; %>
        
        <%
        
        String boton = request.getParameter("enviar");
        String tip = request.getParameter("tipo");
        if (boton != null && tip.equals("E")  ) {
                try {
                    com.umariana.webservice.Consultasql service = new com.umariana.webservice.Consultasql();
                    com.umariana.webservice.ConsultasqlSoap port = service.getConsultasqlSoap();
                    // TODO initialize WS operation arguments here
                    java.lang.String codigo = request.getParameter("codigo");
                    java.lang.String tipo = request.getParameter("tipo");
                    java.lang.String bd = "caridad";
                    java.lang.String usu = "u_consultorio";
                    java.lang.String con = "uc_123456$unimar";
                    // TODO process result here
                    java.lang.String datosEstudiantes = port.getString(codigo, tipo, bd, usu, con);
                    
                    
                    String[] datosEstudiantesSeparados = datosEstudiantes.split("\\,", -1);   //datosEstudiantes.split(",");

                    for(int i = 0 ; i <= datosEstudiantesSeparados.length-1; i++){
                        if (datosEstudiantesSeparados[i].equals(null) || datosEstudiantesSeparados[i].equals("")){
                            datosEstudiantesSeparados[i] = "null";
                        }
                    }
                    
                    
                    String TIPO_PERSONA = "", GENERO = "",ESTADO_CIVIL = "", CODIGO_CIUDAD = "", NOMBRE_CIUDAD = "", FECHA_NACIMIENTO = "", IDENTIFICACION = "", APELLIDOS = "", NOMBRES = "",
                            CODIGO_PROGRAMA = "", PROGRAMA = "", CODIGO_FACULTAD = "", FACULTAD = "", ESTADO = "", DIR_CASA = "", TELEFONO = "", EMAIL = "", CELULAR = "", EPS = "", DESC_RH = "";
                    
                    
                    TIPO_PERSONA = datosEstudiantesSeparados[0];
                    GENERO = datosEstudiantesSeparados[1];
                    ESTADO_CIVIL = datosEstudiantesSeparados[2];
                    CODIGO_CIUDAD = datosEstudiantesSeparados[3];
                    NOMBRE_CIUDAD = datosEstudiantesSeparados[4];
                    FECHA_NACIMIENTO = datosEstudiantesSeparados[5];
                    IDENTIFICACION = datosEstudiantesSeparados[6];
                    APELLIDOS = datosEstudiantesSeparados[7];
                    NOMBRES = datosEstudiantesSeparados[8];
                    CODIGO_PROGRAMA = datosEstudiantesSeparados[11];
                    PROGRAMA = datosEstudiantesSeparados[12];
                    CODIGO_FACULTAD = datosEstudiantesSeparados[9];
                    FACULTAD = datosEstudiantesSeparados[10];
                    ESTADO = datosEstudiantesSeparados[13];
                    DIR_CASA = datosEstudiantesSeparados[14];
                    TELEFONO = datosEstudiantesSeparados[15];
                    EMAIL = datosEstudiantesSeparados[16];
                    CELULAR = datosEstudiantesSeparados[17];
                    EPS = datosEstudiantesSeparados[18];
                    DESC_RH = datosEstudiantesSeparados[19];
                    
                    out.println("<div id='stylized2' class='myform2'>");
                    out.println("<div id='main'>");
                    out.println("<div id='content'>");
                    out.println("<div class='content'>");
                    out.println("<div id='signupbox'>");
                    out.println("<div id='signupwrap'>");
                    
                    out.println("<form id='signupform' autocomplete='off' method='POST' action=''>");
                    out.println("<table>");
                    
                    out.println("<tr>");
                    out.println("<td class='label'><label id='lpassword' for='password'>Password<span class='small'>Debe tener almenos 8 caracteres</span></label></td>");
                    out.println("<td class='field'><input id='password' name='password' type='password' maxlength='50' value=''/></td>");
                    out.println("<td class='status'>");
                    out.println("<div class='password-meter'>");
                    out.println("<div class='password-meter-message'>&nbsp;</div>");
                    out.println("<div class='password-meter-bg'>");
                    out.println("<div class='password-meter-bar'></div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</td>");                    
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td class='label'><label id='lpassword_confirm' for='password_confirm'>Confirma Password</label></td>");                    
                    out.println("<td class='field'><input id='password_confirm' name='password_confirm' type='password' maxlength='50' value='' /></td>");
                    out.println("<td class='status'></td>");
                    out.println("</tr>");
                                       
                    out.println("<tr>");
                    out.println("<td class='label'><label id='lsignupsubmit' for='signupsubmit'>Guardar</label></td>");
                    out.println("<td class='field' colspan='2'>");                   
                    out.println("<input id='signupsubmit' name='signup' type='submit' value='Guardar' />");
                    out.println("</td>");
                    out.println("</tr>");
                    
                    out.println("</table>");
                    
                    
                    out.println("</div>");                    
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");                   
                    out.println("</div>");                
                    
                   
                    out.println("<label>Tipo Usuario</label><input type='text' name='tipousuario' READONLY value='"+TIPO_PERSONA+"'></>");
                    out.println("<label>Genero</label><input type='text' name='genero' READONLY value='"+GENERO+"'></>");
                    out.println("<label>Estado Civil</label><input type='text' name='estadocivil' READONLY value='"+ESTADO_CIVIL+"'></>");
                    out.println("<label>Código Ciudad</label><input type='text' name='codigociudad' READONLY value='"+CODIGO_CIUDAD+"'></>");
                    out.println("<label>Nombre</label><input type='text' name='nombreciudad' READONLY value='"+NOMBRE_CIUDAD+"'></>");
                    out.println("<label>Fecha de Nacimiento</label><input type='text' name='fechanacimiento' READONLY value='"+FECHA_NACIMIENTO+"'></>");
                    out.println("<label>Identificación</label><input type='text' name='identificacion' READONLY value='"+IDENTIFICACION+"'></>");
                    out.println("<label>Apellidos</label><input type='text' name='apellidos' READONLY value='"+APELLIDOS+"'></>");
                    out.println("<label>Nombres</label><input type='text' name='nombres' READONLY value='"+NOMBRES+"'></>");
                    out.println("<label>Codigo Programa</label><input type='text' name='codigoprograma' READONLY value='"+CODIGO_PROGRAMA+"'></>");
                    out.println("<label>Programa</label><input type='text' name='nombreprograma' READONLY value='"+PROGRAMA+"'></>");
                    out.println("<label>Codigo Facultad</label><input type='text' name='codigofacultad' READONLY value='"+CODIGO_FACULTAD+"'></>");
                    out.println("<label>Facultad</label><input type='text' name='nombrefacultad' READONLY value='"+FACULTAD+"'></>");
                    out.println("<label>Estado</label><input type='text' name='estado' READONLY value='"+ESTADO+"'></>");
                    out.println("<label>Dirección Casa</label><input type='text' name='direccion' READONLY value='"+DIR_CASA+"'></>");
                    out.println("<label>Teléfono</label><input type='text' name='telefono' READONLY value='"+TELEFONO+"'></>");
                    out.println("<label>E-mail</label><input type='text' name='email' READONLY value='"+EMAIL+"'></>");
                    out.println("<label>Celular</label><input type='text' name='celular' READONLY value='"+CELULAR+"'></>");
                    out.println("<label>Eps</label><input type='text' name='eps' READONLY value='"+EPS+"'></>");
                    out.println("<label>RH</label><input type='text' name='rh' READONLY value='"+DESC_RH+"'></>");
                    out.println("</form>");
                    
                    out.print("<div class='spacer'></div>");
                    out.print("</div>");
                    /*for(int i = 0 ; i <= datosEstudiantesSeparados.length-1; i++){
                        out.println(datosEstudiantesSeparados[ i]);
                    }*/
                    
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
            }
        
        //Funcionario
               else if(boton != null && tip.equals("F")  ) {
                try {
                    com.umariana.webservice.Consultasql service = new com.umariana.webservice.Consultasql();
                    com.umariana.webservice.ConsultasqlSoap port = service.getConsultasqlSoap();
                    // TODO initialize WS operation arguments here
                    java.lang.String codigo = request.getParameter("codigo");
                    java.lang.String tipo = request.getParameter("tipo");
                    java.lang.String bd = "caridad";
                    java.lang.String usu = "u_consultorio";
                    java.lang.String con = "uc_123456$unimar";
                    // TODO process result here
                    java.lang.String datosEstudiantes = port.getString(codigo, tipo, bd, usu, con);
                    
                    
                    String[] datosEstudiantesSeparados = datosEstudiantes.split("\\,", -1);   //datosEstudiantes.split(",");

                    for(int i = 0 ; i <= datosEstudiantesSeparados.length-1; i++){
                        if (datosEstudiantesSeparados[i].equals(null) || datosEstudiantesSeparados[i].equals("")){
                            datosEstudiantesSeparados[i] = "null";
                        }
                    }
                    
                    
                    String TIPO_PERSONA = "", GENERO = "",ESTADO_CIVIL = "",CENTRO_DE_COSTO = "",TIPO_DE_PUESTO = "",DEDICACION = "",ESTUDIOS = "",CODIGO_CIUDAD_DE_NACIMIENTO = "", CIUDAD_DE_NACIMIENTO = "", IDENTIFICACION = "", CARGO = "", APELLIDOS = "", NOMBRES = "",
                            FECHA_NACIMIENTO = "", TITULO = "", ESTADO = "", DIR_CASA="", TEL_CASA = "", TEL_OFICINA = "", EMAIL = "", CELULAR = "", EPS = "";
                    
                    
                    TIPO_PERSONA = datosEstudiantesSeparados[0];
                    GENERO = datosEstudiantesSeparados[1];
                    ESTADO_CIVIL = datosEstudiantesSeparados[2];
                    CENTRO_DE_COSTO = datosEstudiantesSeparados[3];
                    TIPO_DE_PUESTO = datosEstudiantesSeparados[4];
                    DEDICACION = datosEstudiantesSeparados[5];
                    ESTUDIOS = datosEstudiantesSeparados[6];
                    CODIGO_CIUDAD_DE_NACIMIENTO = datosEstudiantesSeparados[7];
                    CIUDAD_DE_NACIMIENTO = datosEstudiantesSeparados[8];
                    IDENTIFICACION = datosEstudiantesSeparados[9];
                    CARGO = datosEstudiantesSeparados[10];
                    APELLIDOS = datosEstudiantesSeparados[11];
                    NOMBRES = datosEstudiantesSeparados[12];
                    FECHA_NACIMIENTO = datosEstudiantesSeparados[13];
                    TITULO = datosEstudiantesSeparados[14];
                    ESTADO = datosEstudiantesSeparados[15];
                    DIR_CASA = datosEstudiantesSeparados[16];
                    TEL_CASA = datosEstudiantesSeparados[17];
                    TEL_OFICINA = datosEstudiantesSeparados[18];
                    EMAIL = datosEstudiantesSeparados[19];
             
                    
                    out.println("<div id='stylized2' class='myform2'>");
                    out.println("<div id='main'>");
                    out.println("<div id='content'>");
                    out.println("<div class='content'>");
                    out.println("<div id='signupbox'>");
                    out.println("<div id='signupwrap'>");
                    
                    out.println("<form id='signupform' autocomplete='off' method='POST' action=''>");
                    out.println("<table>");
                    
                    out.println("<tr>");
                    out.println("<td class='label'><label id='lpassword' for='password'>Password<span class='small'>Debe tener almenos 8 caracteres</span></label></td>");
                    out.println("<td class='field'><input id='password' name='password' type='password' maxlength='50' value=''/></td>");
                    out.println("<td class='status'>");
                    out.println("<div class='password-meter'>");
                    out.println("<div class='password-meter-message'>&nbsp;</div>");
                    out.println("<div class='password-meter-bg'>");
                    out.println("<div class='password-meter-bar'></div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</td>");                    
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td class='label'><label id='lpassword_confirm' for='password_confirm'>Confirma Password</label></td>");                    
                    out.println("<td class='field'><input id='password_confirm' name='password_confirm' type='password' maxlength='50' value='' /></td>");
                    out.println("<td class='status'></td>");
                    out.println("</tr>");
                                       
                    out.println("<tr>");
                    out.println("<td class='label'><label id='lsignupsubmit' for='signupsubmit'>Guardar</label></td>");
                    out.println("<td class='field' colspan='2'>");                   
                    out.println("<input id='signupsubmit' name='signup' type='submit' value='Guardar' />");
                    
                    out.println("</td>");
                    out.println("</tr>");
                    
                    out.println("</table>");                   
                    
                    out.println("</div>");                    
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");                   
                    out.println("</div>");                
                    
                   
                    out.println("<label>Tipo Usuario</label><input type='text' name='tipousuario' READONLY value='"+TIPO_PERSONA+"'></>");
                    out.println("<label>Genero</label><input type='text' name='genero' READONLY value='"+GENERO+"'></>");
                    out.println("<label>Estado Civil</label><input type='text' name='estadocivil' READONLY value='"+ESTADO_CIVIL+"'></>");
                    out.println("<label>Centro de Costo</label><input type='text' name='centrocosto' READONLY value='"+CENTRO_DE_COSTO+"'></>");
                    out.println("<label>Tipo de Puesto</label><input type='text' name='tipopuesto' READONLY value='"+TIPO_DE_PUESTO+"'></>");
                    out.println("<label>Dedicación</label><input type='text' name='dedicacion' READONLY value='"+DEDICACION+"'></>");
                    out.println("<label>Estudios</label><input type='text' name='estudios' READONLY value='"+ESTUDIOS+"'></>");
                    out.println("<label>Codigo Ciudad</label><input type='text' name='codigociudad' READONLY value='"+CODIGO_CIUDAD_DE_NACIMIENTO+"'></>");
                    out.println("<label>Ciudad de Nacimiento</label><input type='text' name='ciudadnacimiento' READONLY value='"+CIUDAD_DE_NACIMIENTO+"'></>");
                    out.println("<label>Identificación</label><input type='text' name='identificacion' READONLY value='"+IDENTIFICACION+"'></>");
                    out.println("<label>Cargo</label><input type='text' name='cargo' READONLY value='"+CARGO+"'></>");
                    out.println("<label>Apellidos</label><input type='text' name='apellidos' READONLY value='"+APELLIDOS+"'></>");
                    out.println("<label>Nombres</label><input type='text' name='nombres' READONLY value='"+NOMBRES+"'></>");
                    out.println("<label>Fecha de Nacimiento</label><input type='text' name='fechanacimiento' READONLY value='"+FECHA_NACIMIENTO+"'></>");
                    out.println("<label>Titulo</label><input type='text' name='titulo' READONLY value='"+TITULO+"'></>");
                    out.println("<label>Estado</label><input type='text' name='estado' READONLY value='"+ESTADO+"'></>");
                    out.println("<label>Dir. Casa</label><input type='text' name='dircasa' READONLY value='"+DIR_CASA+"'></>");
                    out.println("<label>Tel. Casa</label><input type='text' name='telcasa' READONLY value='"+TEL_CASA+"'></>");
                    out.println("<label>Tel. Oficina</label><input type='text' name='teloficina' READONLY value='"+TEL_OFICINA+"'></>");
                    out.println("<label>E-mail</label><input type='text' name='email' READONLY value='"+EMAIL+"'></>");
                    out.println("</form>");
                    
                    out.print("<div class='spacer'></div>");
                    out.print("</div>");
                    /*for(int i = 0 ; i <= datosEstudiantesSeparados.length-1; i++){
                        out.println(datosEstudiantesSeparados[ i]);
                    }*/

                    
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
            }
        %>   
    </body>
    
    
    <%
        String tipousuario = request.getParameter("tipousuario");
        if (request.getParameter("signup") != null && tipousuario.equals("Estudiante")) {
            
            String contraseña = request.getParameter("password");
            String verificarcontraseña = request.getParameter("password_confirm");
            String genero = request.getParameter("genero");
            String estadocivil = request.getParameter("estadocivil");
            String codigociudad = request.getParameter("codigociudad");
            String nombreciudad = request.getParameter("nombreciudad");
            String fechanacimiento = request.getParameter("fechanacimiento");
            String identificacion = request.getParameter("identificacion");
            String apellidos = request.getParameter("apellidos");
            String nombres = request.getParameter("nombres");
            String codigoprograma = request.getParameter("codigoprograma");
            String nombreprograma = request.getParameter("nombreprograma");
            String codigofacultad = request.getParameter("codigofacultad");
            String nombrefacultad = request.getParameter("nombrefacultad");
            String direccion = request.getParameter("direccion");
            String numerotelefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String numerocelular = request.getParameter("celular");
            String eps = request.getParameter("eps");
            String rh = request.getParameter("rh");
            String estado = request.getParameter("estado");
                
                
            ConectaDb con = new ConectaDb();
                
            if (contraseña.length() == 0 && verificarcontraseña.length() == 0) {
                out.print("<script lenguage=>'Javascript'> alert('falta un dato requerido')</script>");
            } else if (tipousuario.equals("Estudiante") && (estado.equals("null")|| estado.equals("Sin Matricula activa")) ) {
                out.print("<script lenguage=>'Javascript'> alert('Usted no esta Matriculado')</script>");
            } else {
                String idusuario = "1";
                String SQLIden = "Select codigousuario from usuario where codigousuario ='" + identificacion + "'";
                String SQLIdenusuario = "Select nombretipousuario from tipousuario where nombretipousuario ='" + tipousuario + "'";
                String SQLIdenfacultad = "Select codigofacultad from facultad where codigofacultad ='" + codigofacultad + "'";
                String SQLIdenprograma = "Select codigoprograma from programa where codigoprograma ='" + codigoprograma + "'";               
                   
                if (!control.iden(SQLIdenusuario) ) {
                    String SqlInsertusu = "insert into tipousuario(codigotipousuario, nombretipousuario) values('"+idusuario.trim()+"','" +tipousuario+"');";
                    con.ejecutarOperacion(SqlInsertusu);
                } 
                if(!control.iden(SQLIdenfacultad)){
                    String SqlInsertfacultad = "insert into facultad(codigofacultad, nombrefacultad) values('" + codigofacultad + "','" + nombrefacultad + "');";
                    con.ejecutarOperacion(SqlInsertfacultad);
                }
                if(!control.iden(SQLIdenprograma)){
                    int idfacultad = control.darTipoUsuario("select ", "idfacultad", " from facultad where nombrefacultad='" + nombrefacultad + "';");
                    String SqlInsertprograma = "insert into programa(idfacultad, codigoprograma, nombreprograma) values('" + idfacultad + "','" + codigoprograma + "','"+ nombreprograma + "');";              
                    con.ejecutarOperacion(SqlInsertprograma);
                }
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript> alert('Usuario ya existe'); history.back(); </script>");
                } 
                else {
                    int idTipoUsuario = control.darTipoUsuario("select ", "idtipousuario", " from tipousuario where nombretipousuario='" + tipousuario + "';");
                    String SqlInsert = "insert into usuario(idtipousuario, codigousuario, genero, estadocivil, codigociudad, nombreciudad, fechanacimiento, nombres, apellidos, codigoprograma, nombreprograma, codigofacultad, nombrefacultad, direccioncasa, email, celular, telefono, eps, rh, contrasena) values('" + idTipoUsuario + "','" + identificacion + "','" + genero + "','" + estadocivil + "','" + codigociudad + "','" + nombreciudad + "','" + fechanacimiento + "','" + nombres + "','" + apellidos + "','" + codigoprograma + "','" + nombreprograma + "','" + codigofacultad + "','" + nombrefacultad + "','" + direccion + "','" + email + "','" + numerocelular + "','" + numerotelefono + "','" + eps + "','" + rh + "','" + contraseña + "');";
                    if (con.ejecutarOperacion(SqlInsert)) {
                         ocultar = true;
                    } else {
                        out.print("<script lenguage='Javascript'> alert('Error al insertar los datos')</script>");
                    }
                }
            }
        }
        
       if(request.getParameter("signup") != null && tipousuario.equals("Funcionario")){
           
            String contraseñaF = request.getParameter("password");
            String verificarcontraseñaF = request.getParameter("password_confirm");
            String generoF = request.getParameter("genero");
            String estadocivilF = request.getParameter("estadocivil");
            String centrocostoF = request.getParameter("centrocosto");
            String tipopuestoF = request.getParameter("tipopuesto");
            String dedicacionF = request.getParameter("dedicacion");
            String estudiosF = request.getParameter("estudios");
            String codigociudadF = request.getParameter("codigociudad");
            String ciudadnacimientoF = request.getParameter("ciudadnacimiento");
            String identificacionF = request.getParameter("identificacion");
            String cargoF = request.getParameter("cargo");
            String apellidosF = request.getParameter("apellidos");
            String nombresF = request.getParameter("nombres");
            String fechanacimientoF = request.getParameter("fechanacimiento");
            String tituloF = request.getParameter("titulo");
            String dircasaF = request.getParameter("dircasa");
            String telcasaF = request.getParameter("telcasa");
            String emailF = request.getParameter("email");
            String teloficinaF = request.getParameter("teloficina");
            String epsF = "null";
            String codigoprograma = "null";
            String nombreprograma = "null";
            String codigofacultad = "null";
            String nombrefacultad = "null";
            String rh = "null";
            
            String estadoF = request.getParameter("estado");
            
            ConectaDb con = new ConectaDb();
            
            if (contraseñaF.length() == 0 && verificarcontraseñaF.length() == 0) {
                out.print("<script lenguage=>'Javascript'> alert('falta un dato requerido')</script>");
            } else if (tipousuario.equals("Funcionario") && estadoF.equals("null") ) {
                out.print("<script lenguage=>'Javascript'> alert('Usted Esta Inactivo')</script>");
            } 
            
            else{
                String idusuario = "2";
                String SQLIden = "Select codigousuario from usuario where codigousuario ='" + identificacionF + "'";
                String SQLIdenusuario = "Select nombretipousuario from tipousuario where nombretipousuariio ='" + tipousuario + "'";
                
                
                if (!control.iden(SQLIdenusuario) ) {
                    String SqlInsertusu = "insert into tipousuario(codigotipousuario, nombretipousuario) values('" + idusuario + "','" + tipousuario + "');";
                    con.ejecutarOperacion(SqlInsertusu);
                }
                if (control.iden(SQLIden)) {
                    out.print("<script languaje = javascript> alert('Usuario ya existe'); history.back(); </script>");
                }
                
                else {
                    int idTipoUsuarioF = control.darTipoUsuario("select ", "idtipousuario", " from tipousuario where nombretipousuario='" + tipousuario + "';");
                    String SqlInsert = "insert into usuario(idtipousuario, codigousuario, genero, estadocivil, codigociudad, nombreciudad, fechanacimiento, nombres, apellidos, codigoprograma, nombreprograma, codigofacultad, nombrefacultad, direccioncasa, email, celular, telefono, eps, rh, contrasena) values('" + idTipoUsuarioF + "','" + identificacionF + "','" + generoF + "','" + estadocivilF + "','" + codigociudadF + "','" + ciudadnacimientoF + "','" + fechanacimientoF + "','" + nombresF + "','" + apellidosF + "','" + codigoprograma + "','" + nombreprograma + "','" + codigofacultad + "','" + nombrefacultad + "','" + dircasaF + "','" + emailF + "','" + telcasaF + "','" + teloficinaF + "','" + epsF+ "','" + rh + "','" + contraseñaF + "');";
                    if (con.ejecutarOperacion(SqlInsert)) {
                        ocultar = true;
                        out.print("<script lenguage='Javascript'> alert('Datos Insertados Correctamente')</script>");
                    } else {
                        out.print("<script lenguage='Javascript'> alert('Error al insertar los datos')</script>");
                    }
                }
            }
       }
        if(ocultar==true)
                   {
            out.print("<script lenguage='Javascript'>parent.parent.GB_hide();</script>");
    }
%>
</html>

