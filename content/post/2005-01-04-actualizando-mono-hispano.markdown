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
date: 2005-01-04T01:36:33Z
published: true
status: publish
tags:
- espaÃ±ol
- personal
- monohispano
title: Actualizando Mono Hispano
url: /2005/01/04/actualizando-mono-hispano/
wordpress_id: 85
wordpress_url: http://mario.monouml.org/index.php/2005/01/04/actualizando-mono-hispano/
---

<div style="clear:both;"></div>
<p align="justify">He terminado la <a href="http://www.monohispano.org/tutoriales/ado.net">documentaciÃ³n de los 3 gestores de base de datos</a> que me propuse estas vacaciones, aunque siento que esta un poco <span style="font-style:italic;">dÃ©bil</span> esa parte, aÃºn faltan muchos otros gestores, mi intenciÃ³n es que al menos exista la forma de utilizar todos los gestores indicados en la <a href="http://www.mono-project.com/contributing/ado-net.html">pÃ¡gina de mono</a>, es decir, la lista de los gestores soportados por mono hasta ahora en comparaciÃ³n con el manual de ADO.net es lo siguiente:</p>
<ol>
<li><strike>PostgreSQL</strike></li>
<li><strike>MySQL</strike></li>
<li><strike>MS SQL</strike></li>
<li>IBM DB2</li>
<li>Firebird Interbase</li>
<li>ODBC</li>
<li>OLE DB</li>
<li>ODBC</li>
<li>Oracle</li>
<li>Sybase</li>
<li>SQL Lite</li>
<li>TDS Generic</li>
</ol>
<p align="justify">Es decir que va un 25% de BD documentadas, asÃ­ que cualquier ayuda es aceptable. Como referencia la pÃ¡gina de <a href="http://www.mono-project.com/contributing/ado-net.html">ADO.NET en mono</a> es la guÃ­a actual de la cual estoy partiendo, ademÃ¡s de las bases de datos anteriores me falta agregar el proveedor interno de <a href="http://www.gnome.org">GNOME</a>, <a href="http://www.gnome-db.org/docs/libgda/">GDA</a>, ademÃ¡s de los clÃ¡sicos ejemplos GUI de los componentes gnome-db para gtk#, aunque no estoy seguro si estos estarÃ­an fuera de contexto en este manual, quizÃ¡s deberÃ­a hacerse un tutorial propio para GDA, no lo se, luego verÃ© q hacer.</p>
<p align="justify">Por otro lado creo que serÃ­a bueno comenzar a hacer un conjunto de <span style="font-weight:bold;">Preguntas de Uso Frecuente de ProgramaciÃ³n con Mono</span>, hasta ahora he visto las siguientes:</p>
<ol>
<li>
<p align="justify"><span style="font-weight:bold;">GTK#. Â¿CÃ³mo designo un icono a la ventana de mi aplicaciÃ³n?</span></p>
<p align="justify">Utilizando la propiedad <span style="font-style:italic;"><a href="http://www.go-mono.com/docs/monodoc.ashx?link=P%3aGtk.Window.Icon">Icon</a></span> de la ventana, esta propiedad necesita un <a href="http://www.go-mono.com/docs/monodoc.ashx?link=T%3aGdk.Pixbuf">Gdk.Pixbuf</a> para que funcione, por lo tanto se debe de agregar la imagen a los resources del proyecto y luego llamarla asÃ­: <span style="font-style:italic;">Gdk.Pixbuf.LoadFromResource("imagen.png")</span>.</p>
</li>
<li>
<p align="justify"><span style="font-weight:bold;">GTK#. Â¿Existe una forma de distribuir mi ensamblado/ejecutable, el cual utiliza imÃ¡genes internamente, sin la necesidad de distribuir tambiÃ©n las imÃ¡genes?</span></p>
<p align="justify">La forma de hacerlo es incluir las imÃ¡genes a los resources del ensamblado/ejecutable y luego utilizarlas mediante la instrucciÃ³n <span style="font-style:italic;">Gdk.Pixbuf.LoadFromResource("imagen.png")</span>.</p>
</li>
<li>
<p align="justify"><span style="font-weight:bold;">GTK#. Â¿CÃ³mo hago un botÃ³n (desde cÃ³digo) que tenga una imagÃ©n en vez de una etiqueta (<a href="http://www.go-mono.com/docs/monodoc.ashx?link=T%3aGtk.Label">Gtk.Label</a>)?</span></p>
<p align="justify">Hay que reemplazar la propiedad <span style="font-style:italic;">Child</span> del botÃ³n con la imagen correspondiente, es decir:</p>
<pre>
Gtk.Image img = new Gtk.Image ();
img.SetFromStock (Gtk.Stock.Add, IconSize.Button);
Gtk.Button boton = new Gtk.Button ();
boton.Child = img;
</pre>
<p align="justify">El ejemplo anterior es utilizando una imagÃ©n de <a href="http://www.go-mono.com/docs/monodoc.ashx?link=T%3aGtk.Stock">Stock</a> pero tambiÃ©n es Ãºtil para imÃ¡genes incluidas en los resources.</p>
</li>
<li>
<p align="justify"><span style="font-weight:bold;">GTK#. Â¿CÃ³mo puedo imprimir/crear reportes/crear informes con mono?</span></p>
<p align="justify">La Ãºnica forma hasta ahora que se (al menos en Linux/Unix) y que me conste es utilizando <a href="http://http://www.go-mono.com/docs/index.aspx?link=T%3aGnome.Print">Gnome.Print</a>, posiblemente pronto se puedan algunas otras formas, como <a href="http://www.businessobjects.com/products/reporting/crystalreports/net/default.asp">CrystalReports</a>.</p>
</li>
<li>
<p align="justify"><span style="font-weight:bold;">GTK#. Â¿CÃ³mo puedo definir el tamaÃ±o de mi botÃ³n/label/entry/otro-widget en una ventana?</span></p>
<p align="justify">Aunque no es recomendado, es posible, utilizando el contenedor <a href="http://www.go-mono.com/docs/monodoc.ashx?link=T%3aGtk.Fixed">Gtk.Fixed</a> y luego agregando los widgets que se quieran redimensionar a un tamaÃ±o especifico, aunque repito, <span style="font-weight:bold;">no es recomendado</span>.</p>
</li>
</ol>
<p align="justify">Si alguien tiene alguna otra pregunta que considera que deberÃ­a ser agregada, no dude en contactarme.</p>
<p><span style="font-weight:bold;">Por cierto</span>: 'Si que esta largo el <a href="http://www.monohispano.org/ecma/">capitulo 14 del ECMA</a>, pero falta poco :)'</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
