/**
 *Funcion para Modificar una facultad
 **/

var x;
x=$(document);
x.ready(inicializarEventos);

function inicializarEventos()
{
    var x;
    x=$("#enviar");
    x.click(presionSubmit);
}

function presionSubmit()
{
    var v=$("#facultad1").attr("value");
    var c=$("#codigo").attr("value");
    var h=$("#idf").attr("value");
    $.get("ediccion/actualizarfacultad.jsp",{
        numero:v,
        codigof:c,
        idf:h
    },llegadaDatos); 
    return false;
}

/**
 *Funcion para eliminar una facultad
 **/

var y;
y=$(document);
y.ready(inicializarEventosy);

function inicializarEventosy()
{
    var y;
    y=$("#eliminar");
    y.click(presionSubmity);
}

function presionSubmity()
{
    var h=$("#idf").attr("value");
    $.get("eliminar/eliminarfacultad.jsp",{
        idf:h
    },llegadaDatos); 
    return false;
}


function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}




