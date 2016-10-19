---
date: 2004-07-08T16:08:45Z
title: The new revelation
url: /2004/07/08/the-new-revelation.html
---

<div style="clear:both;"></div>
<p>I've been waiting too much for the diacanvas binding for c#, diacanvas#, so I started to search and I found the binding for python, I'm shocked! Python is so awesome!, Unbelievable!! and Glade... too many emotions for one long night, the libglade is the best. Anyway I will start coding my CASE tools using Python/PyGTK/diacanvas maybe I'll port them to C#/GTK#/diacanvas# later... maybe not.<br />
Check this code out:<br />
<code><br />
import pygtk<br />
pygtk.require('2.0')<br />
import gtk<br />
import gtk.glade</p>
<p>xml = gtk.glade.XML('sample.glade') #You build some GUI using glade, name project: 'sample'<br />
xml.connect('destroy',mainquit)<br />
mainloop()<br />
</code><br />
Today's new packages:<br />
<strong># apt-get install python-gnome2-dev python-gnome2 python2.3-glade2 python-gtk2-dev python2.3-diacanvas2</strong><br />
I just like debian testing/unstable, too exciting!!
<div style="clear:both; padding-bottom: 0.25em;"></div>
