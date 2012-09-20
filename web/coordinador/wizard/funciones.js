/* Vincular el estudiante al proyecto */

var x;
x=$(document);
x.ready(inicializarEventosEstu);

function inicializarEventosEstu()
{
    var x;
    x=$("#boton_estu");
    x.click(presionSubmitEstu);
}

function presionSubmitEstu()
{
    var codPro=$("#idPro").attr("value");
    var codEst=$("#idEst").attr("value");
    //alert("CodigoPro: " + codPro + " CodigoEst: " + codEst);
    
    $.get("wizard/registra_estudiante_proyecto.jsp",{
        codProy:codPro,
        codEstu:codEst
    },llegadaDatosEstu); 
    return false;
}

function llegadaDatosEstu(datos)
{
	$("#resultados_estu").html(datos);
}

/* Vincular el asesor al proyecto */

var x1;
x1=$(document);
x1.ready(inicializarEventosAses);

function inicializarEventosAses()
{
    var x1;
    x1=$("#boton_ases");
    x1.click(presionSubmitAses);
}

function presionSubmitAses()
{
    var codPro=$("#idPro").attr("value");
    var idAse=$("#idAse").attr("value");
    //alert("CodigoPro: " + codPro + " CodigoEst: " + codEst);
    
    $.get("wizard/registra_asesor_proyecto.jsp",{
        codProy:codPro,
        codAses:idAse
    },llegadaDatosAses); 
    return false;
}

function llegadaDatosAses(datos)
{
	$("#resultados_ases").html(datos);
}

/* Vincular el jurado al proyecto */

var x2;
x2=$(document);
x2.ready(inicializarEventosJura);

function inicializarEventosJura()
{
    var x2;
    x2=$("#boton_jura");
    x2.click(presionSubmitJura);
}

function presionSubmitJura()
{
    var codPro=$("#idPro").attr("value");
    var idJur=$("#idJur").attr("value");
    //alert("CodigoPro: " + codPro + " CodigoEst: " + codEst);
    
    $.get("wizard/registra_jurado_proyecto.jsp",{
        codProy:codPro,
        codJura:idJur
    },llegadaDatosJura); 
    return false;
}

function llegadaDatosJura(datos)
{
	$("#resultados_jura").html(datos);
}


/* Validación campo proyecto 

var val;
val=$(document);
val.ready(validacionCampoP);

function validacionCampoP()
{
    var val;
    val=$("#next");
    val.click(presionSubmit);
}

function presionSubmit()
{
    var aa=$("#proyecto").attr("value");
   
alert(aa);
    $.get("wizard/validacionCampoProyecto.jsp",{
        nombre:aa
        
    },llegada); 
    return false;
}


function llegada(datos)
{
	$("#result").html(datos);
}*/