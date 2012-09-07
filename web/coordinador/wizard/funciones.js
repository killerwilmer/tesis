/*registro proyecto */

var x;
x=$(document);
x.ready(inicializarEventos);

function inicializarEventos()
{
    var x;
    x=$("#boton_estu");
    x.click(presionSubmit);
}

function presionSubmit()
{
    var codPro=$("#idPro").attr("value");
    var codEst=$("#idEst").attr("value");
    //alert("CodigoPro: " + codPro + " CodigoEst: " + codEst);
    
    $.get("registra_estudiante_proyecto.jsp",{
        codProy:codPro,
        codEstu:codEst
    },llegadaDatos); 
    return false;
}

function llegadaDatos(datos)
{
	$("#resultados").html(datos);
}