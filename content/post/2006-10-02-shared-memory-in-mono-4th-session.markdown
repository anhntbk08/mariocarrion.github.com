---
date: 2006-10-02T23:47:41Z
title: Shared Memory in Mono, 4th session
url: /2006/10/02/shared-memory-in-mono-4th-session.html
---

<p>Mono includes Mono.Unix.Native, so flagging is made easy:</p>
<p><code lang="csharp">using System;<br />
using System.Runtime.InteropServices;</p>
<p>namespace Mono.Unix.Native<br />
{<br />
   public class SharedMemory<br />
   {<br />
      [DllImport("librt", EntryPoint="shm_open", CharSet=CharSet.Auto)]<br />
      public static extern IntPtr Open (string name, OpenFlags oflag,<br />
         FilePermissions mode_t);</p>
<p>      [DllImport("libc", EntryPoint="ftruncate")]<br />
      public static extern int FTruncate (IntPtr fildes, int length);</p>
<p>      [DllImport("libc", EntryPoint="mmap")]<br />
      public unsafe static extern byte* MMap (int addr, int len,<br />
         MmapProts prot, MmapFlags flags, IntPtr fildes, int off);</p>
<p>      public unsafe static void Main (string []args)<br />
      {<br />
         int int_sizeof = sizeof (int) * 22;<br />
         SharedMemory m = new SharedMemory ();<br />
         IntPtr filedes = SharedMemory.Open ("myregion",<br />
            OpenFlags.O_CREAT | OpenFlags.O_RDWR,<br />
            FilePermissions.S_IRUSR | FilePermissions.S_IWUSR);<br />
         int res = SharedMemory.FTruncate (filedes, int_sizeof);<br />
         byte* len = SharedMemory.MMap (0, int_sizeof,<br />
            MmapProts.PROT_READ | MmapProts.PROT_WRITE,<br />
            MmapFlags.MAP_SHARED, filedes, 0);<br />
         Console.WriteLine ("Open: "+filedes+" FTruncate: "+<br />
            res+" v "+(len!=null));<br />
      }<br />
   }<br />
}</code></p>
<p>Above example is a quick port of the <a href="http://www.opengroup.org/onlinepubs/000095399/functions/shm_open.html">OpenGroup example</a>. There's still missing the "<em>real writing</em>". Compile with:</p>
<p><code>mcs -unsafe SharedMemory.cs -out:SharedMemory.exe -r:System.dll -r:Mono.Posix.dll</code></p>
<p>Don't forget to do</p>
<p><code>ls -la /dev/shm</code></p>
<p>to see your shared memory mapped file.</p>
