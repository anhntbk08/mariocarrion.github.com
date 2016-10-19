---
date: 2005-06-01T01:11:00Z
title: MÃ¡s MonoUML
url: /2005/06/01/mas-monouml.html
---

<div style="clear:both;"></div>
<p align="justify">Pues con la novedad que hemos pasado a la siguiente ronda del concurso de mi <a href="http://www.itver.edu.mx/">Universidad</a>, creo que la explicaciÃ³n sirvio, aunque estoy seguro que lo que mÃ¡s gusto fueron los demos. Felicidades al equipo, lo hemos hecho bien.</p>
<p align="justify">
He pensado en comenzar a hacer la exportaciÃ³n de diagramas a <a href="http://www.w3.org/TR/SVG/">SVG</a>, me gusta utilizar formatos estÃ¡ndar ademÃ¡s SVG es un formato que ya esta siendo soportado por la mayoria de editores grÃ¡ficos, claro que exportar a <a href="http://www.jpeg.org/">JPEG</a> o <a href="http://www.w3.org/Graphics/PNG/">PNG</a> seria mÃ¡s viable asÃ­ que tambiÃ©n serÃ¡ tomado en cuenta. Buscando por ahÃ­ encontre dos proyectos que actualmente pueden convertir un <a href="http://www.omg.org/cgi-bin/doc?formal/05-05-01">XMI</a> a SVG, <a href="http://uml2svg.sourceforge.net/">uml2svg</a> y <a href="http://stz-ida.de/html/oss/xmi_diagram.html.en">xmi2svg</a> aunque hay unos detalles...  nosotros implementamos el estÃ¡ndar de <a href="http://www.omg.org/cgi-bin/doc?ptc/2003-09-01">DI</a> pero tal parece que se quejan al respecto y no pueden generar el SVG, uml2svg sÃ³lo permite XMI 1.2 mientras que xmi2svg soporta XMI 2.0 pero de todos modos no pueden realizar la exportaciÃ³n, espero mirar con mÃ¡s calma el XSLT para ver que se puede tomar de ahÃ­ y comenzar a hacer algo al respecto.</p>
<p align="justify">
Claro que antes de eso, a solucionar un pequeÃ±o error en la IngenierÃ­a Inversa, no se nota, por un truco que ahora esta en el <a href="http://forge.novell.com/modules/xfmod/svn/svnbrowse.php?repname=monouml">SVN</a>, pero debe de ser corregido para hacer mÃ¡s fluida la ingenierÃ­a inversa. Por cierto, que bien vamos con <a href="http://forge.novell.com/modules/xfcontent/downloads.php/monouml">las descargas</a>, desde que saliÃ³ han habido <a href="http://forge.novell.com/modules/xfmod/statistics/?group_id=1688">mÃ¡s de 120 descargas</a>, espero que pronto se reporten errores o peticiones para ver que se puede hacer.</p>
<p align="justify">
Por otro lado, <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> implemento una cosa maravillosa, la herencia en Actores, que serÃ­a lo mismo en otros objetos, en verdad se ve genial, y para muestra una pequeÃ±a captura de pantalla:</p>
<p align="center">
<a href="http://photos9.flickr.com/16819697_1374dccdfd_o.png"><img src="http://photos9.flickr.com/16819697_1374dccdfd.jpg" alt="Use Cases" title="Use Cases" border="0"/></a></p>
<p align="justify">
Creo que abrirÃ© un blog en personal de escritura exclusiva en inglÃ©s... como que hace falta, Â¿no?</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
