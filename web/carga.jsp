<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>JQuery Ajax</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".boton").click(function(event) {
			  $("#caja").load('prueba.jsp',aviso());
                          $.getScript('js/b.js');
	});
});
function aviso(){
	alert('La solicitud ha sido procesada');
}
</script>
</head>
<body>
<p><input name="bt1" type="button" value="CARGA CONTENIDO" class="boton"/></p>
<div id="caja" style="padding:5px;border:1px solid #CCC;">
</div>
</body>
</html>
