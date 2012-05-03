<%@ page language="java" import="java.sql.*" %>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page language="java" import="java.util.Enumeration" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>
<% ConectaDb control = new ConectaDb();%>

<% response.setContentType("text/html");%>
<%
    String str = request.getParameter("queryString");
    String str2 = request.getParameter("email");
    System.out.print(str);
    try {
        String sql = "select nombres, apellidos, idusuario, codigousuario from usuario where idtipousuario="+ Integer.parseInt(str2)+" and lower(nombres) LIKE '%" + str.toLowerCase() + "%' LIMIT 10";
        System.out.print(sql);
        ResultSet rs = control.consultas(sql);
%>


<table align="center" class="table1">
    <thead><tr><th></th><th>Nombre(s)</th> <th>Apellido(s)</th> <th>Identificación</th></tr></thead>
    <%
        int i = 0;
        while (rs.next()) {
            out.print(control.linea(i) + "<td> <input type='checkbox' name='producto' value='" + i + "' /> </td><td>" + rs.getString("nombres") + "</td><input type='hidden' name='idPro' value=" + rs.getString("nombres") + "/><td>" + rs.getString("apellidos") + "</td><td>" + rs.getString("codigousuario") + "</td>");
            i++;
        }
    %>
</table><br><input type="submit" name="agregar" value="Agregar Carrito" align="center" id="btnenviar">
<%
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>
