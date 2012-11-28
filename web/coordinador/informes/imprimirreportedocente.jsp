<%-- 
    Document   : imprimirreportedocente
    Created on : 28/11/2012, 12:12:05 AM
    Author     : Alex
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
<%@ page session="true" %>
<!DOCTYPE html>
<%
    String idSe = "";
    String pro="";
    Vector columna1 =new Vector();
    Vector columna2 =new Vector();
    Vector columna3 =new Vector();
    Vector columna4 =new Vector();
    Vector columna5 =new Vector();
    Vector columna6 =new Vector();
    Vector columna7 =new Vector();
    Vector columna8 =new Vector();
    HttpSession sesionOk = request.getSession();
        
    if (sesionOk.getAttribute("coordinador") == null) {
%> 
    <jsp:forward page="../error.jsp">
        <jsp:param name="error" value="Es Obligación Identificarse"/>
    </jsp:forward>
<%            } else {
        idSe = (String) sesionOk.getAttribute("coordinador");
        pro = (String) sesionOk.getAttribute("nombre");
        columna1 = (Vector) sesionOk.getAttribute("codusu");
        columna2 = (Vector) sesionOk.getAttribute("nomusu");
        columna3 = (Vector) sesionOk.getAttribute("apeusu");
        columna4 = (Vector) sesionOk.getAttribute("emailusu");
        columna5 = (Vector) sesionOk.getAttribute("telusu");
        columna6 = (Vector) sesionOk.getAttribute("usuj");
        columna7 = (Vector) sesionOk.getAttribute("usase");
        columna8 = (Vector) sesionOk.getAttribute("totp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition"," attachment; filename=\"Informe.pdf\"");
            
            Document document = new Document(PageSize.A4.rotate());

            ByteArrayOutputStream buffer = new ByteArrayOutputStream();

            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

            document.open(); // de aqui para abajo se forma el documento
            

            char sep = File.separatorChar;
            String miRuta = config.getServletContext().getRealPath("/") + "img" + sep + "umariana.jpg";
    
            Image imagen = Image.getInstance(miRuta);//este es para la imagen del logo
            imagen.scaleToFit(70, 70);
            imagen.setAlignment(Image.HEADER);
            
            Paragraph titulo = new Paragraph("Información Docentes");//titulo
            Paragraph espacio = new Paragraph("                     ");//espacio
            titulo.setAlignment(Element.ALIGN_CENTER);//para centrar el titulo
            
            PdfPTable table=new PdfPTable(9);
             //INICIO PARA EL ENCABEZADO
            PdfPTable table1 = new PdfPTable(6);

            table1.setWidthPercentage(100);

            PdfPCell cell11 = new PdfPCell(new Paragraph("UNIVERSIDAD MARIANA CENTRO DE INVESTIGACIONES Y PUBLICACIONES COORDINACION DE INVESTIGACION ESTUDIANTIL"));
            PdfPCell cell22 = new PdfPCell(imagen);
            PdfPCell cell33 = new PdfPCell(new Paragraph());

            cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell11.setBorder(Rectangle.NO_BORDER);
            cell22.setBorder(Rectangle.NO_BORDER);
            cell33.setBorder(Rectangle.NO_BORDER);
            cell11.setColspan(5);

            table1.addCell(cell22);
            table1.addCell(cell11);
            table1.addCell(cell33);
            table1.addCell(cell33);
            table1.addCell(cell33);
            table1.addCell(cell33);
            //fin encabezado
            table.setWidthPercentage(100);
            table.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            PdfPCell cell = new PdfPCell (new Paragraph (pro.toUpperCase()));
            cell.setBackgroundColor(BaseColor.GRAY);
            cell.setColspan (9);
            cell.setHorizontalAlignment (Element.ALIGN_CENTER);
            cell.setPadding (10.0f);
            table.addCell (cell);
            
            PdfPCell cel1 = new PdfPCell (new Paragraph ("#"));
            PdfPCell cel2 = new PdfPCell (new Paragraph ("Codigo"));
            PdfPCell cel3 = new PdfPCell (new Paragraph ("Nombres"));
            PdfPCell cel4 = new PdfPCell (new Paragraph ("Apellidos"));
            PdfPCell cel5 = new PdfPCell (new Paragraph ("E-mail"));
            PdfPCell cel6 = new PdfPCell (new Paragraph ("N° Telefónico"));
            PdfPCell cel7 = new PdfPCell (new Paragraph ("Total Jurado"));
            PdfPCell cel8 = new PdfPCell (new Paragraph ("Total Asesor"));
            PdfPCell cel9 = new PdfPCell (new Paragraph ("Total Proyectos"));
            
            cel1.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel2.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel3.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel4.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel5.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel6.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel7.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel8.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cel9.setBackgroundColor(BaseColor.LIGHT_GRAY);
            
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
                    Object minom = columna2.elementAt(i);
                    Object miape = columna3.elementAt(i);
                    Object miemail = columna4.elementAt(i);
                    Object mitel = columna5.elementAt(i);
                    Object mijurtotal = columna6.elementAt(i);
                    Object miasetotal = columna7.elementAt(i);
                    Object mistotales = columna8.elementAt(i);
 
                    table.addCell(""+(i+1));
                    table.addCell(""+miCodigo);
                    table.addCell(""+minom);
                    table.addCell(""+miape);
                    table.addCell(""+miemail);
                    table.addCell(""+mitel);
                    table.addCell(""+mijurtotal);
                    table.addCell(""+miasetotal);
                    table.addCell(""+mistotales);
                }
            
            //de aqui para abajo agregamos lo que queremos
            document.add(table1);
            //document.add(imagen);
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
