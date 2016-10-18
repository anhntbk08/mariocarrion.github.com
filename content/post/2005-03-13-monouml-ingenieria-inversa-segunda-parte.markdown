---
date: 2005-03-13T00:47:00Z
title: MonoUML, IngenierÃ­a Inversa. Segunda Parte
url: /2005/03/13/monouml-ingenieria-inversa-segunda-parte.html
---

<div style="clear:both;"></div>
<p align="justify">DespuÃ©s de un dÃ­a de arduo trabajo, he subido al <a href="http://sourceforge.net/cvs/?group_id=115334">CVS</a> la versiÃ³n actual de la parte de ingenierÃ­a inversa aunque he detectado los siguientes detalles:</p>
<ol>
<li>El proceso de importaciÃ³n del ensamblado al XMI no es lento, tampoco la serializaciÃ³n, algo muy bueno.
</li>
<li>El proceso de importaciÃ³n del XMI, es decir las deserializaciÃ³n, en <a href="http://monouml.sf.net">MonoUML</a> es un poco tardado (en mi P4 2.8/512 RAM, tardo unos 2 minutos).
</li>
<li>Las pruebas que hice fueron con un XMI de unos 5.0MB, es decir la librerÃ­a de <span style="font-weight:bold;">Gtk# completa (ademÃ¡s de TODAS sus dependencias)</span>, algo no tan bueno aunque viÃ©ndolo bien 5.0MB de XMI no es tanto, pues esta completa la librerÃ­a.
</li>
<li>Al XMI aÃºn le hace falta aumentar en tamaÃ±o, pues apenas agregue las clases (constructores, mÃ©todos) y las enumeraciones ademÃ¡s de los tipos primitivos, asÃ­ que segÃºn mis cÃ¡lculos aumentarÃ¡ un 50% mÃ¡s en tamaÃ±o.
</li>
</ol>
<p align="justify">DespuÃ©s de esperar aproximadamente 2 minutos para deserializar se ve lo siguiente:</p>
<table align="center" border="0" width="80%">
<tr>
<td width="50%"><a href="http://www.geocities.com/k4rny/imgs/2005_mar_13/reveng1.png"><img src="http://www.geocities.com/k4rny/imgs/2005_mar_13/reveng1.png" border="0" width="300" height="226" alt="GTK# Cargado" title="GTK# Cargado"/></a></td>
<td width="50%"><a href="http://www.geocities.com/k4rny/imgs/2005_mar_13/reveng0.png"><img src="http://www.geocities.com/k4rny/imgs/2005_mar_13/reveng0.png" border="0" width="300" height="226" alt="GTK# Cargado" title="GTK# Cargado"/></a></td>
</tr>
</table>
<p align="justify">Es claro que en el diÃ¡logo <span style="font-style:italic;">Reverse Engineering</span> se deben utilizar threads para que el usuario no crea que se ha colgado la aplicaciÃ³n. Cuando todo este mejor sin duda harÃ© el dialogo de importaciÃ³n simultanea de ensamblados para ser salvados en un sÃ³lo XMI, aunque serÃ­a bueno ayudar a <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> para permitir que dentro de la librerÃ­a XMI se permitan mÃºltiples archivos simultaneamente, posiblemente eso mejore el serializaciÃ³n de XMI al igual que su deserializaciÃ³n en <a href="http://monouml.sf.net">MonoUML</a>.</p>
<p align="justify">AdemÃ¡s de todo lo anterior, <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> se propuso hacer esa caracterÃ­stica de poder cortar los Edges (asociaciones) como lo hace PoseidÃ³n y ArgoUML, y lo ha logrado:</p>
<p align="center"><a href="http://www.geocities.com/k4rny/imgs/2005_mar_13/canvassharp.png"><img width="300" height="226" border="0" src="http://www.geocities.com/k4rny/imgs/2005_mar_13/canvassharp.png" alt="UMLCanvas#" title="UMLCanvas#"/></a></p>
<p align="justify">Y no sÃ³lo eso, sino que junto con algunas caracterÃ­sticas anteriores escritas por <a href="http://ceronman.blogspot.com">Manuel</a> el canvas se esta convirtiendo en algo mÃ¡s usable, olvidemonos de cosas arcaicas como los <span style="font-style:italic;">Glue Points</span> :) <span style="font-weight:bold;">Â¡Felicidades!</span></p>
<p><span style="font-weight:bold;">PD.</span> Que bonito el tema de <a href="http://gnome-look.org/content/show.php?content=21369">ClearLooks</a></p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
