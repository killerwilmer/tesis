/**
 * Win7 Style Buttons - for mootools 1.2.2
 * @author    Eduardo D. Sada - http://www.coders.me/web-html-js-css/javascript/mootools/botones-con-efecto-windows-7-con-js-css
 * @date      21-Sep-2009
 * @copyright (c) 2009 Eduardo D. Sada (www.coders.me)
 * @license   MIT - http://es.wikipedia.org/wiki/Licencia_MIT
*/

window.addEvent('domready', function() {

    if (Browser.Engine.trident4) {
      try { document.execCommand("BackgroundImageCache", false, true); }
      catch(err) {}
    }

    $$('.win7 a').each(function(el) {
      
      el.win7BG = new Element('div', {'styles':{'opacity':0}}).injectBefore(el);
      el.win7BG.set('morph', {'duration':300});
    
      el.addEvent('mousemove', function (ev) {
        el.win7BG.setStyle('background-position', - ((600/2) - (ev.event.layerX||ev.event.offsetX||0))+'px top');
      });

      el.addEvent('mouseenter', function (ev) {
        el.win7BG.morph({'opacity': 1});
      });

      el.addEvent('mouseout', function (ev) {
        el.win7BG.morph({'opacity': 0});
      });

    });
    
});