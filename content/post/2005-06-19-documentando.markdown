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
date: 2005-06-19T06:53:00Z
published: true
status: publish
tags:
- espaÃ±ol
- monouml
title: Documentando
url: /2005/06/19/documentando/
wordpress_id: 134
wordpress_url: http://mario.monouml.org/index.php/2005/06/19/documentando/
---

<div style="clear:both;"></div>
<p align="justify">No hay nada mÃ¡s agradable que utilizar tu aplicaciÃ³n para realizar tus tareas, y ahora que es momento de documentar <a href="http://www.monouml.org">MonoUML</a> que mejor oportunidad que documentar tu aplicaciÃ³n con tu misma aplicaciÃ³n X-).</p>
<p align="justify">Entre <a href="http://hgmiguel.blogspot.com/">Miguel Huerta</a> y yo hemos terminado un demo que estarÃ¡ contenido en la documentaciÃ³n oficial de <a href="http://www.monouml.org">MonoUML</a> (y que ahora sÃ³lo esta para un documento del <a href="http://www.itver.edu.mx/eventos/academicos/creatividad/" title="Porqueria de Webmasters, no actualizan la informaci&oacute;n del Concurso">Concurso de Creatividad</a> de <a href="http://www.itver.edu.mx">mi U</a>) que busca como objetivo mostrar las maravillas de <a href="http://www.mono-project.com">Mono</a> y <a href="http://www.monouml.org">MonoUML</a>, para esto hicimos 4 clases en 4 diferentes lenguajes, una clase por lenguaje, asÃ­ de esta forma tenemos una clase escrita en <a href="http://boo.codehaus.org/">Boo</a>, una en <a href="http://www.ikvm.net">Java</a>, una en <a href="http://monobrasil.softwarelivre.org/wiki/MonoBASIC">VB.NET</a> y otra en <a href="http://www.ecma-international.org/publications/standards/Ecma-334.htm">C#</a>.</p>
<p align="justify">
La idea de esto crear una aplicaciÃ³n (muy breve en verdad) que esta realmente Orientada a Objetos y sirva como ejemplo para ser utilizada por <a href="http://www.monouml.org">MonoUML</a>, en pocas palabras, un ejemplo mÃ¡s <span style="font-style:italic;">real</span>. Â¿QuÃ© hace la aplicaciÃ³n? Pues calcula el valor mÃ¡ximo, mÃ­nimo y medio de una matriz de nÃºmero fraccionarios.</p>
<p align="justify">Es decir, algo como esto:</p>
<p align="center"><img src="http://photos16.flickr.com/20218276_7a4f969084_o.png" title="Class Diagram. Drawn with MonoUML"/></p>
<p align="justify">Claro que no podÃ­a faltar un ejemplo de diagramas de caso de uso, este es de un mÃ©todo de la clase escrita en VB.NET, este diagrama serÃ¡ base para cuando implementemos los Diagramas de Secuencia y Diagramas de ColaboraciÃ³n, para hacer sus correspondientes ejemplos.</p>
<p align="center"><a href="http://photos15.flickr.com/20225388_b561c8f3b5_o.png"><img src="http://photos15.flickr.com/20225388_b561c8f3b5.jpg" title="Use Case Diagram. Drawn with MonoUML" border="0"/></a></p>
<p align="justify">El cÃ³digo no es tan complejo en realidad:</p>
<pre>
<code>
<font color="#a52a2a"><b>Public Sub</b></font> Calculate ()
  <font color="#a52a2a"><b>Dim</b></font> sum As FractionalNumber
  sum = new FractionalNumber (<font color="#ff00ff">0</font>, <font color="#ff00ff">0</font>)
  _maximum = _matrix (<font color="#ff00ff">0</font>, <font color="#ff00ff">0</font>)
  _minimum = _matrix (<font color="#ff00ff">0</font>, <font color="#ff00ff">0</font>)
  <font color="#a52a2a"><b>Dim</b></font> i As Integer
  <font color="#a52a2a"><b>For</b></font> i = <font color="#ff00ff">0</font> To _rows - <font color="#ff00ff">1</font>
    <font color="#a52a2a"><b>Dim</b></font> j As Integer
    <font color="#a52a2a"><b>For</b></font> j = <font color="#ff00ff">0</font> To _columns - <font color="#ff00ff">1</font>
      sum = sum.Addition (_matrix (i, j))
      <font color="#a52a2a"><b>If</b></font> _matrix (i, j).GreaterThan (_maximum) <font color="#a52a2a"><b>Then</b></font>
        _maximum = _matrix (i, j)
        <font color="#a52a2a"><b>End</b></font> <font color="#a52a2a"><b>If</b></font>
        <font color="#a52a2a"><b>If</b></font> _matrix (i, j).LessThan (_minimum) <font color="#a52a2a"><b>Then</b></font>
          _minimum = _matrix (i, j)
        <font color="#a52a2a"><b>End</b></font> <font color="#a52a2a"><b>If</b></font>
    <font color="#a52a2a"><b>Next</b></font>
  <font color="#a52a2a"><b>Next</b></font>
  _medium = sum.Division (new FractionalNumber (_rows * _columns, <font color="#ff00ff">1</font>))
<font color="#a52a2a"><b>End</b></font> <font color="#a52a2a"><b>Sub</b></font>
</code>
</pre>
<p align="justify">Ahora con este documento que se escribio, me he dado cuenta de varias cosas:</p>
<ul>
<li>No se porque la gente programa en Visual Basic .NET, entiendo a aquellos que vienen de MS Windows con el viejo Visual Basic, pues ahÃ­ en realidad ni programabas sÃ³lo arrastrabas "componentes", Â¡pero vamos! muchos de los que comienzan en .NET prefieren VB.NET, lo bueno es que los que comienzan con <a href="http://www.mono-project.com">mono</a> se crean mÃ¡s carÃ¡cter con C# (y si fuiste desarrollador Java Â¡que mejor!). <span style="font-weight:bold;">Di no a VB.NET</span>
</li>
<li><a href="http://boo.codehaus.org/">Boo</a> es muy parecido a <a href="http://www.python.org/">Python</a> y es sencillo de aprender, pero no me gusta, no me agrada la idea de que los bloques se indiquen por indentaciÃ³n, pero bueno, cada quien tiene sus gustos.
</li>
<li>La suma de <a href="http://java.sun.com">Java</a> + <a href="http://www.ikvm.net">IKVM</a> + <a href="http://www.mono-project.com">mono</a> posiblemente pronto sea algo que los programadores Java tomen en cuenta.
</li>
<li><a href="http://www.monouml.org">MonoUML</a> necesita mejoras de usabilidad, hay que trabajar duro.
</li>
<li>Si que hace falta un generador de documentaciÃ³n para <a href="http://www.monouml.org">MonoUML</a>, unos tres clicks y tener toda tu documentaciÃ³n lista.
</li>
<li>Creo que la soluciÃ³n al FN+Pet Sis (en portÃ¡tiles Dell) = Congelamiento esta en <a href="http://barrapunto.com/article.pl?sid=04/06/06/1515248">un post viejo</a> de <a href="http://www.barrapunto.com">BarraPunto</a>.
</li>
</ul>
<p align="justify">Me emociona ver que ahora se pueden hacer cosas realmente Ãºtiles, claro, con un poco de hacking ;) pero se pueden. Ya estamos cumpliendo uno de los viejos objetivos que algÃºn dÃ­a <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> y yo nos plantemos: <span style="font-style:italic;">Diagramas de Casos de Uso y Diagramas de Clases</span>.</p>
<p align="justify">Debido a que el <a href="http://www.monouml.org/images/monouml.png">logo del Mono</a> de <a href="http://www.monouml.org">MonoUML</a> sale caro para hacer una serigrafÃ­a, decidÃ­ hacer un logo mÃ¡s sencillo, el resultado me gusto pero aun asÃ­ necesita un poco mÃ¡s de pincelado para mejorarlo y que no se vea tan cuadrado en algunos aspecto, lo harÃ© con mÃ¡s calma pronto.</p>
<p align="center"><a href="http://photos17.flickr.com/20222521_303c83c240_o.png"><img src="http://photos17.flickr.com/20222521_303c83c240_m.jpg" title="MonoUML t-shirt logo - draft" border="0"/></a></p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
