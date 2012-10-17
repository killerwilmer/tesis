<%-- 
    Document   : imprimir
    Created on : 07-oct-2012, 7:49:35
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.GroupLayout.Alignment"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="java.io.DataOutput"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.Color"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>
<%@page import="com.itextpdf.text.BaseColor"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.umariana.control.ConectaDb" %>
<!DOCTYPE html>

<%
        HttpSession sesionOk = request.getSession();
        
        String pro = (String) sesionOk.getAttribute("nombre");

        Vector columna1 = (Vector) sesionOk.getAttribute("idpro");
        Vector columna2 = (Vector) sesionOk.getAttribute("titulo");
        Vector columna3 = (Vector) sesionOk.getAttribute("etapa");
        Vector columna4 = (Vector) sesionOk.getAttribute("fechainicio");
        Vector columna5 = (Vector) sesionOk.getAttribute("estados");
        Vector columna6 = (Vector) sesionOk.getAttribute("integrantes");
        Vector columna7 = (Vector) sesionOk.getAttribute("jurados");
        Vector columna8 = (Vector) sesionOk.getAttribute("asesores");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            response.setContentType("application/pdf");
            
            Document document = new Document();

            ByteArrayOutputStream buffer = new ByteArrayOutputStream();

            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

            document.open(); // de aqui para abajo se forma el documento
            
            Image imagen = Image.getInstance(("umariana1.jpg"));
            imagen.scaleToFit(70, 70);
            imagen.setAlignment(Image.LEFT);
            
            Chunk c;
            c = new Chunk("                                                                              "
                     + "", FontFactory.getFont(FontFactory.HELVETICA, 24));
            c.setUnderline(BaseColor.BLACK, 0.0f, -0.30f, 0.0f, -0.2f, PdfContentByte.LINE_JOIN_ROUND);
   
            Paragraph titulo = new Paragraph("Proyectos de Investigación");//titulo
            Paragraph espacio = new Paragraph("                     ");//espacio
            titulo.setAlignment(Element.ALIGN_CENTER);//para centrar el titulo
            
            PdfPTable table=new PdfPTable(9);
            table.setWidthPercentage(100);
            table.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell cell = new PdfPCell (new Paragraph (pro.toUpperCase()));
            cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cell.setColspan (9);
            cell.setHorizontalAlignment (Element.ALIGN_CENTER);
            cell.setPadding (10.0f);
            table.addCell (cell);
            
            PdfPCell cel1 = new PdfPCell (new Paragraph ("Codigo"));
            PdfPCell cel2 = new PdfPCell (new Paragraph ("Id"));
            PdfPCell cel3 = new PdfPCell (new Paragraph ("Titúlo"));
            PdfPCell cel4 = new PdfPCell (new Paragraph ("Etapa Actual"));
            PdfPCell cel5 = new PdfPCell (new Paragraph ("Fecha Inicio"));
            PdfPCell cel6 = new PdfPCell (new Paragraph ("Estado"));
            PdfPCell cel7 = new PdfPCell (new Paragraph ("Integrantes"));
            PdfPCell cel8 = new PdfPCell (new Paragraph ("Jurado(s)"));
            PdfPCell cel9 = new PdfPCell (new Paragraph ("Asesor(@)"));
            
            cel1.setBackgroundColor(BaseColor.PINK);
            cel2.setBackgroundColor(BaseColor.PINK);
            cel3.setBackgroundColor(BaseColor.PINK);
            cel4.setBackgroundColor(BaseColor.PINK);
            cel5.setBackgroundColor(BaseColor.PINK);
            cel6.setBackgroundColor(BaseColor.PINK);
            cel7.setBackgroundColor(BaseColor.PINK);
            cel8.setBackgroundColor(BaseColor.PINK);
            cel9.setBackgroundColor(BaseColor.PINK);
            
            cel1.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel2.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel3.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel4.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel5.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel6.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel7.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel8.setHorizontalAlignment (Element.ALIGN_CENTER);
            cel9.setHorizontalAlignment (Element.ALIGN_CENTER);
            
            table.addCell(cel1);
            table.addCell(cel2);
            table.addCell(cel3);
            table.addCell(cel4);
            table.addCell(cel5);
            table.addCell(cel6);
            table.addCell(cel7);
            table.addCell(cel8);
            table.addCell(cel9);
            
                for (int i = 0; i < columna1.size(); i++)
                {
                    Object miCodigo = columna1.elementAt(i);
                    Object mititulo = columna2.elementAt(i);
                    Object mietapa = columna3.elementAt(i);
                    Object mifecha = columna4.elementAt(i);
                    Object miestado = columna5.elementAt(i);
                    Object misintegrantes = columna6.elementAt(i);
                    Object misjurados = columna7.elementAt(i);
                    Object misasesores = columna8.elementAt(i);
 
                    table.addCell(""+(i+1));
                    table.addCell(""+miCodigo);
                    table.addCell(""+mititulo);
                    table.addCell(""+mietapa);
                    table.addCell(""+mifecha);
                    table.addCell(""+miestado);
                    table.addCell(""+misintegrantes);
                    table.addCell(""+misjurados);
                    table.addCell(""+misasesores);
                }
            
            //de aqui para abajo agregamos lo que queremos
            document.add(imagen);
            document.add(c);
            document.add(espacio);
            document.add(titulo);
            document.add(espacio);
            document.add(table);


            document.close ();

            DataOutput output = new DataOutputStream (response.getOutputStream ());

            byte [] bytes = buffer.toByteArray ();

            response.setContentLength (bytes.length);

            for(int i = 0; i <bytes.length; i ++)
            {
                output.writeByte (bytes [i]);
            }
                  
%>
    </body>
</html>
