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
comments:
- author: Francisco Tapias
  author_email: francisco.antonio@tapiasbravo.com
  author_url: http://www.tapiasbravo.com
  content: he leÃ­do que estÃ¡s implementando un demonio en mono. PodrÃ­as mostrar
    el cÃ³digo para ver como se implementa un demonio en C#? Estoy intentando crearme
    una herramienta que monitorice mis sistemas y estÃ© atento para levantar servicios
    en caso de caÃ­das, ademÃ¡s de otros parÃ¡metros del sistema, como memoria, espacio
    en disco, etc. AdemÃ¡s debe enviar notificaciones por mail. UtilizarÃ© GTK para
    leer/escribir un xml de configuraciÃ³n que el demonio leerÃ¡ para saber que tiene
    que hacer en el sistema o en el sistema remoto. En la actualidad utilizo monit
    para  hacer esto mismo, pero no me gusta como funciona ni como se administra y,
    no encuentro otra herramienta semejante y que sea libre, claro, asÃ­ que por quÃ©
    no hacÃ©rmela yo, llevo un par de dias trabajando sobre ello y es bastante sencillo
    por lo que no entiendo como no hay mÃ¡s herramientas por el estilo.
  date: 2006-11-08 12:33:21 -0500
  date_gmt: 2006-11-08 18:33:21 -0500
  id: 1885
- author: Mario CarriÃ³n
  author_email: mario@monouml.org
  author_url: http://mario.monouml.org/
  content: En realidad no era un "demonio" como tal y lo conocemos, pero mi idea inicial
    era esa, debido a la flexibilidad de mono. Al final, no lo logre implementar,
    tuve problemas con mi empleador y ya no continue.
  date: 2006-11-08 16:27:50 -0500
  date_gmt: 2006-11-08 22:27:50 -0500
  id: 1889
date: 2005-01-22T09:22:14Z
published: true
status: publish
tags:
- espaÃ±ol
- personal
title: Trabajando
url: /2005/01/22/trabajando/
wordpress_id: 79
wordpress_url: http://mario.monouml.org/index.php/2005/01/22/trabajando/
---

<div style="clear:both;"></div>
<p align="justify">Por fin he conseguido un proyecto <span style="font-style: italic;">ligero</span> que me darÃ¡ un poco de dinero, no es gran cantidad, pero sirve para algo, al menos podre comprarme una cÃ¡mara digital, que pues a veces hace falta, o quizÃ¡s salir de viaje, que se yo, lo interesante es que aumento algo mÃ¡s en mi <a href="http://www.geocities.com/k4rny/resume.html">cv</a> y por supuesto que gano mÃ¡s experiencia.</p>
<p align="justify">En este proyecto por fin uso <a href="http://www.mono-project.com/">mono</a> como plataforma base (cayÃ³ como anillo al dedo) tanta flexibilidad para este proyecto debe ser explotada ademÃ¡s del servidor ligero mono-xsp (<code>apt-get install mono-xsp asp.net-examples</code>), para utilizarle con webservices con C#, ademÃ¡s de <a href="http://dietrich.ganx4.com/nusoap/">NuSOAP</a> webservices remotos con <a href="http://www.php.net/">PHP</a>, bÃ¡sicamente la idea de lo que harÃ© es proveer una interface de web para conectar un sistema, pero todo esto utilizando un servidor de hosting pÃºblico, es decir sin que la empresa que tiene el sistema cuente con un servidor dedicado, todo esto gracias a la magia de los webservices.</p>
<p align="justify">AdemÃ¡s estoy implementando un demonio que actualiza la direcciÃ³n IP a la cual deberÃ¡ escribir el servidor remoto los cambios necesarios para la base de datos, pues se busca la idea que el cliente pueda pedir servicios remotamente. Esta interesante la idea pues asi las PYMEs podrÃ¡n contar con servicios que a la vista del usuario comÃºn son iguales a las Empresas grandes.</p>
<p align="justify">Quiero terminar esto pronto para no tener tanto que hacer, no creo excederme mÃ¡s de 2 meses en esto, la verdad ya estoy muy adelantado en estos 2 dÃ­as que llevo trabajando, solo falta la integraciÃ³n con el sistema <span style="font-weight:bold;">real</span>, lo mÃ¡s difÃ­cil probablemente. Por otro lado, quiero seguir avanzando con <a href="http://monouml.sf.net">MonoUML</a> ando muy motivado pues ya le veo mÃ¡s forma :)</p>
<p>
<span style="font-weight: bold;">Nota de hoy</span>: 'Â¿Webservices...? Interesantes.'</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
