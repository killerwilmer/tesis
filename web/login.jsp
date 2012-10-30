 <%@ page session="true" %>
 <%@page import="com.umariana.control.ConectaDb" %>
 <% ConectaDb control = new ConectaDb(); %>
 
<%
String usuario = "";
String clave = "";
//recibimos el parametro codigo
if ( request.getParameter("usuario").trim() != null && request.getParameter("usuario").trim() != "" )
    {
        usuario = request.getParameter("usuario");
    }
else
    {
        %>
            <jsp:forward page="index.jsp">
            <jsp:param name="error" value="Favor digitar el nombre de usuario."/>
            </jsp:forward>
        <%
    }

//recibimos el parametro clave
if ( request.getParameter("password").trim() != null && request.getParameter("password").trim() != "" )
    {
        clave = request.getParameter("password");
    }
else
    {
        %>
            <jsp:forward page="index.jsp">
            <jsp:param name="error" value="Favor digitar la contraseña."/>
            </jsp:forward>
        <%
    }

//comprovar usuario y contraseña
String sql = "select codigousuario, contrasena from usuario where codigousuario='"+ usuario +"' and contrasena='"+ clave +"';";


        String ini = "select ";
        String camp = "idusuario";
        String fi = " from usuario where codigousuario='" + usuario+ "';";
        String tip = control.retornoCodigo(ini, camp, fi);//obtenemos el tipo de usurio para lo del coodinador
        
        String i = "select ";
        String c = "idusuario";
        String f = " from coordinador where idusuario='" + tip + "';";
        String t = control.retornoCodigo(i, c, f);

String SQLcoor = "select idusuario from coordinador where idusuario='" + tip + "'";

if (control.iden(sql))
{
    HttpSession sesionOk = request.getSession();
    
    // Begin solo para el coordinador
    if (control.iden(SQLcoor)) {

        String inicio = "select ";
        String campo = "idprograma";
        String fin = " from coordinador where idusuario='" + t + "';";
        String tipos = control.retornoCodigo(inicio, campo, fin);

        int tipo = Integer.parseInt(tipos.trim());

        if(tipo>0){  
            sesionOk.setAttribute("coordinador", tipos );
            out.print("<script>window.location='coordinador/index.jsp'</script>");
        }
      
    }
    // End

    String inicio = "select ";
    String campo = "codigotipousuario";
    String fin = " from tipousuario,usuario where tipousuario.idtipousuario=usuario.idtipousuario and codigousuario='"+usuario+"';";
    String tipos = control.retornoCodigo(inicio, campo, fin);
    
    int tipo = Integer.parseInt(tipos.trim());
    if (tipo == 1)
    {
        sesionOk.setAttribute("estudiante", usuario);
        out.print("<script>window.location='estudiantes/index.jsp'</script>");
    }
    else if (tipo == 2)
    {
        sesionOk.setAttribute("docente", usuario);
        out.print("<script>window.location='docentes/index.jsp'</script>");
    }
    
    else if (tipo == 4)
    {
        sesionOk.setAttribute("administrador", usuario);
        out.print("<script>window.location='admin/index.jsp'</script>");
    }
}

else
{
        %>
            <jsp:forward page="index.jsp">
                <jsp:param name="error" value="Usuario y/o clave incorrectos.<br>Vuelve a intentarlo."/>
            </jsp:forward>
        <%
}
%>