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
date: 2005-01-06T23:02:26Z
published: true
status: publish
tags:
- espaÃ±ol
- personal
title: En busca del editor
url: /2005/01/06/en-busca-del-editor/
wordpress_id: 84
wordpress_url: http://mario.monouml.org/index.php/2005/01/06/en-busca-del-editor/
---

<div style="clear:both;"></div>
<p align="justify">En bÃºsqueda del editor perfecto para escribir en C# he pasado por <a href="http://www.vim.org/">vi</a> (y derivados), <a href="http://www.gnome.org/projects/gedit/">gEdit</a>, <a href="http://www.monodevelop.org">MonoDevelop</a> y ahora <a href="http://www.scintilla.org/SciTE.html">SciTE</a>. A pesar que caÃ­ por casualidad con este editor me ha sorprendido que si soporta las <span style="font-weight:bold;">#region</span> y <span style="font-weight:bold;">#endregion</span>, ademÃ¡s que permite colapsar regiones comprendidas entre <span style="font-weight:bold;">{</span> y <span style="font-weight:bold;">}</span> algo que no habÃ­a visto en otros editores libres, hay que configurar algunas cosas para que funcione correctamente y tenga una buena vista. Hay que configurar las siguientes cosas para que quede de una forma agradable:</p>
<pre>tabsize=4
indent.size=4
code.page=65001
LC_CTYPE=en_US.UTF-8
if PLAT_GTK
	font.base=font:courier,size:10
	font.small=font:courier,size:10
	font.comment=font:courier,size:10
	font.code.comment.box=$(font.comment)
	font.code.comment.line=$(font.comment)
	font.code.comment.doc=$(font.comment)
	font.text=font:sans,courier:10
	font.text.comment=font:courier,size:10
	font.embedded.base=font:courier,size:10
	font.embedded.comment=font:courier,size:10
	font.monospace=font:courier,size:10
	font.vbs=font:sans,courier:10
font.js=$(font.comment)
</pre>
<p align="justify">Lo que serÃ­a esto:</p>
<p><a href="http://www.geocities.com/k4rny/imgs/2005_ene_06/scite_sample.png"><img src="http://www.geocities.com/k4rny/imgs/2005_ene_06/scite_sample.png" width="300" height="234" border="0" title="Ejemplo de SCiTE" alt="Ejemplo de SCiTE" /></a></p>
<p align="justify">Por otro lado me he instalado <a href="http://www.beatniksoftware.com/tomboy/">Tomboy</a> que reemplaza a mi viejas StickyNotes de <a href="http://www.gnome.org">GNOME</a> ademÃ¡s de un <a href="http://blight.altervista.org//index.php?act=Systray">Ã­cono de para poder ocultar</a> el <a href="http://www.xchat.org/">XChat</a> de la barra de tareas, aunque claro, hay algunos que prefieren utilizar desde GAIM todo, yo soy de los que aÃºn usa <a href="http://www.xchat.org/">XChat</a>, posiblemente pronto cambie, esta bueno el Ã­cono, pues te avisa que tienes mensajes activos y demÃ¡s cosas.</p>
<p><img src="http://www.geocities.com/k4rny/imgs/2005_ene_06/systray.png" width="328" height="39" title="&Iacute;conos en systray" alt="&Iacute;conos en systray" border="0"/></p>
<p align="justify">En la imagÃ©n de arriba tambiÃ©n se puede ver que esta el demonio de <a href="http://www.gnome.org/gnome-pilot">gnome-pilot</a>, <span style="font-weight:bold;">muy bueno</span>, te sincroniza todo con <a href="http://www.gnome.org/projects/evolution/">Evolution</a>, es muy muy bueno. En <a href="http://www.debian.org">Debian</a>/<a href="http://www.kernel.org">kernel 2.6</a> hay un detalle para que funcione correctamente de modo que cuando conectes tu <a href="http://www.palm.com">Handheld</a> se cree automÃ¡ticamente el enlace en /dev, solo hay que editar el archivo <code>/etc/udev/rules.d/udev.rules</code> y agregar lo siguiente:</p>
<pre>KERNEL="ttyUSB[0-9]*", NAME="tts/USB%n", MODE="777", SYMLINK="pilot"</pre></p>
<p>DespuÃ©s de eso, todo deberÃ­a servir correctamente.</p>
<p align="justify">Por otro lado, nuestro compaÃ±ero <a href="http://ceronman.blogspot.com">Manuel</a> ha agregado mÃ¡s funcionalidad a <a href="http://monouml.sf.net">MonoUML</a>, en cuestiÃ³n a las asociaciones.</p>
<p><a href="http://www.geocities.com/k4rny/imgs/umlcanvas-sharp/umlcanvas_sharp_0_0_0_9.png"><img src="http://www.geocities.com/k4rny/imgs/umlcanvas-sharp/umlcanvas_sharp_0_0_0_9.png" alt="Asociaciones" title="Asociaciones" width="300" height="268" border="0"/></a></p>
<p align="justify">Por otro lado <a href="http://hgmiguel.blogspot.com/">Miguel Huerta</a> se une al equipo de <a href="http://monouml.sf.net">MonoUML</a>, andarÃ¡ haciendo la documentaciÃ³n tipo <a href="http://www.go-mono.com/docs/">MonoDoc</a> de las clases que estan, lo cual, por cierto, realmente hace falta.</p>
<p><span style="font-weight:bold;">Nota de hoy</span>: 'apt-get install *'</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
