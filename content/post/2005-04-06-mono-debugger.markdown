---
date: 2005-04-06T02:14:00Z
title: Mono Debugger
url: /2005/04/06/mono-debugger.html
---

<div style="clear:both;"></div>
<p align="justify">A pesar de que nunca he utilizado un debugger a fondo en mi corta vida, he decido darle un vistazo al mono-debugger, algunas de las razones que me obligaron a utilizarle es el bug de  mucha memoria, que ahora me estoy convenciendo que es un error de Gtk#, pero bueno, ademÃ¡s de mi interÃ©s de averiguar que pasa con las novedades del debugging con mono. La instalaciÃ³n es sencilla, hay que obtener los fuentes de svn</p>
<p>
<code>svn co svn://svn.myrealbox.com/source/trunk/debugger</code></p>
<p align="justify">instalar un paquete necesario:</p>
<p>
<code>apt-get install libreadline5-dev</code></p>
<p align="justify">luego hacer el clÃ¡sico:</p>
<p>
<code>./autogen.sh --prefix=/home/mario/Programs/mono && make && make install</code></p>
<p align="justify">y recompilar Monodevelop:</p>
<p>
<code>./autogen.sh --prefix=/home/mario/Programs/mono --enable-debugger && make && sudo make install</code></p>
<p align="justify">y listo a disfrutar del debugger:</p>
<p>
<code>mdb monouml.exe</code></p>
<p align="justify">Aunque claro, la soluciÃ³n para este error no serÃ¡ de un dÃ­a, ni de una noche, hay que ir paso por paso, de seguro agregar uno que otro breakpoint y comenzar de descartar soluciones hasta llegar a la efectiva.</p>
<p align="justify">Me gustarÃ­a tener un poco mÃ¡s de tiempo libre, espero tenerlo muy pronto, un tiempo para trabajar a fondo con <a href="http://monouml.sourceforge.net">MonoUML</a>.</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
