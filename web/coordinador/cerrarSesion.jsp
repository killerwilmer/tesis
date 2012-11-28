<%-- 
    Document   : cerrarSesion
    Created on : 22/11/2012, 06:44:30 AM
    Author     : Alex
--%>

<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    out.print("<script> window.location='../index.jsp'</script>");
%>

