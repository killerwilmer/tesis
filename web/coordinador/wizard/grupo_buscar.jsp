<%@ page language="java" import="java.sql.*" %>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page language="java" import="java.util.Enumeration" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>
<% ConectaDb control = new ConectaDb();
    HttpSession sesionOk = request.getSession();
    String idProgram = (String) sesionOk.getAttribute("idp");
%>

<% response.setContentType("text/html");%>

<%
    String str = request.getParameter("q");
    response.setHeader("Content-Type", "text/html");
    try {
        String sql = "select idgrupoinvestigacion, nombregrupoinvestigacion from grupoinvestigacion where (lower(nombregrupoinvestigacion) LIKE '%" + str.toLowerCase() + "%') and idprograma='"+idProgram+"' LIMIT 10";
        //out.print("<script languaje = javascript>alert('"+sql+"');</script>");
        ResultSet rs = control.consultas(sql);
        while (rs.next()) {
            out.print(rs.getString("nombregrupoinvestigacion").trim() +"|"+ rs.getString("idgrupoinvestigacion").trim() + "\n");
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>
