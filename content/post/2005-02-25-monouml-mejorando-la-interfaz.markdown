---
date: 2005-02-25T02:07:00Z
title: MonoUML, mejorando la interfaz
url: /2005/02/25/monouml-mejorando-la-interfaz.html
---

<div style="clear:both;"></div>
<p align="justify"><a href="http://ceronman.blogspot.com">Manuel</a> ha propuesto migrar UMLCanvas# a Cairo, algo que me suena bueno, asi se podrÃ­a utilizar <a href="http://monouml.sf.net">MonoUML</a> en MS Windows, aunque hay otro problema, los widgets gnome-sharp, hemos utilizado muchos de ellos, aunque bueno, no se porque me preocupo de eso, creo que pensar en abarcar ambos SO por ahora es vanidad, claro que serÃ­a muy interesante y sobretodo Ãºtil, tampoco hay que ser crueles con la gente que utiliza MS Windows, si se aporta que sea para todos, no sÃ³lo para un grupo en particular.</p>
<p align="justify">MS Windows tiene algo que usualmente los UNIX libres no tienen (hablando en general) o mejor dicho, el software libre en general no tiene, y eso son los asistentes, los llamados <span style="font-weight:bold;">wizards</span>, nuestro asistente es un juego de <span style="font-weight:bold;">./configure && make && sudo make install</span>, con eso estamos felices, pero llega un momento en que ya no es posible utilizar ese juego de instrucciones, se nos hace tedioso y queremos hacerlo todo mÃ¡s rÃ¡pido, sabemos que hay alias, pero pensemos en el usuario novato. Debemos de dejar de ser tan duros con los usuarios de las aplicaciones, es cierto que los usuarios de software libre por lo general tienen un mayor conocimiento de como instalar las aplicaciones y no son de 'doble click y siguiente-finalizar' sino un poco mÃ¡s 'inteligentes'   pero eso no quiere decir que una sencilla instrucciÃ³n que te haga todo de una sola vez no cae bien.</p>
<p align="justify">Como desarrolladores de aplicaciones debemos de pensar en los usuarios que algÃºn dÃ­a podrÃ­an utilizar nuestra aplicaciÃ³n, ponernos en su lugar, y de alguna forma pensar como ellos, diseÃ±ar un juego de asistentes <span style="font-weight:bold;">Ãºtiles</span> para tareas comunes es excelente, pues se aumenta la productividad, claro que tampoco hay que caer en la exageraciÃ³n y poner asistentes hasta para cerrar la aplicaciÃ³n.</p>
<p align="justify">Siguiendo la idea de la integraciÃ³n que busca MonoUML y la facilidad que se quiere presentar al usuario final, se han adaptado unas clases escritas originalmente por <a href="http://rodolfocampero.blogspot.com">Rodolfo</a>, ahora contenidas en un agradable asistente para la generaciÃ³n de cÃ³digo, con eso que hay que retocar MonoUML para el concurso y que una de las partes fuertes es el <span style="font-style:italic;">Forward Engineering</span>, se debe mostrar lo mÃ¡s sofisticado posible, pero sin caer en la confusiÃ³n</p>
<p align="justify">Que agradable se ve todo :)</p>
<table align="center" width="50%" border="0" cellpadding="2" cellspacing="2">
<tbody>
<tr>
<td align="center"><a href="http://monouml.sourceforge.net/screenshots/codgen/0.png"><img border="0" width="150" height="120" alt="Wizard" src="http://monouml.sourceforge.net/screenshots/codgen/0.png"/></a></td>
<td align="center"><a href="http://monouml.sourceforge.net/screenshots/codgen/1.png"><img border="0" width="150" height="77" alt="Wizard" src="http://monouml.sourceforge.net/screenshots/codgen/1.png"/></a></td>
</tr>
<tr>
<td align="center"><a href="http://monouml.sourceforge.net/screenshots/codgen/2.png"><img border="0" width="150" height="77" alt="Wizard" src="http://monouml.sourceforge.net/screenshots/codgen/2.png"/></a></td>
<td align="center"><a href="http://monouml.sourceforge.net/screenshots/codgen/3.png"><img border="0" width="150" height="77" alt="Wizard" src="http://monouml.sourceforge.net/screenshots/codgen/3.png"/></a></td>
</tr>
<tr>
<td align="center"><a href="http://monouml.sourceforge.net/screenshots/codgen/4.png"><img border="0" width="150" height="119" alt="Wizard" src="http://monouml.sourceforge.net/screenshots/codgen/4.png"/></a></td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
<div style="clear:both; padding-bottom: 0.25em;"></div>
