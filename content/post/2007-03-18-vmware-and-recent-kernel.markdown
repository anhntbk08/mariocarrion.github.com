---
author:
  display_name: Mario Carrion
  email: mario@carrion.ws
  login: mario
  url: http://blog.mariocarrion.com/
author_email: mario@carrion.ws
author_login: mario
author_url: http://blog.mariocarrion.com/
categories:
- english
comments:
- author: ceronman
  author_email: ceronman@gmail.com
  author_url: http://wiki.freaks-unidos.net/weblogs/ceronman
  content: "Otra buena soluciÃ³n es usar el parche que estÃ¡ en esta pÃ¡gina: \r\n\r\nhttp://knihovny.cvut.cz/ftp/pub/vmware/\r\n\r\nPor
    cierto, Â¿ya has probado VirtualBox? a mi me ha funcionado de maravilla. Algunas
    cosas las maneja mucho mejor que vmware, otras no tanto. A mi me ha gustado mucho.
    Aunque el nuevo VMWare 6 beta se ve bastante bueno, lÃ¡stima que sÃ³lo se pueda
    usar con la opciÃ³n de debug activado."
  date: 2007-03-18 15:42:29 -0400
  date_gmt: 2007-03-18 21:42:29 -0400
  id: 5200
- author: Mario CarriÃ³n
  author_email: mario@monouml.org
  author_url: http://mario.monouml.org
  content: Lo probarÃ© ya mismo para ver que tal funciona, porque es cierto el VMWare
    en algunas cosas es muy lento.
  date: 2007-03-19 15:38:59 -0400
  date_gmt: 2007-03-19 21:38:59 -0400
  id: 5208
date: 2007-03-18T14:29:29Z
date_gmt: 2007-03-18 20:29:29 -0400
published: true
status: publish
tags:
- development
- english
title: VMware and recent kernel
url: /2007/03/18/vmware-and-recent-kernel/
wordpress_id: 382
wordpress_url: http://mario.monouml.org/index.php/2007/03/18/vmware-and-recent-kernel/
---

<p>If you are having problems compiling VMWare Modules (5.5.3) while using any recent kernel version (>= 2.6.19), <a href="http://www.vmware.com/community/thread.jspa?threadID=65982&tstart=30">read the forums</a> to solve your problem, basically you need to comment out the line: </p>
<p><code lang="c">static inline _syscall1(int, compat_exit, int, exit_code); </code></p>
<p>after unpackaging the <em>vmmon.tar</em>, next tar it again and you are ready to install VMware.</p>
