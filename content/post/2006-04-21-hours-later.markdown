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
date: 2006-04-21T22:51:12Z
date_gmt: 2006-04-22 02:51:12 -0400
published: true
status: publish
tags:
- debian
- english
title: Hours later
url: /2006/04/21/hours-later/
wordpress_id: 271
wordpress_url: http://mario.monouml.org/index.php/2006/04/21/hours-later/
---

<p>And yes.. some hours later, some debs downloaded.. <a href="http://www.gnome.org">GNOME</a> 2.14!! Now I have a mix of GNOME 2.14 and 2.12, but runs quite good, faster and I just love it! :)</p>
<p>Today two things happened, first I noticed that we will use <a href="http://www.freedesktop.org/wiki/Software/dbus">dbus</a> for <a href="http://en.wikipedia.org/wiki/Inter-process_communication">IPC</a>, great news! second, 6 seconds delays is too much, need to increase performance in my current development less delay is better.</p>
<p><a href="http://static.flickr.com/52/132648230_71302b8b2d_o.png"><img src="http://static.flickr.com/52/132648230_71302b8b2d_m.jpg" alt="GNOME 2.14" /></a></p>
<p>BTW, Using testing/unstable is quite risky but I like living in the edge, however even I'm running testing/unstable the <a href="http://ndiswrapper.sourceforge.net/">ndiswrapper</a> packages for current kernel aren't packaged, yet, at least officially, so if you are using a ndiswrapper-enabled wireless card, you need to add:</p>
<pre>deb http://puga.vdu.lt/debian sarge main
deb-src http://puga.vdu.lt/debian sarge main
deb http://puga.vdu.lt/debian sid main
deb-src http://puga.vdu.lt/debian sid main</pre>
<p>to your <em>sources.lists</em>, works for me. Don't forget: </p>
<p><code># apt-get install wireless-tools</code></p>
<p><strong>Update</strong>: ndiswrapper stills crashes, if you enable it using <em>/etc/modules</em> crashes kernel, sometimes works some others crashes keyboard... so.. still unstable, will wait for next ndiswrapper relase.</p>
