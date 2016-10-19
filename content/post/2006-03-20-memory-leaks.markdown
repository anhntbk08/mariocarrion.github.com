---
date: 2006-03-20T13:40:42Z
title: Memory leaks
url: /2006/03/20/memory-leaks.html
---

<p>I still remember when programming in <a href="http://en.wikipedia.org/wiki/Java_platform">Java</a> was nice and very efficient (before of <a href="http://en.wikipedia.org/wiki/C_Sharp">C#</a> of course), <a href="http://en.wikipedia.org/wiki/Garbage_collection_(computer_science)">Gargabe Collector</a> was (and still is), in that time (and before of that time) an awesome thing. However memory leaks aren't like that, I mean, not literally, because later of using the objects and setting them to be <em>finalized</em> takes too much time being released. I remember that same behavior in Java's GC when using <a href="http://java.sun.com/products/java-media/jmf/">JMF</a> and the solution was the same. Nodaways  while doing final performance tests in my current development, at work, and I notice this behavior. The solution is simple: <em>System.GC.Collect(); System.GC.WaitForPendingFinalizers ();</em>, but it needs to be used carefully, calling that two sentences everytime increases CPU usage and of course reduces application performance. The idea of using the GC <strong>every time needed</strong> (NOT EVERY TIME) (lets say every minute) stops "<em>eating your memory</em>".</p>
