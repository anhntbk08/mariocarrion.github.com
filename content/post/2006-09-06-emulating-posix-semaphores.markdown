---
date: 2006-09-06T21:28:53Z
title: Emulating POSIX Semaphores
url: /2006/09/06/emulating-posix-semaphores.html
---

<p>I need to use <a href="http://www.opengroup.org/onlinepubs/009695399/basedefs/semaphore.h.html">POSIX-like semaphores</a> without actually using them in Microsoft Windows, due to don't want to add more dependencies to current project and currently have found their <a href="http://www.codeproject.com/csharp/sharetheresource.asp">PInvoked version to use them</a> in .NET and it seems to work, now based on the <a href="http://www.cs.wustl.edu/~schmidt/win32-cv-1.html">text found</a> am trying to emulate POSIX Semaphore's behavior using Microsoft Win32 Semaphores. Seems quite difficult and I only have two days more to finish its implementation, will do it, have to.</p>
<p>I'm trying to quit smoking, but every time I party I smoke again, might be the habit, drinking and smoking are performed almost at same time.</p>
