---
author:
  display_name: Mario Carrion
  email: mario@carrion.ws
  login: mario
  url: http://blog.mariocarrion.com/
author_email: mario@carrion.ws
author_login: mario
author_url: http://blog.mariocarrion.com/
categories: []
comments: []
date: 2006-03-11T00:43:58Z
date_gmt: 2006-03-11 04:43:58 -0500
published: true
status: publish
tags:
- espaÃ±ol
- monohotdraw
title: MonoCanvas, recapitulando.
url: /2006/03/11/monocanvas-recapitulando/
wordpress_id: 252
wordpress_url: http://mario.monouml.org/index.php/2006/03/12/monocanvas-recapitulando/
---

<p>Estos meses han sido dedicados a la escritura de la API que renderizarÃ¡ los diagramas en <a href="http://www.monouml.org">MonoUML</a>, hemos avanzado, es cierto, hemos creado una buena API, organizada, pero desde mi punto de vista, muy estricto generalmente, tiene un detalle que a mi forma de ver, no me gusta ni me agrada ni quiero que exista, ese detalle radica en el hecho de la pobre capacidad de manejar mÃºltiples elementos (mÃ¡s de 100 elementos) dibujados al instante, el manejo y el dibujado de ellos. Es cierto que estamos atrasadÃ­simos, claro, nadie nos presiona, salvo nosotros mismos, pues el compromiso es con nosotros, pero si algo he aprendido es que lo mejor es tener una API estable, que funcione eficientemente y que sea escalable, a liberar <a href="http://www.microsoft.com">porquerÃ­as inservibles</a>, a pesar de escribir un buen algoritmo para que la selecciÃ³n de elementos y movimiento de ellos haya sido definido el desempeÃ±o sigue siendo pobre (o bueno.. no tan bueno como yo pensÃ©) y la calidad de nuestro esfuerzo debe sobresalir, si estamos escribiendo una aplicaciÃ³n que ayudarÃ¡ a documentar, ((ademÃ¡s de otras cosas cosas) cosa que es, en ocasiones, pesada, molesta y aburrida y ademÃ¡s creemos (<em>de forma totalmente erronea</em>) que quita tiempo), debemos de crear algo que realmente sea bueno.</p>
<p>He pensado diferentes soluciones, sin duda la mejor (o si alguien tiene otra mejor que opine) es crear hacer subclasses de <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a1351%23Widget%2f">Gtk.Widget</a> (o <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a838%23DrawingArea%2f">Gtk.DrawingArea</a>) y a partir de ahÃ­ escribir nuestros elementos, esta no es una decisiÃ³n final, pero sin encambio harÃ© pruebas para probar su desempeÃ±o en comparaciÃ³n a la versiÃ³n actual, estos cambios me desesperan, es cierto que siempre llega un instante en el que no se puede mejorar mÃ¡s tu software a menos que cambies el hardware, pero quiero que ese lÃ­mite no este definido por la capacidad de mi equipo actual, sino por la capacidad de un equipo considerablemente menor.</p>
<p>Sin duda escribir Widgets que deriven de Gtk.DrawingArea harÃ¡ que cosas como: <em>saber sobrÃ© que Widget estoy</em> o <em>saber si le di click a un Widget</em> sea mÃ¡s rÃ¡pido, eficiente y transparente, pues los eventos no son procesados y luego generados por la misma API sino por el <a href="http://es.wikipedia.org/wiki/X_Window_System">sistema de ventanas</a>. Es claro que hacer esto atrasarÃ¡ la salida de la primera versiÃ³n un tiempo, pero mi misiÃ³n es terminarlo lo mÃ¡s pronto posible, me gustarÃ­a ver este aÃ±o una segunda versiÃ³n de <a href="http://www.monouml.org">MonoUML</a>, hemos hecho varias cosas y serÃ­a grato mostrar nuestro avance, ahora que Gtk# 2.8 es la versiÃ³n propuesta como estable, serÃ­a grandioso liberar pronto una versiÃ³n de <a href="http://www.monouml.org">MonoUML</a> para que forme parte de las distribuciones. Todo el equipo ha estado tan ocupado, pero seguimos trabajando, lento pero seguro.</p>
<p>Simples pensamientos. AÃºn hay cosas que hacer.</p>
<p>Por otro lado, pronto inicio un buen proyecto con Linux en mi trabajo, no serÃ¡ 100% en Ã©l, pero sin duda disfrutarÃ© trabajando este aÃ±o prÃ³ximo, pues esta pensado para un aÃ±o de duro esfuerzo, se avecinan buenas cosas.</p>
