---
date: 2006-05-05T23:57:21Z
title: Thinking before redrawing
url: /2006/05/05/thinking-before-redrawing.html
---

<p><a href="http://ceronman.blogspot.com">Manuel</a> show me some <a href="http://primates.ximian.com/~federico/news-2006-04.html#28">nice samples</a> written by <a href="http://primates.ximian.com/~federico/index.html">Federico</a> for a better-redrawing, I ported the samples (<a href="http://mario.monouml.org/files/RulerSlow.cs">RulerSlow</a> and <a href="http://mario.monouml.org/files/RulerFast.cs">RulerFast</a>) to C#. The idea is to improve redrawing in MonoCanvas, I also found two usefull methods <a href="http://www.go-mono.com/docs/monodoc.ashx?link=M%3aGdk.Window.FreezeUpdates()">Gdk.Window.FreezeUpdates</a> and <a href="http://www.go-mono.com/docs/monodoc.ashx?link=M%3aGdk.Window.ThawUpdates()">Gdk.Window.ThawUpdates</a> for avoiding not-needed drawing,  in the SWF world their equivalents would be <a href="http://msdn2.microsoft.com/en-us/library/system.windows.forms.control.suspendlayout(VS.80).aspx">System.Windows.Forms.Control.SuspendLayout</a> and <a href="http://msdn2.microsoft.com/en-us/library/bw3cytx0(vs.80).aspx">System.Windows.Forms.Control.ResumeLayout</a>.</p>
