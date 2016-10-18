---
date: 2007-03-18T14:29:29Z
title: VMware and recent kernel
url: /2007/03/18/vmware-and-recent-kernel.html
---

<p>If you are having problems compiling VMWare Modules (5.5.3) while using any recent kernel version (>= 2.6.19), <a href="http://www.vmware.com/community/thread.jspa?threadID=65982&tstart=30">read the forums</a> to solve your problem, basically you need to comment out the line: </p>
<p><code lang="c">static inline _syscall1(int, compat_exit, int, exit_code); </code></p>
<p>after unpackaging the <em>vmmon.tar</em>, next tar it again and you are ready to install VMware.</p>
