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
comments: []
date: 2007-01-23T20:54:05Z
date_gmt: 2007-01-24 02:54:05 -0500
published: true
status: publish
tags:
- personal
- english
title: Connection reset by peer
url: /2007/01/23/connection-reset-by-peer/
wordpress_id: 376
wordpress_url: http://mario.monouml.org/index.php/2007/01/23/connection-reset-by-peer/
---

<p>I've been too busy nowadays due to work, our project should start next month, we are closing those weird and awful yesterday-was-working bugs. Most recent bug includes one related to sockets. I have a C-written socket server that sends and receives (but send more than receives) and a in the other side there is the C#-written socket client that does the opposite, I don't know why since past Monday started to throw <em>Connection reset by peer</em>, after googling all around finally found the solution: to set both buffers to its default value 8192 bytes, according to MSDN and some links I read that value should be the default one, however it didn't work until I forced that value and now is working like a charm!</p>
<p>Now I have less things to in my <em>Cycle's TODO list</em>.</p>
