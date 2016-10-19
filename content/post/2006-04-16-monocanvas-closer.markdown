---
date: 2006-04-16T15:24:15Z
title: MonoCanvas, closer.
url: /2006/04/16/monocanvas-closer.html
---

<p>The updating to the Gtk# based version is closest ever, I'm missing Copy&Paste, DnD and MonoCanvas.Line, no doubt Line's implementation will take some time due to behavioral details when line is "glued" to other elements, after finishing it first release will hit the streets. While implementing this API I've been testing performance against its older brother, and yes, works better and faster, I was worried about this last solution wouldn't choose any other if this fails! :-P. I feel exaggerating is good to test your application in the <a href="http://www.worstcasescenarios.com/">worst case scenario</a>, some kind of extremist but doing it that way feels better.</p>
<p>Subclassing Shapes in MonoCanvas is easy, you need to implement the InnerElement, usually the drawn element, and subclass from ShapeGroup. The following is a sample that would be Actor class, spplited in ActorElement.cs:</p>
<p><code lang="csharp">using System;<br />
using Drawing = System.Drawing;<br />
using MonoCanvas;</p>
<p>namespace MonoCanvasGtkSharp<br />
{</p>
<p>	public class ActorElement : Element<br />
	{</p>
<p>		public ActorElement () : base ()<br />
		{ }</p>
<p>		public override void Draw (Drawing.Graphics graphics)</p>
<p>		{<br />
			Drawing.Rectangle r = base.Rectangle;<br />
			int headWidth = r.Width / 3;<br />
			int headHeight = r.Height / 4;</p>
<p>			Drawing.Rectangle head = new Drawing.Rectangle (<br />
                                          headWidth, 0,<br />
                                          headWidth, headHeight);<br />
			graphics.FillEllipse (base.Brush, head);</p>
<p>			graphics.DrawEllipse (base.Pen, head);</p>
<p>			int half = r.Width / 2;<br />
			graphics.DrawLine (base.Pen, half,<br />
				headHeight, half / 2, headHeight * 2);<br />
			graphics.DrawLine (base.Pen, half,<br />
				headHeight, r.Width - half / 2, headHeight * 2);</p>
<p>			graphics.DrawLine (base.Pen, half,<br />
				headHeight, half, headHeight * 3);</p>
<p>			graphics.DrawLine (base.Pen, half,<br />
				headHeight * 3, half / 2, r.Height);<br />
			graphics.DrawLine (base.Pen, half,<br />
				headHeight * 3, r.Width - half / 2, r.Height);</p>
<p>		}<br />
	}</p>
<p>}</code></p>
<p>And ActorShape.cs:</p>
<p><code lang="csharp">using Gtk;<br />
using Gdk;<br />
using System;<br />
using MonoCanvas;</p>
<p>namespace MonoCanvasGtkSharp<br />
{</p>
<p>	public class ActorShape : ShapeGroup<br />
	{</p>
<p>		public ActorShape () : base ()<br />
		{<br />
			base.InnerElement = new ActorElement ();<br />
			base.AddShape (new TextShape ("Actor name",<br />
			                            base.X, base.Y + base.Height,<br />
			                            100, 20), true);<br />
		}<br />
	}</p>
<p>}</code></p>
<p>Notice the following, ActorElement class only draws the Actor but might be doing other things, the second parameter of ShapeGroup.AddShape, determines Shape's independece, meaning that the Shape is allowed to act as an Independent Shape (Moved and Resizing be dragging). This is a quick sample for subclassing MonoCanvas, the idea is to be easy and rapid to implement to create UMLCanvas.</p>
<p>
<a href="http://static.flickr.com/49/129576985_89196c3a24_o.png"><img src="http://static.flickr.com/49/129576985_89196c3a24_m.jpg" alt="MonoCanvas' actor" /></a>&nbsp;&nbsp;<a href="http://static.flickr.com/53/129576984_3d516dbc14_o.png"><img src="http://static.flickr.com/53/129576984_3d516dbc14_m.jpg" alt="MonoCanvas' actor" /></a></p>
