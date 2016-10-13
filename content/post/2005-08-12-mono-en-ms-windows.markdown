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
date: 2005-08-12T00:53:00Z
published: true
status: publish
tags:
- espaÃ±ol
- mono
title: Mono en MS Windows
url: /2005/08/12/mono-en-ms-windows/
wordpress_id: 150
wordpress_url: http://mario.monouml.org/index.php/2005/08/12/mono-en-ms-windows/
---

<div style="clear:both;"></div>
<p style="text-align: justify;">A veces me gusta estar jugando con las cosas mÃ¡s nuevas de <a href="http://www.mono-project.com">Mono</a>, y me gusta mÃ¡s estar jugando con ellas en <a href="http://es.wikipedia.org/wiki/Windows">MS Windows</a>, probar una que otra cosa. Hay gente que en verdad esta interesada en poder crear aplicaciones con Mono para MS Windows pero se detienen pues la documentaciÃ³n es un poco escaza de este lado, detalles de configuraciÃ³n es lo mÃ¡s problematico.</p>
<p style="text-align: justify;">He escrito como dos aplicaciones tipo <span style="font-style:italic;">usuario final</span> para que se ejecuten principalmente en MS Windows, son de utilizaciÃ³n con <span style="font-style:italic;">cualquier usuario</span>, hacerlas funcionar no es tan difÃ­cil, en realidad solo copio el binario generado en GNU/Linux y lo ejecuto de este lado, cosa algo ortodoxa, pero bueno tambiÃ©n posible crear algÃºn sencillo "Makefile" con <a href="http://en.wikipedia.org/wiki/.bat">archivos .bat</a> para una compilaciÃ³n mÃ¡s automatizada, aunque claro hay mejores soluciones.</p>
<p style="text-align: justify;">Como las aplicaciones son grÃ¡ficas, hago uso de <a href="http://forge.novell.com/modules/xfcontent/downloads.php/monowin32/Mono%20Win32%20Combined%20Installer/v1.1.8.0">Gtk#</a> y las lanzo con <a href="http://forge.novell.com/modules/xfcontent/downloads.php/monowin32/Runtime%20selector">MonoLaunch</a> para omitir la ventana de MS-DOS que por lo general se carga. <a href="http://forge.novell.com/modules/xfmod/project/?monowin32">El instalador</a> de <a href="http://www.mfconsulting.com/blog/">Paco MartÃ­nez</a> trae todo lo necesario, inclusive el <a href="http://glade.gnome.org/">Glade</a> para las UIs.</p>
<p style="text-align: justify;">Posiblemente al pensar en Mono nos viene a la cabeza GNU/Linux, y los UNIX en general, pero tambiÃ©n hay que tener en cuenta que MS Windows es lo mÃ¡s popular y por tanto hay que tomarlo en cuenta (no mucho :P) para desarrollo futuro, siempre hay alguien que no sabe otra cosa que MS Windows, y hay que complacerlo, ademÃ¡s el extra de que <span style="font-weight:bold;">tambiÃ©n funciona en GNU/Linux</span> es importante.</p>
<p style="text-align: justify;">A ver si pronto escribo algÃºn documento sencillo de programaciÃ³n con Mono en MS Windows, seguro serÃ­a Ãºtil, el Ãºnico problema que le veo es estar en MS Windows, pero bueno, el fin justifica los medios.</p>
<p style="text-align: center; align: center;">
<a href="http://photos22.flickr.com/33334704_0d2e712585_o.png"><img src="http://photos22.flickr.com/33334704_0d2e712585_m.jpg" alt="System.Windows.Forms" title="System.Windows.Forms" border="0" /></a></p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
