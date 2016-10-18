---
date: 2007-02-25T15:52:19Z
title: Emulating reflection in C
url: /2007/02/25/emulating-reflection-c.html
---

<p>Have your ever wonder how to emulate C#/Java Reflection in C Shared Objects? If you are using GObject to build your applications and/or your libraries, then you won't have any problem to do so. I hope having more free time on next weeks to allow me write a simple example to do so. Basically you need to define an interface to dlopen your Shared Objects, then call an GInterface to initialize your custom GType and then other GInterface to get GTypes defined in your shared obejct, then by using <em>g_type_from_name ()</em> you will be able to "play" with your objects.</p>
