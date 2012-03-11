 <%@ page session="true" %>
 <%@page import="com.umariana.control.ConectaDb" %>
 <% ConectaDb control = new ConectaDb(); %>
<%
String usuario = "";
String clave = "";
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



String sql = "select usuario.codigo, usuario.contrasena from usuario where usuario.codigo='"+ usuario +"' and usuario.contrasena='"+ clave +"';";
if (control.iden(sql))
{
    HttpSession sesionOk = request.getSession();

    String inicio = "select ";
    String campo = "tipousuario.codigo";
    String fin = " from tipousuario,usuario where usuario.idtipousuario=tipousuario.idtipousuario and usuario.codigo='"+usuario+"';";
    String tipos = control.retornoCodigo(inicio, campo, fin);
    int tipo = Integer.parseInt(tipos);
    if (tipo == 1)
    {
        sesionOk.setAttribute("estudiante", usuario);
        out.print("<script>window.location='estudiantes/index.jsp'</script>");
    }
    else if ( tipo == 2)
    {
        sesionOk.setAttribute("coordinador", usuario);
        out.print("<script>window.location='coordinador/index.jsp'</script>");
    }
    else if ( tipo == 3)
    {
        sesionOk.setAttribute("docente", usuario);
        out.print("<script>window.location='principales/indexge.jsp'</script>");
    }
    else if ( tipo == 4)
    {
        sesionOk.setAttribute("otro", usuario);
        out.print("<script>window.location='principales/indexge.jsp'</script>");
    }
    else if ( tipo == 5)
    {
        sesionOk.setAttribute("admin", usuario);
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
