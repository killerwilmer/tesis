<%-- 
    Document   : addetapa
    Created on : 03-may-2012, 11:45:55
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="com.umariana.control.ConectaDb"%>
<% ConectaDb control = new ConectaDb();%>

<%
    String nometapa = request.getParameter("nombre");
    String idprogram = request.getParameter("idprograma");

    if ((nometapa.length() == 0)) {
        out.print("Digite Nombre");
    } else if ((idprogram.equals("*"))) {
        out.print("Seleccione un Programa");
    } else {
        int numero = Integer.parseInt(idprogram);
        String SQLIden = "Select nombreetapa from etapa where nombreetapa ='" + nometapa + "'";

        if (control.iden(SQLIden)) {
            out.print("Etapa ya existe");
        } else {
            String SqlInsert = "insert into etapa  (idprograma,nombreetapa)  values('" + numero + "','" + nometapa + "');";

            if (control.ejecutarOperacion(SqlInsert)) {
                out.print("Datos Insertados Correctamente");
            } else {
                out.print("Error al Insertar los Datos");
            }

        }
    }
%>
