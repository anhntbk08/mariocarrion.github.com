---
date: 2006-03-19T23:58:39Z
title: Answer = Gtk.EventBox
url: /2006/03/19/answer-gtkeventbox.html
---

<p>I don't usually send emails to mailing lists that am subscribed to and wait for an answer, when I do is because I couldn't find any solution to my problem or, in the other way, want to announce something (like our <a href="http://www.monohispano.es">Mono Hispano</a> ezine!). However I (think that) finally find the answer ('cause still needs further testing) for bringing-to-front widgets drawn in a <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a981%23Layout%2f">Gtk.Layout</a>, using the following code as primary sample:</p>
<p><code lang="csharp">using Gtk;<br />
using System;</p>
<p>public class Sample<br />
{<br />
        public static void Main ()<br />
        {<br />
                Application.Init ();<br />
                Window window = new Window ("");<br />
                Layout layout = new Layout (new Adjustment (IntPtr.Zero),<br />
                                        new Adjustment (IntPtr.Zero));<br />
                Button b1 = new Button ("1");<br />
                Button b2 = new Button ("2");<br />
                layout.Put (b1, 10, 20);<br />
                layout.Put (b2, 15, 15);<br />
                ScrolledWindow scrolled = new ScrolledWindow ();<br />
                scrolled.AddWithViewport (layout);<br />
                window.Add (scrolled);<br />
                window.ShowAll ();<br />
                Application.Run ();<br />
        }<br />
}</code></p>
<p>You will notice the overlap of <em>b2</em> over <em>b1</em>, if you switch lines <em>b1</em> overlaps <em>b2</em>, however, there isn't a solution for doing this after showing the <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a1358%23Window%2f">Gtk.Window</a>.</p>
<p>Solution? Use <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a851%23EventBox%2f">Gtk.EventBox</a>, after reading <a href="http://article.gmane.org/gmane.comp.gnome.gtk%2B.devel.general/3108">gmane's archive</a> I figured it out! However I didn't know <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a708%23Button%2f">Gtk.Button</a> doesn't owns a <a href="http://www.go-mono.com/docs/monodoc.ashx?tlink=5@ecma%3a1358%23Window%2f">Gdk.Window</a>, by don't owning a Gdk.Window, Gtk.Button draws over anything (or any other Gdk.Windowless-widget) so, that might the problem am facing recently. Using Gdk.Window.Lower (), <em>sends to back</em>, Next code shows solution: </p>
<p><code lang="csharp">using Gtk;<br />
using System;</p>
<p>public class Sample<br />
{<br />
        public static void Main ()<br />
        {<br />
                Application.Init ();<br />
                EventBox e1 = new EventBox ();<br />
                EventBox e2 = new EventBox ();<br />
                Window window = new Window ("");<br />
                Layout layout = new Layout (new Adjustment (IntPtr.Zero),<br />
                                        new Adjustment (IntPtr.Zero));<br />
                layout.Add (e1);<br />
                layout.Add (e2);<br />
                Button b1 = new Button ("1");<br />
                b1.Clicked += new EventHandler (ButtonClick);<br />
                e1.Add (b1);<br />
                Button b2 = new Button ("2");<br />
                b2.Clicked += new EventHandler (ButtonClick);<br />
                e2.Add (b2);<br />
                layout.Move (e1, 10, 20);<br />
                layout.Move (e2, 15, 15);<br />
                ScrolledWindow scrolled = new ScrolledWindow ();<br />
                scrolled.AddWithViewport (layout);<br />
                window.Add (scrolled);<br />
                window.ShowAll ();<br />
                Application.Run ();<br />
        }</p>
<p>        public static void ButtonClick (object o, EventArgs a)<br />
        {<br />
                Button b = o as Button;<br />
                b.GdkWindow.Raise ();<br />
        }<br />
}</code></p>
<p>Nice!. By the way, <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> and I improved <a href="http://www.monouml.org">MonoUML</a> a little bit, now <a href="http://www.monouml.org">MonoUML</a> gots its <em>history navigator</em></p>
<p><img src="http://static.flickr.com/37/115128198_a6492cc304_o.png" alt="MonoUML's history navigator" /></p>
