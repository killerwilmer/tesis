<%@page import="javax.swing.GroupLayout.Alignment"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Paragraph"%>
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
<%@page session="true" %>

<%
    HttpSession sesionOk = request.getSession();

    Vector idprograma = (Vector) sesionOk.getAttribute("idpro");
    Vector idfacultad = (Vector) sesionOk.getAttribute("idfacul");
    Vector nombreprograma = (Vector) sesionOk.getAttribute("nombreprograma");
    Vector codigo = (Vector) sesionOk.getAttribute("codigo");
%>

<%

    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition"," attachment; filename=\"Informe.pdf\"");

    Document document = new Document();

    ByteArrayOutputStream buffer = new ByteArrayOutputStream();

    PdfWriter.getInstance(document, response.getOutputStream());

    document.open(); // de aqui para abajo se forma el documento

    char sep = File.separatorChar;
    String miRuta = config.getServletContext().getRealPath("/") + "img" + sep + "umariana.jpg";

    Image imagen = Image.getInstance(miRuta);//este es para la imagen del logo
    imagen.scaleToFit(70, 70);
    imagen.setAlignment(Image.LEFT);

    Paragraph titulo = new Paragraph("Reporte de Prueba");//titulo
    Paragraph espacio = new Paragraph("                     ");//espacio
    titulo.setAlignment(Element.ALIGN_CENTER);//para centrar el titulo

    PdfPTable table = new PdfPTable(5);
    table.setWidthPercentage(100);
    table.setHorizontalAlignment(Element.ALIGN_CENTER);

    PdfPCell cell = new PdfPCell(new Paragraph("Programas"));
    cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
    cell.setColspan(5);
    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell.setPadding(10.0f);
    table.addCell(cell);

    PdfPCell cel1 = new PdfPCell(new Paragraph("Codigo"));
    PdfPCell cel2 = new PdfPCell(new Paragraph("Nombre Programa"));
    PdfPCell cel3 = new PdfPCell(new Paragraph("idPrograma"));
    PdfPCell cel4 = new PdfPCell(new Paragraph("IdFacultad"));
    PdfPCell cel5 = new PdfPCell(new Paragraph("Codigo Programa"));

    cel1.setBackgroundColor(BaseColor.PINK);
    cel2.setBackgroundColor(BaseColor.PINK);
    cel3.setBackgroundColor(BaseColor.PINK);
    cel4.setBackgroundColor(BaseColor.PINK);
    cel5.setBackgroundColor(BaseColor.PINK);

    cel1.setHorizontalAlignment(Element.ALIGN_CENTER);
    cel2.setHorizontalAlignment(Element.ALIGN_CENTER);
    cel3.setHorizontalAlignment(Element.ALIGN_CENTER);
    cel4.setHorizontalAlignment(Element.ALIGN_CENTER);
    cel5.setHorizontalAlignment(Element.ALIGN_CENTER);

    table.addCell(cel1);
    table.addCell(cel2);
    table.addCell(cel3);
    table.addCell(cel4);
    table.addCell(cel5);

    for (int i = 0; i < codigo.size(); i++) {
        Object miCodigo = codigo.elementAt(i);
        Object miidprograma = idprograma.elementAt(i);
        Object miidfacultad = idfacultad.elementAt(i);
        Object miCodprograma = nombreprograma.elementAt(i);

        table.addCell("" + (i + 1));
        table.addCell("" + miCodigo);
        table.addCell("" + miidprograma);
        table.addCell("" + miidfacultad);
        table.addCell("" + miCodprograma);
    }

    //de aqui para abajo agregamos lo que queremos
    document.add(imagen);
    document.add(titulo);
    document.add(espacio);
    document.add(table);


    document.close();

    DataOutput output = new DataOutputStream(response.getOutputStream());

    byte[] bytes = buffer.toByteArray();

    response.setContentLength(bytes.length);

    for (int i = 0; i < bytes.length; i++) {
        output.writeByte(bytes[i]);
    }

%>