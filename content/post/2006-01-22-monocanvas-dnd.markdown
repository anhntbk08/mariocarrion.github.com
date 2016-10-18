---
date: 2006-01-22T18:20:19Z
title: MonoCanvas' DnD
url: /2006/01/22/monocanvas-dnd.html
---

<p>Using graphics for representing ideas is quite usefull and the "DnD idea" is really good. Dragging and dropping represents the idea of adding, moving or sending information from a source to a target. I've been playing with this idea this week and I'm happy with this preview. There are bugs, I found two, <em>Cursor bug</em>, doesn't change when starting dragging and <em>drag-begin</em> bug that doesn't call the IDraggable.DragBegin when should be.</p>
<p>I did an implementation based on a mix of <a title="Gtk#" target="_blank" href="http://gtk-sharp.sf.net">Gtk#</a>'s and <a title="SWF" target="_blank" href="http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemwindowsforms.asp">System.Windows.Forms</a>' DnD methods, comments are allowed and hearing/reading them would be very nice. The idea using two interfaces that represent the <em>Draggable</em> and the <em>Droppable</em> shapes, current implementation is</p>
<p><a title="MonoCanvas" target="_blank" href="http://static.flickr.com/15/89888879_f64faaa81e_o.png"><img title="MonoCanvas'" alt="MonoCanvas'" src="http://static.flickr.com/15/89888879_f64faaa81e_m.jpg" /></a></p>
<p>which means:</p>
<p><img title="MonoCanvas' DnD sample " alt="MonoCanvas' DnD sample " src="http://static.flickr.com/25/89897339_e669f4364b.jpg" /></p>
<p>I did a <a target="_blank" title="MonoCanvas" href="http://mario.monouml.org/files/monocanvas.htm">sample screencast</a>.</p>
