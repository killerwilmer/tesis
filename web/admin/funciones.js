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
    $.get("insertar.jsp",{
        numero:v,
        codigof:c
    },llegadaDatos); 
    return false;
}

//////////////////Agregar Programa////////////////////////

var p;
p=$(document);
p.ready(inicializarEventosp);

function inicializarEventosp()
{
    var x;
    x=$("#btn1");
    x.click(presionSubmitp);
}

function presionSubmitp()
{
    var v=$("#combofacultades").attr("value");
    var c=$("#codigoprograma").attr("value");
    var p=$("#programa").attr("value");
    $.get("insertarprograma.jsp",{
        combo:v,
        codigop:c,
        nomp:p
    },llegadaDatos); 
    return false;
}


//////////////////Agregar Usuario////////////////////////

var u;
u=$(document);
u.ready(inicializarEventosusu);

function inicializarEventosusu()
{
    var x;
    x=$("#boton2");
    x.click(presionSubmitusu);
}

function presionSubmitusu()
{
    var n=$("#nombre").attr("value");
    var a=$("#apellidos").attr("value");
    var i=$("#identificacion").attr("value");
    var c=$("#clave").attr("value");
    var cbtu=$("#combotusuario").attr("value");
    var g=$("#genero").attr("value");
    var cf=$("#codfacultad").attr("value");
    var nf=$("#nomfacultad").attr("value");
    var cp=$("#codprograma").attr("value");
    var np=$("#nomprograma").attr("value");
    var cc=$("#codciudad").attr("value");
    var nc=$("#nomciudad").attr("value");  
    var e=$("#estadocivil").attr("value");
    var f=$("#datepicker").attr("value");  
    var d=$("#direccion").attr("value");
    var em=$("#email").attr("value");
    var cel=$("#celular").attr("value");
    var ncas=$("#numcasa").attr("value");
    var eps=$("#eps").attr("value");
    var rh=$("#rh").attr("value");
  
  
    $.get("insertarusuario.jsp",{
        nombres:n,
        apellidos:a,
        identificacion:i,
        clave:c,
        comtusu:cbtu,
        genero:g,
        codfacu:cf,
        nomfacu:nf,
        codprog:cp,
        nomprog:np,
        codciudad:cc,
        nomciudad:nc,
        estcivil:e,
        fechanac:f,
        dir:d,
        email:em,
        celu:cel,
        numcasa:ncas, 
        ep:eps, 
        trh:rh
    },llegadaDatos); 
    return false;
}



function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}