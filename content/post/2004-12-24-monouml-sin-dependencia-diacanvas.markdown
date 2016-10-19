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
date: 2004-12-24T17:54:13Z
published: true
status: publish
tags:
- espaÃ±ol
- monouml
title: MonoUML. Sin dependencia diacanvas#
url: /2004/12/24/monouml-sin-dependencia-diacanvas/
wordpress_id: 70
wordpress_url: http://mario.monouml.org/index.php/2004/12/24/monouml-sin-dependencia-diacanvas/
---

<div style="clear:both;"></div>
<p align="justify">Finalmente despuÃ©s de un largo rato de trabajo, por fin se ha podido quitar la dependencia de <a href="http://mwh.sysrq.dk/programs/announcements/diacanvas-sharp-0.5.0.html">Diacanvas#</a>. La versiÃ³n actual de <a href="http://sourceforge.net/cvs/?group_id=115334">CVS</a> ya tiene los Ãºltimos cambios realizados por <a href="http://ceronman.blogspot.com/">Manuel</a>, ademÃ¡s de los viejos cambios hechos por <a href="http://rodolfocampero.blogspot.com/">Rodolfo</a> y <a href="http://primate.gnome.cl/~mario/">Mario</a> que tenÃ­a la vieja librerÃ­a, prÃ¡cticamente es lo Ãºltimo hecho por todos, y por fin ha sido concentrado.</p>
<p><a href="http://www.geocities.com/k4rny/imgs/umlcanvas-sharp/umlcanvas_sharp_0_0_0_6.png"><img src="http://www.geocities.com/k4rny/imgs/umlcanvas-sharp/umlcanvas_sharp_0_0_0_6.png" alt="VersiÃ³n sin Diacanvas#" title="VersiÃ³n sin Diacanvas#" width="350" height="319" border="0"/></a></p>
<p align="justify">El widget de texto, <span style="font-style:italic;">UMLEntry</span>, que permite tener textos relacionados con los elementos esta prÃ¡cticamente funcional, inclusive hice un widget para que los elementos UML que tienen texto esten derivados de un clase, <span style="font-style:italic;">UMLNodeEntry</span>, de esta forma se podrÃ¡n agregar X nÃºmero de elementos de texto, <span style="font-style:italic;">UMLEntry</span>, y estos mantendrÃ¡n su posiciÃ³n relativa con el elemento principal al momento de redimensionado y movimiento.</p>
<p align="justify">Faltan muchas cosas, hay algunos errores visuales al momento de mover el <span style="font-style:italic;">UMLEntry</span> espero pronto solucionar esos detalles, ademÃ¡s de que el <span style="font-style:italic;">UMLCanvas</span> debe ser pulido para un mejor desempeÃ±o. Hasta ahora vamos muy bien.</p>
<p align="justify">Se puede disfrutar de la Ãºltima versiÃ³n haciendo: </p>
<p><code>$ cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/expertcoder checkout ExpertCoder<br />$ cd ExpertCoder && make<br />$ cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/monouml checkout monouml<br />$ cd monouml && cp ../ExpertCoder/bin/*.dll && make run</code></p>
<p><span style="font-weight:bold;">Nota de hoy</span>: 'Feliz navidad a todos'</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
