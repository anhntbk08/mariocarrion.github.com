---
date: 2006-09-24T20:14:09Z
title: Shared Memory in Mono, 3rd session
url: /2006/09/24/shared-memory-in-mono-3rd-session.html
---

<p>After installing latest <a href="http://www.mono-project.com">mono</a> version, 1.1.17.1 to be precise, older <a href="http://mario.monouml.org/index.php/2006/09/16/systemexecutionengineexception">System.ExecutionEngineException</a> seems to be fixed "<em>automagically</em>", I noticed the correction after executing same code and everything worked, shared memory device appear and after <a href="http://www.opengroup.org/onlinepubs/000095399/functions/ftruncate.html">ftruncating</a>, the correct size was set, however now am having a few issues related to file permissions. Wrapping POSIX shared memory is a real challenge due to several UNIX implementations, I mean, for the "end developer" is always the same, you use the same constants and so on, but there are some internal details to take care on while wrapping.</p>
<p>A lot of work to do.</p>
