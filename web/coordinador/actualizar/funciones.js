/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**********************************************
 *Funcion para actualizar una etapa
 **********************************************/
var y;
y=$(document);
y.ready(inicializarEventosy);

function inicializarEventosy()
{
    var y;
    y=$("#enviar");
    y.click(presionSubmity);
}

function presionSubmity()
{
    var i=$("#idetapa").attr("value");
    var h=$("#nometapa").attr("value");
    $.get("actualizar/actualizaretapa.jsp",{
        num:i,
        idf:h      
    },llegadaDatos); 
    return false;
}

/*******************************************************
 *Actualizar proyecto
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
    var rr=radiomarcado(grupo);
    var idp=$("#idp").attr("value");
    var b=$("#titulop").attr("value");
    var c=$("#tituloabreviado").attr("value");
    var d=$("#institucion").attr("value");
    var dd=$("#idinstitucion").attr("value");
    var e=$("#comboestado").attr("value");
    //var f=$("#descripcion").attr("value");
    var g=$("#datepicker").attr("value");
    var h=$("#tipo").attr("value");

    $.get("actualizar/actualizarproyecto.jsp",{
        idpro:idp,
        titulo:b,
        titucorto:c,
        institu:d,
        idinstitu:dd,
        estado:e,
        //descripcion:f,
        fecha:g,
        tipo:h,
        activo:rr
    },llegadaDatos); 
    return false;
    
}

/**********************************************
 *Funcion para desvincular estudiante
 **********************************************/
            
var yy;
yy=$(document);
yy.ready(inicializarEventose);
//var rowID=null;
            
function inicializarEventose()
{
    var y;
    y=$(".deletes2");
    y.click(presionSubmite);
}
            
function presionSubmite()
{  
    $('#example1 tbody tr a.deletes2 img').live( 'click', function (e) {
        rowID = $(this).parent().attr('id');
        // $("#wraper").load('actualizar/formularioActores.jsp?rowID=' + rowID);
        //$("#result_id").html( "<input type=\"text\" id=\"idu\" value=\""+rowID+"\"/>");
        //idi = $("#idu").val();
        //var h=$("#idu").attr("value");
        //alert(idi);
        $.get("actualizar/desvincularIntegrante.jsp",{
            idf:rowID
        },llegadaDatosEs); 
        return false;
    });
}

/**********************************************
 *Funcion para desvincular Jurados
 **********************************************/
            
var yyy;
yyy=$(document);
yyy.ready(inicializarEventosj);
//var rowID=null;
            
function inicializarEventosj()
{
    var y;
    y=$(".deletes3");
    y.click(presionSubmitj);
}
            
function presionSubmitj()
{  
    $('#example2 tbody tr a.deletes3 img').live( 'click', function (e) {
        rowID = $(this).parent().attr('id');
        $.get("actualizar/desvincularJurados.jsp",{
            idj:rowID
        },llegadaDatosJu); 
        return false;
    });
}

/**********************************************
 *Funcion para desvincular Asesor
 **********************************************/
            
var yyyy;
yyyy=$(document);
yyyy.ready(inicializarEventosas);
//var rowID=null;
            
function inicializarEventosas()
{
    var y;
    y=$(".deletes4");
    y.click(presionSubmitas);
}
            
function presionSubmitas()
{  
    $('#example3 tbody tr a.deletes4 img').live( 'click', function (e) {
        rowID = $(this).parent().attr('id');
        $.get("actualizar/desvincularAsesor.jsp",{
            idas:rowID
        },llegadaDatosas); 
        return false;
    });
}

/**********************************************
 *Funcion para actualizar grupo investigacion
 **********************************************/

var y1;
y1=$(document);
y1.ready(inicializarEventosgp);

function inicializarEventosgp()
{
    var y;
    y=$("#enviar1");
    y.click(presionSubmitgp);
}

function presionSubmitgp()
{
    var ig=$("#idgrupo").attr("value");
    var ng=$("#grup").attr("value");
    $.get("actualizar/actualizargrupo.jsp",{
        idgrup:ig,
        nomgrup:ng      
    },llegadaDatos); 
    return false;
}


/********************************************************
 *Funcion para desvincular Integrante grupo Investigacion
 ********************************************************/
            
var zzzzint;
zzzzint=$(document);
zzzzint.ready(inicializarEventointe);
//var rowID=null;
            
function inicializarEventointe()
{
    var yint;
    yint=$(".deletes10");
    yint.click(presionSubmitinte);
}
            
function presionSubmitinte()
{  
    $('#example22 tbody tr a.deletes10 img').live( 'click', function (e) {
        rowI = $(this).parent().attr('id');
        $.get("actualizar/desvincularIntegrantesGrupo.jsp",{
            idain:rowI        
        },llegadaDatosintegra); 
        return false;
    });
}


/**********************************************
 *Funcion para actualizar una campo
 **********************************************/
var yc;
yc=$(document);
yc.ready(inicializarEventoscampo);

function inicializarEventoscampo()
{
    var ycam;
    ycam=$("#boton_actualizarcampo");
    ycam.click(presionSubmitcampo);
}

function presionSubmitcampo()
{
    var idcampoi=$("#idcampo").attr("value");
    var ic=$("#nombrecampo").attr("value");
    var hc=$("#descricioncampo").attr("value");
    //alert(hc);
    $.get("actualizar/actualizarcampo.jsp",{
        idcampoinv:idcampoi,
        nomcampo:ic,
        descampo:hc      
    },llegadaDatosCampo); 
    return false;
}

/**********************************************
 *Funcion para actualizar una Linea
 **********************************************/
var yl;
yl=$(document);
yl.ready(inicializarEventoslinea);

function inicializarEventoslinea()
{
    var ylin;
    ylin=$("#boton_actualizarlinea");
    ylin.click(presionSubmitlinea);
}

function presionSubmitlinea()
{
    var idlineas=$("#idlinea").attr("value");
    var hl=$("#nombrelinea").attr("value");
    //alert(hc);
    $.get("actualizar/actualizarlinea.jsp",{
        idlinea:idlineas,
        deslinea:hl      
    },llegadaDatos); 
    return false;
}

/**********************************************
 *Funcion para actualizar una SubLinea
 **********************************************/
var ys;
ys=$(document);
ys.ready(inicializarEventossublinea);

function inicializarEventossublinea()
{
    var yslin;
    yslin=$("#boton_actualizarsublinea");
    yslin.click(presionSubmitsublinea);
}

function presionSubmitsublinea()
{
    var idcomblineactualizar=$("#combolineaactualizar").attr("value");
    var idsublineas=$("#idsublinea").attr("value");
    var hs=$("#nombresublinea").attr("value");
    
    $.get("actualizar/actualizarsublinea.jsp",{
        idlineactualizar:idcomblineactualizar,
        idsublinea:idsublineas,
        desublinea:hs      
    },llegadaDatos); 
    return false;
}

/**********************************************
 *Funcion para eliminar sublinea
 **********************************************/
            
var yel;
yel=$(document);
yel.ready(inicializarEventosel);
//var rowID=null;
            
function inicializarEventosel()
{
    var yel;
    yel=$(".deletesublineaeliminar");
    yel.click(presionSubmitel);
}
            
function presionSubmitel()
{  
    $('#examplesublinea tbody tr a.deletesublineaeliminar img').live( 'click', function (e) {
        rowIDES = $(this).parent().attr('id');
        $.get("actualizar/eliminarsublinea.jsp",{
            ideliminarsublinea:rowIDES
        },llegadaDatos); 
        return false;
    });
}

/************************************************
 *Funcion para eliminar indicadores de un aspecto
 ************************************************/
            
var yin;
yin=$(document);
yin.ready(inicializarEventoseindi);
//var rowID=null;
            
function inicializarEventoseindi()
{
    var yin;
    yin=$(".deletesindicador");
    yin.click(presionSubmitindi);
}
            
function presionSubmitindi()
{  
    $('#exampleeliindi tbody tr a.deletesindicador img').live( 'click', function (e) {
        rowIDESIND = $(this).parent().attr('id');
        $.get("actualizar/eliminarindicador.jsp",{
            ideliminarindi:rowIDESIND
        },llegadaDatos); 
        return false;
    });
}

/**********************************************
 *Funcion para actualizar un Aspecto
 **********************************************/
var yas;
yas=$(document);
yas.ready(inicializarEventosaspec);

function inicializarEventosaspec()
{
    var yas;
    yas=$("#boton_actualizaraspecto");
    yas.click(presionSubmitaspec);
}

function presionSubmitaspec()
{
    var idcomasp=$("#comboetapaactualizar").attr("value");
    var idasp=$("#idaspect").attr("value");
    var hasp=$("#nombreaspectos").attr("value");
    
    $.get("actualizar/actualizaraspecto.jsp",{
        idaspactualizar:idcomasp,
        idas:idasp,
        desasp:hasp      
    },llegadaDatos); 
    return false;
}


/***********************************************************************/

function llegadaDatosintegra(datos)
{
    $("#resultados_i").html(datos);
}
            
function llegadaDatosEs(datos)
{
    $("#resultados_estu").html(datos);
}

function llegadaDatosJu(datos)
{
    $("#resultados_jura").html(datos);
}

function llegadaDatosas(datos)
{
    $("#resultados_ases").html(datos);
}

function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}

function llegadaDatosCampo(datos)
{
	$("#resultadoscampos").html(datos);
}



