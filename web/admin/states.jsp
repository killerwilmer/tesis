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
    String str = request.getParameter("q");
    response.setHeader("Content-Type", "text/html");
    try {
        String sql = "select nombres, apellidos, idusuario, idtipousuario from usuario where (lower(nombres) LIKE '%" + str.toLowerCase() + "%' or lower(apellidos) LIKE '%" + str.toLowerCase() + "%') and idtipousuario=2 LIMIT 10";
        //System.out.print(sql);
        ResultSet rs = control.consultas(sql);
        while (rs.next()) {
            out.print(rs.getString("nombres").trim() + " " + rs.getString("apellidos").trim() +"|"+ rs.getString("idusuario").trim() + "\n");
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>
