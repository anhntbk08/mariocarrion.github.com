---
date: 2006-03-07T22:39:44Z
title: MonoCanvas, improving
url: /2006/03/07/monocanvas-improving.html
---

<p>I said, some time ago, that MonoCanvas will be released past month, February, for some reasons, it didn't, we have implemented a lot of features and some minor ones features are missing, but I still don't like its performance when drawing many shapes. After thinking for a while I've decided to draw-only-those-who-need-drawing, not every shape, this, of course, will improve rendering and redrawing, will consume less resources and will allow a smoother canvas interface.</p>
<p>The idea is simple, but effective, sort when adding shapes, after unpressing mouse button reorder moved-shape/s, this for keeping an ordered shapes-drawn-list. BY doing this will allow us, first to get the shapes that are moved, then calculate who shapes need to be re-drawn and of course by using its position will be faster to know over wich shape we are. I'm still fighting with the improvement of the <a href="http://en.wikipedia.org/wiki/Binary_search">binary search</a> algorithm, but when finished, everything will be very smoother and better.</p>
