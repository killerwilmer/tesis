/*
 PLUGIN JQUERY DWDINANEWS
 ======================
 By DesarrolloWeb.com
 Miguel Angel Alvarez Sánchez
 
 DESCRIPCIÓN: Sencillo plugin para hacer una presentación de novedades dinámica en un espacio reducido,
 lo que se conoce como ticker de noticias.
 
 LICENCIA: Open source under the BSD License.
 Puedes utilizar este script para los usos que desees, incluso comercialmente.
 Se agradece el reconocimiento con un enlace a www.desarrolloweb.com
 
 USO: Para usar el plugin debes crear un contenedor y dentro una lista <UL> con tantos <LI> como desees
 Debes llamar al plugin con el contenedor donde hayas colocado la lista
 $("#contenedor").dwdinanews();
 
 OPCIONES PERMITIDAS: Al invocar al plugin puedes pasar un objeto de opciones
 retardo: el tiempo que pasa entre visualización de una noticia y otra
 tiempoAnimacion: el tiempo que se ocupa en la animación al pasar de una noticia a otra
 funcionAnimacion: la función a utilizar para la animación entre noticias
 
 DEPENDENCIAS: El plugin hace uso de otro plugin jQuery llamado "jQuery Timer"
 Página del plugin: http://plugins.jquery.com/project/Timer
 Explicación del plugin timer: http://www.desarrolloweb.com/articulos/plugin-jquery-timer.html
 
 DEPENDENCIA OPCIONAL: Si lo deseas puedes usar el plugin "jQuery Easing" para especificar cualquier función de animación de las que implementa
 Página del plugin: http://gsgd.co.uk/sandbox/jquery/easing/
 Explicación del plugin Easing: http://www.desarrolloweb.com/articulos/plugin-efectos-jquery-easing.html
 
 Espero que lo puedas aprovechar, para aprender o para tu web.
 
 Miguel Angel Alvarez
 DesarrolloWeb.com
*/

(function($) {
	$.fn.dwdinanews = function(opt) {
		var opciones = {
			retardo: 10000,
			tiempoAnimacion: 2000,
			funcionAnimacion: 'easeInOutQuad'
		}
		jQuery.extend(opciones, opt);
		
		this.each(function(){
			var listaNovedades = $(this).children("ul");
			var elementosLista = listaNovedades.children("li");
			var elementoActual = 0;
			$.timer(opciones.retardo, function(timer){
				elementoActual =  (elementoActual + 1) % elementosLista.length;
				listaNovedades.animate({
					top: "-" + $(elementosLista[elementoActual]).position().top + "px"
				}, opciones.tiempoAnimacion, opciones.funcionAnimacion)
				
			});
		});
		return this;
	};
})(jQuery);