<%-- 
    Document   : registroWebService
    Created on : 25-feb-2012, 14:19:09
    Author     : zzz
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        	username: {
				required: true,
				minlength: 2
			},
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
                    // specifying a submitHandler prevents the default submit, good for the demo
                    submitHandler: function() {
                        alert("submitted!");
                    },
                    // set this class to error-labels to indicate valid fields
                    success: function(label) {
                        // set &nbsp; as text for IE
                        label.html("&nbsp;").addClass("checked");
                    }
                });
                
                // propose username by combining first- and lastname
                $("#username").focus(function() {
                    var firstname = $("#firstname").val();
                    var lastname = $("#lastname").val();
                    if(firstname && lastname && !this.value) {
                        this.value = firstname + "." + lastname;
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
                    out.println("</form>");
                    
                    out.println("</div>");                    
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");                   
                    out.println("</div>");                
                    
                   
                    out.println("<label>Tipo Usuario</label><input type='text' name='codigo' disabled='disabled' value='"+TIPO_PERSONA+"'></>");
                    out.println("<label>Genero</label><input type='text' name='codigo' disabled='disabled' value='"+GENERO+"'></>");
                    out.println("<label>Estado Civil</label><input type='text' name='codigo' disabled='disabled' value='"+ESTADO_CIVIL+"'></>");
                    out.println("<label>Código Ciudad</label><input type='text' name='codigo' disabled='disabled' value='"+CODIGO_CIUDAD+"'></>");
                    out.println("<label>Nombre</label><input type='text' name='codigo' disabled='disabled' value='"+NOMBRE_CIUDAD+"'></>");
                    out.println("<label>Fecha de Nacimiento</label><input type='text' name='codigo' disabled='disabled' value='"+FECHA_NACIMIENTO+"'></>");
                    out.println("<label>Identificación</label><input type='text' name='codigo' disabled='disabled' value='"+IDENTIFICACION+"'></>");
                    out.println("<label>Apellidos</label><input type='text' name='codigo' disabled='disabled' value='"+APELLIDOS+"'></>");
                    out.println("<label>Nombres</label><input type='text' name='codigo' disabled='disabled' value='"+NOMBRES+"'></>");
                    out.println("<label>Codigo Programa</label><input type='text' name='codigo' disabled='disabled' value='"+CODIGO_PROGRAMA+"'></>");
                    out.println("<label>Programa</label><input type='text' name='codigo' disabled='disabled' value='"+PROGRAMA+"'></>");
                    out.println("<label>Codigo Facultad</label><input type='text' name='codigo' disabled='disabled' value='"+CODIGO_FACULTAD+"'></>");
                    out.println("<label>Facultad</label><input type='text' name='codigo' disabled='disabled' value='"+FACULTAD+"'></>");
                    out.println("<label>Estado</label><input type='text' name='codigo' disabled='disabled' value='"+ESTADO+"'></>");
                    out.println("<label>Dirección Casa</label><input type='text' name='codigo' disabled='disabled' value='"+DIR_CASA+"'></>");
                    out.println("<label>Teléfono</label><input type='text' name='codigo' disabled='disabled' value='"+TELEFONO+"'></>");
                    out.println("<label>E-mail</label><input type='text' name='codigo' disabled='disabled' value='"+EMAIL+"'></>");
                    out.println("<label>Celular</label><input type='text' name='codigo' disabled='disabled' value='"+CELULAR+"'></>");
                    out.println("<label>Eps</label><input type='text' name='codigo' disabled='disabled' value='"+EPS+"'></>");
                    out.println("<label>RH</label><input type='text' name='codigo' disabled='disabled' value='"+DESC_RH+"'></>");
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
                    out.println("</form>");
                    
                    out.println("</div>");                    
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");                   
                    out.println("</div>");                
                    
                   
                    out.println("<label>Tipo Usuario</label><input type='text' name='codigo' disabled='disabled' value='"+TIPO_PERSONA+"'></>");
                    out.println("<label>Genero</label><input type='text' name='codigo' disabled='disabled' value='"+GENERO+"'></>");
                    out.println("<label>Estado Civil</label><input type='text' name='codigo' disabled='disabled' value='"+ESTADO_CIVIL+"'></>");
                    out.println("<label>Centro de Costo</label><input type='text' name='codigo' disabled='disabled' value='"+CENTRO_DE_COSTO+"'></>");
                    out.println("<label>Tipo de Puesto</label><input type='text' name='codigo' disabled='disabled' value='"+TIPO_DE_PUESTO+"'></>");
                    out.println("<label>Dedicación</label><input type='text' name='codigo' disabled='disabled' value='"+DEDICACION+"'></>");
                    out.println("<label>Estudios</label><input type='text' name='codigo' disabled='disabled' value='"+ESTUDIOS+"'></>");
                    out.println("<label>Codigo Ciudad</label><input type='text' name='codigo' disabled='disabled' value='"+CODIGO_CIUDAD_DE_NACIMIENTO+"'></>");
                    out.println("<label>Ciudad de Nacimiento</label><input type='text' name='codigo' disabled='disabled' value='"+CIUDAD_DE_NACIMIENTO+"'></>");
                    out.println("<label>Identificación</label><input type='text' name='codigo' disabled='disabled' value='"+IDENTIFICACION+"'></>");
                    out.println("<label>Cargo</label><input type='text' name='codigo' disabled='disabled' value='"+CARGO+"'></>");
                    out.println("<label>Apellidos</label><input type='text' name='codigo' disabled='disabled' value='"+APELLIDOS+"'></>");
                    out.println("<label>Nombres</label><input type='text' name='codigo' disabled='disabled' value='"+NOMBRES+"'></>");
                    out.println("<label>Fecha de Nacimiento</label><input type='text' name='codigo' disabled='disabled' value='"+FECHA_NACIMIENTO+"'></>");
                    out.println("<label>Titulo</label><input type='text' name='codigo' disabled='disabled' value='"+TITULO+"'></>");
                    out.println("<label>Estado</label><input type='text' name='codigo' disabled='disabled' value='"+ESTADO+"'></>");
                    out.println("<label>Dir. Casa</label><input type='text' name='codigo' disabled='disabled' value='"+DIR_CASA+"'></>");
                    out.println("<label>Tel. Casa</label><input type='text' name='codigo' disabled='disabled' value='"+TEL_CASA+"'></>");
                    out.println("<label>Tel. Oficina</label><input type='text' name='codigo' disabled='disabled' value='"+TEL_OFICINA+"'></>");
                    out.println("<label>E-mail</label><input type='text' name='codigo' disabled='disabled' value='"+EMAIL+"'></>");
               
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
</html>