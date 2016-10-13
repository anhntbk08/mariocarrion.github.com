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
date: 2005-03-01T15:51:00Z
published: true
status: publish
tags:
- espaÃ±ol
- personal
- mono
title: Compilando
url: /2005/03/01/compilando/
wordpress_id: 106
wordpress_url: http://mario.monouml.org/index.php/2005/03/01/compilando/
---

<div style="clear:both;"></div>
<p align="justify">Monodevelop 0.5.1 trae buenas cosas, es mÃ¡s ligero y trae algunos addins nuevos, sin duda mÃ¡s profesional. Primero hay que eliminar automake1.4 e instalar automake1.9 para poder crear el configure de monodevelop ademÃ¡s de instalar subversion:</p>
<p>
<code># apt-get install automake1.9 subversion && apt-get remove automake1.4<br />
</code></p>
<p align="justify">Bajar del SVN las fuentes y compilar como normalmente:</p>
<p><code>svn co svn://svn.myrealbox.com/monodevelop/trunk/MonoDevelop</code></p>
<p><code>svn co svn://svn.myrealbox.com/monodevelop/trunk/gtkmozembed-sharp</code></p>
<p><code>svn co svn://svn.myrealbox.com/monodevelop/trunk/gtksourceview-sharp</code></p>
<p align="justify">Y listo Monodevelop funcionando:</p>
<p>
<a href="http://www.geocities.com/k4rny/imgs/2005_mar_01/monodevelop.png"><img src="http://www.geocities.com/k4rny/imgs/2005_mar_01/monodevelop.png" width="350" height="257" alt="Monodevelop 0.5.1 en Debian" title="Monodevelop 0.5.1 en Debian" border="0"/></a></p>
<p>Â¿<a href="http://svn.myrealbox.com/viewcvs/trunk/">MÃ¡s modulos de SVN</a> para compilar?</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
