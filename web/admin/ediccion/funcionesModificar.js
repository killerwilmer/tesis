/********************************************
 *Funcion para Modificar una facultad
 ********************************************/

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

/***************************************
 *Funcion para eliminar una facultad
 ***************************************/

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

/********************************************
 *Funcion para Modificar una facultad
 ********************************************/

var xp;
xp=$(document);
xp.ready(inicializarEventosp);

function inicializarEventosp()
{
    var x;
    x=$("#enviarp");
    x.click(presionSubmitp);
}

function presionSubmitp()
{
    var h=$("#idp").attr("value");
    var c=$("#codigop").attr("value");
    var vp=$("#nombrep").attr("value");
    $.get("ediccion/actualizarprograma.jsp",{
        nombre:vp,
        codigop:c,
        idpro:h
    },llegadaDatos); 
    return false;
}

/***************************************
 *Funcion para eliminar una programa
 ***************************************/

var ypr;
ypr=$(document);
ypr.ready(inicializarEventosype);

function inicializarEventosype()
{
    var y;
    y=$("#eliminarp");
    y.click(presionSubmitype);
}

function presionSubmitype()
{
    var h=$("#idp").attr("value");
    $.get("eliminar/eliminarprograma.jsp",{
        idp:h
    },llegadaDatos); 
    return false;
}

/******************************************************/

function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}




