<%@page language="java" import="java.sql.*" %>
<%@page import="com.umariana.control.ConectaDb"%>
<%@page language="java" import="java.util.Enumeration" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 response.setContentType("text/html; charset=utf-8");
%>
<% ConectaDb control = new ConectaDb(); %>

<%
String str=request.getParameter("queryString");
System.out.print(str);
try {
String sql = "select nombres from usuario where lower(nombres) LIKE '%"+str.toLowerCase()+"%' LIMIT 5";
ResultSet rs = control.consultas(sql);
            
                while (rs.next())
                {
                    out.println("<li id='u' class='u' onclick='fill("+rs.getString("nombres").toLowerCase()+");'>"+rs.getString("nombres").toLowerCase()+"</li>");   
                }
                   
}catch(Exception e){
out.println("Exception is;"+e);
}
%>
