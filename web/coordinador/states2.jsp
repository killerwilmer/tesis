<%-- 
    Document   : states2
    Created on : 30-abr-2012, 13:02:23
    Author     : usuarui
--%>

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
    //System.out.println("1"+request.getParameterNames().nextElement());
    response.setHeader("Content-Type", "text/html");
    try {
        String sql = "select tituloproyecto from proyecto where lower(tituloproyecto) LIKE '%" + str.toLowerCase() + "%' LIMIT 10";
        //System.out.print(sql);
        ResultSet rs = control.consultas(sql);
        while (rs.next()) {
            out.print(rs.getString("tituloproyecto").trim() + "\n");
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>

