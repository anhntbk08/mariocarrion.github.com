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
date: 2006-06-15T22:00:36Z
date_gmt: 2006-06-16 03:00:36 -0400
published: true
status: publish
tags:
- monouml
- development
- english
title: Trip to Reverse Engineering from sources
url: /2006/06/15/trip-to-reverse-engineering-from-sources/
wordpress_id: 287
wordpress_url: http://mario.monouml.org/index.php/2006/06/15/trip-to-reverse-engineering-from-sources/
---

<p>After removing that sort-like code used within the Reverse Engineering from CIL I'm beginning the API writing  to allow Reverse Engineering from sources. <a href="http://rodolfocampero.blogspot.com">Rodolfo</a>, time ago, talked about this idea, I suggested using <a href="https://javacc.dev.java.net/">JavaCC</a> for doing this, he said "<em>Try antlr</em>", now I'm <a href="http://www.antlr.org/">seeing it</a>, trying to build it to then used it in <a href="http://www.monouml.org">MonoUML</a>. </p>
<p>However, I still don't like the idea to include another dependency (ikvm's dll and so on) in MonoUML, there might be a .NET-based parser generator, but Antlr is quite good and there's also <a href="http://www.doc.ic.ac.uk/lab/secondyear/Antlr/csharp-runtime.html">C# support</a>!, however I haven't yet compiled C# runtime, why? there are missing files... you just can't compile it! Not including files in releases drives me crazy, how would I try it and learn it without being able to compile it!?</p>
<p>I'll spend this weekend trying to solve this.</p>
