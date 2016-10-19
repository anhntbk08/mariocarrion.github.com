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
date: 2005-01-19T01:25:06Z
published: true
status: publish
tags:
- espaÃ±ol
- monouml
- personal
title: MonoUML, escuela y proyectos con ganancias.
url: /2005/01/19/monouml-escuela-y-proyectos-con-ganancias/
wordpress_id: 80
wordpress_url: http://mario.monouml.org/index.php/2005/01/19/monouml-escuela-y-proyectos-con-ganancias/
---

<div style="clear:both;"></div>
<p align="justify">Finalmente he logrado escoger mis ultimas materias en la <a href="http://www.itver.edu.mx">escuela</a>, ahora ya solo me falta una mÃ¡s por cursar y abre terminado mis estudios. El horario es algo agradable, al menos a mi me gusta, pues la entrada es a las 12:00 y la salida es a las 21:00, mucho mejor que el del semestre pasado donde entraba a las 08:00 y salÃ­a a las 21:00, ahora podrÃ© dedicar mÃ¡s tiempo a <a href="http://monouml.sf.net">MonoUML</a>.</p>
<p align="justify">He agregado unas mejoras a <a href="http://monouml.sf.net">MonoUML</a>, bÃ¡sicamente ando integrando <span style="font-weight:bold;">UMLCanvas#</span> a todo el demÃ¡s trabajo realizado en el proyecto, hasta ahora he logrado lo mÃ¡s sencillo: que al activar un elemento del canvas este muestre sus propiedades en la <span style="font-style:italic;">UMLPropertiesTab</span>, tal y como se hace cuando se selecciona un elemento del Tree de la izquierda, es un claro avance, ahora solo falta agregar unos eventos mÃ¡s para cuando se modifiquen las propiedades.</p>
<p>
<a href="http://www.geocities.com/k4rny/imgs/2005_ene_19/enlace_logrado.png"><img src="http://www.geocities.com/k4rny/imgs/2005_ene_19/enlace_logrado.png" alt="Enlace logrado" title="Enlace logrado" width="300" heigth="260" border="0"/></a></p>
<p align="justify">He agregado una nueva clase llamada <a href="http://monouml.sourceforge.net/wiki/doku.php?id=monouml_uml2">UMLNodeEntryContained</a>, que busca crear widgets de UML que contienen una o varias <span style="font-weight:bold;">UMLEntry</span> y que necesariamente deben estar dentro del <span style="font-weight:bold;">UMLElement</span>, ya antes habÃ­a hecho una similar llamada UMLNodeEntry, pero con la diferencia que esta Ãºltima no le interesa si los UMLEntry estan o no dentro del <span style="font-weight:bold;">UMLElement</span>, cuando me refiero a "dentro" es de modo visual, pues obviamente dentro del cÃ³digo en ambas clases los UMLEntry estan en la clase.</p>
<p align="justify">De esta forma UMLNodeEntryContained serÃ¡ Ãºtil para elementos UML con formato texto-contenido-obligatorio como las <span style="font-style:italic;">Clases</span> y los <span style="font-style:italic;">Casos de Uso</span>, a diferencia de UMLNodeEntry donde no interesa la posiciÃ³n de los UMLEntry, como en los <span style="font-style:italic;">Actores</span>.</p>
<p align="justify">He agregado un bonito Ã­cono para aplicaciÃ³n: el mono-sonriente, de esta forma ya no aparece el Ã­cono por defecto del stock. AdemÃ¡s de que por el momento el cuadro de diÃ¡logo de selecciÃ³n de proyecto contiene Ã­conos de stock de Gtk, mientras alguien nos diseÃ±a unos bonitos Ã­conos. El Ã­cono del Acerca de, ha sido tambiÃ©n modificado, utilizando la imagÃ©n del <a href="http://monouml.sourceforge.net/monouml_logo.png">sitio</a>.</p>
<p>
<img src="http://www.geocities.com/k4rny/imgs/2005_ene_19/acerca_de.png" alt="Acerca de" title="Acerca de"/></p>
<p><img src="http://www.geocities.com/k4rny/imgs/2005_ene_19/dialogo_proyecto.png" alt="Selecci&oacute;n de proyecto" title="Selecci&oacute;n de proyecto"/></p>
<p align="justify">Por otro lado estoy <a href="http://www.lssiscom.com/">en plÃ¡ticas</a> para hacer un proyecto que utilizarÃ¡ entre otras cosas <a href="http://dietrich.ganx4.com/nusoap/">Web Services</a> con <a href="http://www.php.net">PHP</a>, sincronizaciÃ³n de <a href="http://www.mysql.com">BD</a>s remotas con locales, bÃ¡sicamente harÃ© el Engine necesario para hacer funcionar lo anterior en sistemas diseÃ±ados para las PYMEs, ojalÃ¡ y se confirme ya que necesito una <a href="http://www.paguito.com/cgi-local/SoftCart.exe/menu_asus_laptop.html?L+scstore+grtb3169ff736073+1106180422">portÃ¡til</a> :), y por supuesto que utilizarÃ© <a href="http://www.mono-project.com">mono</a> para lograr todo lo anterior.</p>
<p>
<span style="font-weight:bold;">Por cierto</span>: 'He retrasado el <a href="http://monouml.sourceforge.net/wiki/doku.php?id=roadmap">lanzamiento</a> de MonoUML 0.01, Â¿razones? Mucha precipitaciÃ³n, se debe tener algo usable y Ãºtil antes de pensar en otra cosa, hay que hacer todo paso a paso, lento pero seguro.'</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
