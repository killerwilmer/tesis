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
            <jsp:param name="error" value="Favor digitar la contrase�a."/>
            </jsp:forward>
        <%
    }



String sql = "select codigousuario, contrasena from usuario where codigousuario='"+ usuario +"' and contrasena='"+ clave +"';";
if (control.iden(sql))
{
    HttpSession sesionOk = request.getSession();

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
    else if ( tipo == 2)
    {
        sesionOk.setAttribute("coordinador", usuario);
        out.print("<script>window.location='coordinador/index.jsp'</script>");
    }
    else if ( tipo == 39)
    {
        sesionOk.setAttribute("docente", usuario);
        out.print("<script>window.location='principales/indexge.jsp'</script>");
    }
    else if ( tipo == 4)
    {
        sesionOk.setAttribute("otro", usuario);
        out.print("<script>window.location='principales/indexge.jsp'</script>");
    }
    else if ( tipo == 3)
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
