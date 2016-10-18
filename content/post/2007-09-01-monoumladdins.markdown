---
date: 2007-09-01T21:56:44Z
title: MonoUml.Addins
url: /2007/09/01/monoumladdins.html
---

<p>When I started the current version of MonoUML.ReverseEngineering, <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> suggested me to check Mono.Addins, well now I've done so. <a href="http://www.mono-project.com/Mono.Addins">Mono.Addins</a> is a library written by <a href="http://foodformonkeys.blogspot.com/">Lluis Sanchez</a> to allow easy addin-like systems development, for example, <a href="http://www.monodevelop.org/">MonoDevelop</a> is currently using this library.</p>
<p>So what's the relation with MonoUML? Well, right now, I'm starting to define the Core of the library that will be used for an addin-like system, of course using Mono.Addins, to change the current MonoUML implementation into an addins system. My ideas are the following:</p>
<p><a href="http://www.flickr.com/photos/mariocarrion/1300023856/" title="Photo Sharing"><img src="http://farm2.static.flickr.com/1080/1300023856_7689d3171b_m.jpg" width="219" height="240" alt="MonoUml.Addins" /></a></p>
<p>Of course, this my first draft and changes may be without any warning. I have to define the signature of each interface trying to define the most generic ones. I will start changing <a href="http://www.monouml.org/doku.php/reverseengineering">MonoUml.ReverseEngineering</a> component to this new effort.</p>
<p>I think this will be the biggest change on the MonoUML Architecture defined years ago. Read the <a href="https://blueprints.launchpad.net/monouml/+spec/monouml-addins">Blueprint</a> for more information.</p>
