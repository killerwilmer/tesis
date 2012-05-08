/*registro proyecto */

var x;
x=$(document);
x.ready(inicializarEventos);

function inicializarEventos()
{
    var x;
    x=$("#enviarproyecto");
    x.click(presionSubmit);
}

function presionSubmit()
{
    var b=$("#titulop").attr("value");
    var c=$("#tituloabreviado").attr("value");
    var d=$("#institucion").attr("value");
    var e=$("#comboestado").attr("value");
    var f=$("#descripcion").attr("value");
    var g=$("#datepicker").attr("value");
    var h=$("#tipo").attr("value");
    var i=$("#activo").attr("value");

    $.get("addproyecto.jsp",{
        titulo:b,
        titucorto:c,
        institu:d,
        estado:e,
        descripcion:f,
        fecha:g,
        tipo:h,
        activo:i
    },llegadaDatos); 
    return false;
}

/*registro etapa */

var z;
z=$(document);
z.ready(inicializarEventosetapa);

function inicializarEventosetapa()
{
    var x;
    x=$("#enviar");
    x.click(presionSubmitetapa);
}

function presionSubmitetapa()
{
    var aa=$("#etapa").attr("value");
    var bb=$("#comboprograma").attr("value");

    $.get("addetapa.jsp",{
        nombre:aa,
        idprograma:bb
    },llegadaDatos); 
    return false;
}



function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}