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
    var f=$("#descripcion").attr("value");
    var g=$("#datepicker").attr("value");
    var h=$("#tipo").attr("value");

    $.get("actualizar/actualizarproyecto.jsp",{
        idpro:idp,
        titulo:b,
        titucorto:c,
        institu:d,
        idinstitu:dd,
        estado:e,
        descripcion:f,
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
            
var zzzz;
zzzz=$(document);
zzzz.ready(inicializarEventointe);
//var rowID=null;
            
function inicializarEventointe()
{
    var y;
    y=$(".deletes10");
    y.click(presionSubmitinte);
}
            
function presionSubmitinte()
{  
    $('#example22 tbody tr a.deletes10 img').live( 'click', function (e) {
        rowID = $(this).parent().attr('id');
        $.get("actualizar/desvincularIntegrantesGrupo.jsp",{
            idain:rowID
           
        },llegadaDatosinte); 
        return false;
    });
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

function llegadaDatosinte()
{
    ("#resultados_inte").html(datos);
}

function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}


