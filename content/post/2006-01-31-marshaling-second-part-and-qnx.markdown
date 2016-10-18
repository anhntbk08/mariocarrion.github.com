---
date: 2006-01-31T00:17:34Z
title: Marshaling, second part, and QNX
url: /2006/01/31/marshaling-second-part-and-qnx.html
---

<p>After testing the class I noticed that works with 2 bytes... and should work with greather lengths, but I still don't like its performance... too many loops... needs further reviewing. BTW, I've fixed the one MonoCanvas bug, now the DnD works in a better way, first release is closer!!</p>
<p>Yesterday I went to bed too late... I was compiling mono in <a href="http://www.qnx.com/">QNX</a>, first, there are missing some details for compiling the Boehm GC and then.. I couldn't finish its compiling due to some <em>-lgthread</em> missing in gcc. Still need "<em>to dive</em>" into the code for fixing these issues.</p>
