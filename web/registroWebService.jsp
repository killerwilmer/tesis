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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="form1" action="registroWebService.jsp" method="POST">
            Tipo de usuario
            <select name="tipo">
                <option>E</option>
                <option>D</option>
                <option>A</option>
            </select>
            <br>
            Capitulo: <input type="text" name="codigo" value="" />
            <br>
            <input type="submit" value="Enviar" name="enviar" />
        </form>
        
        
        <%
        String boton = request.getParameter("enviar");
        
        if (boton != null) {
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
                    CODIGO_PROGRAMA = datosEstudiantesSeparados[9];
                    PROGRAMA = datosEstudiantesSeparados[10];
                    CODIGO_FACULTAD = datosEstudiantesSeparados[11];
                    FACULTAD = datosEstudiantesSeparados[12];
                    ESTADO = datosEstudiantesSeparados[13];
                    DIR_CASA = datosEstudiantesSeparados[14];
                    TELEFONO = datosEstudiantesSeparados[15];
                    EMAIL = datosEstudiantesSeparados[16];
                    CELULAR = datosEstudiantesSeparados[17];
                    EPS = datosEstudiantesSeparados[18];
                    DESC_RH = datosEstudiantesSeparados[19];
                    

                    out.println(TIPO_PERSONA);
                    out.println(GENERO);
                    out.println(ESTADO_CIVIL);
                    out.println(CODIGO_CIUDAD);
                    out.println(NOMBRE_CIUDAD);
                    out.println(FECHA_NACIMIENTO);
                    out.println(IDENTIFICACION);
                    out.println(APELLIDOS);
                    out.println(NOMBRES);
                    out.println(CODIGO_PROGRAMA);
                    out.println(PROGRAMA);
                    out.println(CODIGO_FACULTAD);
                    out.println(FACULTAD);
                    out.println(ESTADO);
                    out.println(DIR_CASA);
                    out.println(TELEFONO);
                    out.println(EMAIL);
                    out.println(CELULAR);
                    out.println(EPS);
                    out.println(DESC_RH);
                            
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