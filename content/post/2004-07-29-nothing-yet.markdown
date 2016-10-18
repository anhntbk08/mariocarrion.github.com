---
date: 2004-07-29T11:49:12Z
title: Nothing yet
url: /2004/07/29/nothing-yet.html
---

<div style="clear:both;"></div>
<p>After a long testing time I feel too tired, frustated and I'm start thinking to modify directly the C code, the DiaShapes doesn't appear why? I don't know, they just doesn't. Anyway, there are people who want to help but I can't make it work, any idea?. Lets look my class, still doesn't work but... check it out:</p>
<pre clang="csharp">
using Dia;
using System;
using GLib;
	
namespace UML
{
    public class Comment :  CanvasElement
    {
        Shape myShape, myShape1;
        CanvasIter tempX;
	
        static GLib.GType gtype;
	
        static Comment()
        {
            gtype = RegisterGType (typeof (Comment));
        }
	
        public Comment() : base(gtype)
        {
            initShapes();
        }
	
        private void initShapes()
        {
            this.Height = 150;
            this.Width = 150;
            this.myShape = new Shape(Dia.ShapeType.Path);
            this.myShape1 = new Shape(Dia.ShapeType.Image);
            this.Move(00.0, 00.0);
        }
	
        protected override void OnNeedUpdate()
        {
	
            this.myShape = new Shape(Dia.ShapeType.Path);
            this.myShape.Color = 8327327;
            this.myShape.Line(new Dia.Point(50.0,0.0), new         Dia.Point(50.0,0.0));
            this.myShape.Visibility = Dia.ShapeVisibility.Visible;
	
            this.myShapeX1 = new Shape(Dia.ShapeType.Path);
            this.myShapeX1.Color = 8327327;
            this.myShapeX1.Line(new Dia.Point(170.0,0.0), new Dia.Point(150.0,100.0));
	
            this.tempX = CanvasIter.New(this.Handle);
            this.GetShapeIter(tempX);
    }
	
        public new bool ShapeNext(CanvasIter iter)
        {
            if (iter.Data[0] == this.myShape.Handle)
            {
                iter.Data[0] =             this.myShape1.Handle;
                iter.Data[1] = this.myShape1.Handle;
                return true;
            }
            else if (iter.Data[0] == this.myShape1.Handle)
            {
                return false;
            }
            else
            {
                iter.Data[0] = this.myShape.Handle;
                iter.Data[1] = this.myShape.Handle;
                return true;
            }
        }
	
        public new bool GetShapeIter(CanvasIter iter)
        {
            this.myShape = new Shape(Dia.ShapeType.Path);
            iter.Data[0] = this.myShape.Handle;
            while (this.ShapeNext(iter));
            return true;
        }
    }
}
</pre>
<p>By the way, I haven't slept too much, I feel a a few tired but I need to keep going.</p>
<p>I learned yesterday: 'I should start learning long time ago, not today'</p>
<p>PS. I don't want to be dramatic, but I miss her.
<div style="clear:both; padding-bottom: 0.25em;"></div>
