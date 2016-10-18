---
date: 2006-10-13T11:46:49Z
title: Booting QNX6
url: /2006/10/13/booting-qnx6.html
---

<p>Months ago I succed booting <a href="http://www.qnx.com">QNX6</a> with <a href="http://www.gnu.org/software/grub/">GRUB</a>, to allow booting both <a href="http://www.debian.org">Debian</a> and QNX6. <a href="http://www.gnu.org/software/grub/manual/grub.html#QNX">GRUB's manual</a> says it all, however a minor change was needed to acomplish this task.</p>
<pre>grub&gt; rootnoverify (hd1,1)
grub&gt; makeactive
grub&gt; chainloader +4
grub&gt; boot</pre>
