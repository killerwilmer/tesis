/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**********************************************
 *Funcion para actualizar un Indicadores
 **********************************************/
var yasi;
yasi=$(document);
yasi.ready(inicializarEventosaspec);

function inicializarEventosaspec()
{
    var yasi;
    yasi=$("#boton_actualizarindicador");
    yasi.click(presionSubm);
}

function presionSubm()
{
    var idco=$("#comboaspecto").attr("value");
    var idas=$("#idindi").attr("value");
    var has=$("#nombreindicador").attr("value");
    
    $.get("actualizar/actualizaraindicador.jsp",{
        idaspactualiz:idco,
        ida:idas,
        desa:has      
    },llegadaD); 
    return false;
}

function llegadaD(datos)
{
	$("#resultados").html(datos);
}


