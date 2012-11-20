<%-- 
    Document   : integrante_buscar
    Created on : 19/11/2012, 04:02:56 PM
    Author     : Alex
--%>
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
        //String sql = "select idusuario, tituloproyecto from proyecto where (lower(tituloproyecto) LIKE '%" + str.toLowerCase() + "%') and esstadoproyecto=1 LIMIT 10";
        //String sql = "select nombres, apellidos, idusuario, codigousuario from usuario where idtipousuario=1 and lower(nombres) LIKE '%" + str.toLowerCase() + "%' LIMIT 10";
        String sql = "select nombres, apellidos, codigousuario, idusuario, idtipousuario from usuario, programa where (lower(nombres) LIKE '%" + str.toLowerCase() + "%' or lower(apellidos) LIKE '%" + str.toLowerCase() + "%') and programa.codigoprograma=usuario.codigoprograma and programa.idprograma='"+idProgram+"' LIMIT 10";
        //out.print("<script languaje = javascript>alert('holalala');</script>");
        ResultSet rs = control.consultas(sql);
        while (rs.next()) {
            out.print(rs.getString("nombres").trim() + " " +  rs.getString("apellidos").trim() + "|" + rs.getString("idusuario").trim() + "\n");
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>
