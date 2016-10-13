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
date: 2006-11-06T22:22:47Z
date_gmt: 2006-11-07 04:22:47 -0500
published: true
status: publish
tags:
- mono
- development
- english
title: Marshalling problem, explained
url: /2006/11/06/marshalling-problem-explained/
wordpress_id: 349
wordpress_url: http://mario.monouml.org/index.php/2006/11/06/marshalling-problem-explained/
---

<p>I commented this <a href="http://mario.monouml.org/index.php/2006/10/30/marshalling-problems-again/">days ago</a>, now here comes the explanation.</p>
<p>The idea is the following, you have to send through sockets a marshalled structure, this structure will be received by socket server written in C. Then, for example I have:</p>
<p><code lang="C">#pragma pack (1)<br />
struct sample {<br />
    int index;<br />
    int length; /* Indicates value length */<br />
    char *value; /* This value might be any value */<br />
};<br />
typedef struct sample sample_t;<br />
#pragma end<br />
</code></p>
<p>That C structure, in C# is, after marshalling:</p>
<p><code lang="CSharp">[StructLayout (LayoutKind.Sequential, Pack = 1, CharSet = CharSet.Ansi)]<br />
public struct Sample<br />
{<br />
    public int Index;<br />
    public int DataLength;<br />
    [MarshalAs (UnmanagedType.ByValArray, ArraySubType = UnmanagedType.I1, SizeConst = 1)]<br />
    public byte []Data;<br />
}</code></p>
<p>We have our marshalled C# structure. Did you notice the <em>SizeConst</em> value? Well that SizeConst, will, when using <em>Marshal.SizeOf (typeof (Sample))</em>, return a <em>structure known-bytes size</em>. If you are planning to use real-sized structure you MUST marshall them, and there comes the pain. Why? Because you actually need to know about bytes and size of each element send or received by differents processes, in this example, through IP sockets.</p>
<p>C structure uses a dynamic array and I want to use it that way. By setting the size to 1 in C# structure forces me to use 1 byte instead. Really problematic isn't it? Until today I haven't yet found the way to do it automatically. My solution is to use <em>Array.Copy</em> to copy the marshalled value (value contained in the <em>byte[]</em>) after the full structure was marshalled, it works, but isn't too fancy, and when using a Structure that contains a byte[] and setting into that byte[] another Structure that also contains byte[] the problems increase because you need to <em>Array.Copy</em> each one of them.</p>
<p>By the way, I'm using the <a href="http://groups.google.com/group/microsoft.public.dotnet.languages.csharp/msg/7e43c0f0613adce1">"google solution"</a> to marshall .NET structures to byte[], am not sure who is the original author of the following code, but seems to be solution to convert from any marshalled structure to bytes array, and viceversa:</p>
<p><code lang="CSharp">public static object RawDeserialize (byte[] rawdatas, Type anytype) {<br />
   int rawsize = Marshal.SizeOf (anytype);<br />
   if (rawsize > rawdatas.Length)<br />
      return null;<br />
   GCHandle handle = GCHandle.Alloc (rawdatas, GCHandleType.Pinned);<br />
   IntPtr buffer = handle.AddrOfPinnedObject ();<br />
   object retobj = Marshal.PtrToStructure (buffer, anytype);<br />
   handle.Free ();<br />
   return retobj;<br />
}</p>
<p>public static byte[] RawSerialize (object anything)<br />
{<br />
   int rawsize = Marshal.SizeOf (anything);<br />
   byte[] rawdatas = new byte [rawsize];<br />
   GCHandle handle = GCHandle.Alloc (rawdatas, GCHandleType.Pinned);<br />
   IntPtr buffer = handle.AddrOfPinnedObject ();<br />
   Marshal.StructureToPtr (anything, buffer, false);<br />
   handle.Free ();<br />
   return rawdatas;<br />
}</code></p>
<p>Be aware that are some <a href="http://www.mono-project.com/Dllimport">tips&tricks</a> while marshalling and you must follow each one of them. Because we are living in <em>managed world</em> and unmanaged is almost a sin.</p>
