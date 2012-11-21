/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**********************************************
 *Funcion para registrar indicadores en un aspecto
 **********************************************/
var yiaa;
yiaa=$(document);
yiaa.ready(inicializarEventosaspec);

function inicializarEventosaspec()
{
    var iaa;
    iaa=$("#boton_asignarnuevoindicador");
    iaa.click(presionSubmitasignarnuevoindicador);
}

function presionSubmitasignarnuevoindicador()
{
    var idnasp=$("#idaspect").attr("value");
    var hnasp=$("#nuevoindicador").attr("value");
    
    $.get("actualizar/registronuevoindicador.jsp",{
        idasn:idnasp,
        desaspn:hnasp      
    },llegadaDatos); 
    return false;
}

/************************************************
 *Funcion para eliminar indicadores de un aspecto
 ************************************************/
          
var yiz;
yiz=$(document);
yiz.ready(inicializarE);
//var rowID=null;
            
function inicializarE()
{
    var yiz;
    yiz=$(".deleteindieliminar");
    yiz.click(presionSu);
}
            
function presionSu()
{  
    $('#exampleind tbody tr a.deleteindieliminar img').live( 'click', function (e) {
        rowIDESIND1 = $(this).parent().attr('id');
        $.get("actualizar/eliminarindicador.jsp",{
            ideliminarindi:rowIDESIND1
        },llegadaD); 
        return false;
    });
}

function llegadaD(datos)
{
	$("#resultados").html(datos);
}



