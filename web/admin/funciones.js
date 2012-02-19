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
  $.get("insertar.jsp",{numero:v},llegadaDatos); 
  return false;
}

function llegadaDatos(datos)
{

	$("#resultados").html(datos);
	//alert("hola " + datos)
}