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
  content: Awesome, really cool example.
  date: 2007-09-17 22:29:26 -0400
  date_gmt: 2007-09-18 04:29:26 -0400
  id: 10935
date: 2007-09-17T20:47:13Z
date_gmt: 2007-09-18 02:47:13 -0400
published: true
status: publish
tags:
- monohotdraw
- development
- english
title: 'MonoHotDraw: Clock'
url: /2007/09/17/monohotdraw-clock/
wordpress_id: 415
wordpress_url: http://mario.monouml.org/index.php/2007/09/17/monohotdraw-clock/
---

<p>Since past month, I've working on the MonoHotDraw documentation to learn about its internal API. Learning MonoHotDraw is not that difficult, I recommend you to read a little about Design Patterns for a better and faster MonoHotDraw's API understanding, however if you have already read <a href="http://en.wikipedia.org/wiki/Design_Patterns">GoF's Design Patterns</a> you are ready to go!</p>
<p>While documenting I decided to implement an example including the most important features already implemented on MonoHotDraw to draw an interactive widget figure. Inspired on the<a href="http://gnomejournal.org/article/34/writing-a-widget-using-cairo-and-gtk28"> GNOME Journal's analog clock</a> I decided to implement the analog MonoHotDraw clock.</p>
<p><a href="http://www.flickr.com/photos/mariocarrion/1376357913/" title="Photo Sharing"><img src="http://farm2.static.flickr.com/1145/1376357913_c0e2d58fa1_m.jpg" width="240" height="150" alt="Clock sample" /></a></p>
<p>The preview is here:</p>
<p><object width="425" height="353"><param name="movie" value="http://www.youtube.com/v/0fR50us42Sg"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/0fR50us42Sg" type="application/x-shockwave-flash" wmode="transparent" width="425" height="353"></embed></object></p>
<p>This sample lead me to find the invalidation-region bug. <a href="http://www.monouml.org/doku.php/downloads">Checkout</a> the code from SVN and have fun.</p>
