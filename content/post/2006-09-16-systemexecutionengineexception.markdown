---
date: 2006-09-16T00:40:59Z
title: System.ExecutionEngineException
url: /2006/09/16/systemexecutionengineexception.html
---

<p>I'm starting the Mono POSIX shared memory wrapping, decided to begin <a href="http://www.mono-project.com/Dllimport">dllimporting</a> <a href="http://www.opengroup.org/onlinepubs/007908799/xsh/shm_open.html">shm_open</a>, however doesn't seems to be easy at all, my current effort is:</p>
<p><code lang="csharp">using System;<br />
using System.Runtime.InteropServices;</p>
<p>namespace Mono.Posix {<br />
	public class SharedMemory<br />
	{<br />
		public SharedMemory ()<br />
		{ }</p>
<p>		[DllImport ("librt", EntryPoint="shm_open", CharSet=CharSet.Ansi,<br />
			CallingConvention=CallingConvention.StdCall)]<br />
		public static extern IntPtr Open (<br />
			[MarshalAs (UnmanagedType.LPStr)] string name,<br />
			int oflag,<br />
			int mode_t);</p>
<p>		public static void Main (string []args)<br />
		{<br />
			//O_RDONLY = 00<br />
			//O_WRONLY = 01<br />
			//O_RDWR = 02<br />
			SharedMemory m = new SharedMemory ();<br />
			SharedMemory.Open ("test", 0, 777);<br />
		}<br />
	}<br />
}</code></p>
<p>After compiling and running, I get:</p>
<p><code lang="none">SharedMemory.cs(22,17): warning CS0219: The variable `m' is assigned but its value is never used<br />
Compilation succeeded - 1 warning(s)</p>
<p>Unhandled Exception: System.ExecutionEngineException: SIGILL<br />
  at [0x00000] unknown method<br />
  at (wrapper managed-to-native) Mono.Posix.SharedMemory:Open (string,int,int)<br />
  at Mono.Posix.SharedMemory.Main (System.String[] args) [0x00000]</code></p>
<p>Ignore the warning and notice the <a href="http://en.wikipedia.org/wiki/SIGILL">SIGILL</a> related exception, may it be something about current marshaling? Will again, but later, I need to rest, tomorrow will wake up earlier.</p>
