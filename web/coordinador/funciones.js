/*******************************************************
 *registro proyecto
 *******************************************************/
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

/*******************************************************
 *registro etapas del proyecto
 *******************************************************/

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
    var bb=$("#idPrograma").attr("value");

    $.get("addetapa.jsp",{
        nombre:aa,
        idprograma:bb
    },llegadaDatos); 
    return false;
}


/*******************************************************
 *registro grupo de investigacón
 *******************************************************/

var g;
g=$(document);
g.ready(inicializarEventosGrupoInvestigacion);

function inicializarEventosGrupoInvestigacion()
{
    var gg;
    gg=$("#boton_registro");
    gg.click(presionSubmitGrupoInvestigacion);
}

function presionSubmitGrupoInvestigacion()
{
    var ng=$("#grupoinvestigacion").attr("value");
    var ip=$("#idPrograma").attr("value");

    $.get("registroGrupoInvestigacion.jsp",{
        nombreGrupo:ng,
        idprograma:ip
    },llegadaDatos); 
    return false;
}

/*******************************************************
 *registro campo de investigación
 *******************************************************/

var ca;
ca=$(document);
ca.ready(inicializarEventosCampoInvestigacion);

function inicializarEventosCampoInvestigacion()
{
    var ca;
    ca=$("#boton_registro2");
    ca.click(presionSubmitCampoInvestigacion);
}

function presionSubmitCampoInvestigacion()
{
    var nc=$("#campoinvestigacion").attr("value");
    var dc=$("#descampo").attr("value");

    $.get("registroCampoInvestigacion.jsp",{
        nombreCampo:nc,
        descampo:dc
    },llegadaDatos); 
    return false;
}

/*******************************************************
 *registro linea de investigación
 *******************************************************/

var li;
li=$(document);
li.ready(inicializarEventosLineaInvestigacion);

function inicializarEventosLineaInvestigacion()
{
    var li;
    li=$("#boton_registro3");
    li.click(presionSubmitLineaInvestigacion);
}

function presionSubmitLineaInvestigacion()
{
    var cgi=$("#combogrupoinvestigacion").attr("value");
    var cci=$("#campoinv").attr("value");
    var nli=$("#lineainvestigacion").attr("value");

    $.get("registroLineaInvestigacion.jsp",{
        coboggrupoi:cgi,
        combocampoi:cci,
        nombrelinea:nli
    },llegadaDatos); 
    return false;
}

/*******************************************************
 *registro sublinea de investigación
 *******************************************************/

var sbl;
sbl=$(document);
sbl.ready(inicializarEventosSubLineaInvestigacion);

function inicializarEventosSubLineaInvestigacion()
{
    var sl;
    sl=$("#boton_registro4");
    sl.click(presionSubmitSubLineaInvestigacion);
}

function presionSubmitSubLineaInvestigacion()
{
    var cl=$("#combolineainvestigacion").attr("value");
    var nsl=$("#sublineainvestigacion").attr("value");

    $.get("registroSublineaInvestigacion.jsp",{
        idLineaInvestigacion:cl,
        nombreSublinea:nsl
    },llegadaDatos); 
    return false;
}

/*******************************************************
 *registro aspectos e indicadores
 *******************************************************/

var ai;
ai=$(document);
ai.ready(inicializarEventosAspectosIndicadores);

function inicializarEventosAspectosIndicadores()
{
    var ai;
    ai=$("#enviar");
    ai.click(presionSubmitAspectosIndicadores);
}

function presionSubmitAspectosIndicadores()
{
    var aie=$("#comboetapas").attr("value");
    var asi=$("#aspecto").attr("value");
    var iai=$("#indicador").attr("value");

    $.get("registroAspectosIndicadores.jsp",{
        idetapas:aie,
        nomaspecto:asi,
        nomindicador:iai
    },llegadaDatos); 
    return false;
}

/*******************************************************
 *vinculación integrantes a grupos de investigación
 *******************************************************/

var xi;
xi=$(document);
xi.ready(inicializarEventosInt);

function inicializarEventosInt()
{
    var xz;
    xz=$("#boton_estu");
    xz.click(presionSubmitInt);
}

function presionSubmitInt()
{
    var codGru=$("#idGru").attr("value");
    var codInt=$("#idInt").attr("value");
    
    $.get("registra_integrante_grupo.jsp",{
        codGru:codGru,
        codInt:codInt
    },llegadaDatosInte); 
    return false;
}

function llegadaDatosInte(datos)
{
	$("#resultados_inte").html(datos);
}

function llegadaDatos(datos)
{
    $("#resultados").html(datos);
}