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
date: 2006-01-29T23:02:40Z
date_gmt: 2006-01-30 03:02:40 -0500
published: true
status: publish
tags:
- personal
- mono
- english
title: 'Marshaling: C''s struct''s bit fields'
url: /2006/01/29/marshaling-cs-struct-bit-fields/
wordpress_id: 231
wordpress_url: http://mario.monouml.org/index.php/2006/01/29/marshaling-cs-struct-bit-fields/
---

<p>If you are C programmer you might have noticed the existence of the <em>bit fields</em> in structs:</p>
<p><code lang="c">typedef struct {<br />
 	int Some : 1;<br />
 	int Bit : 2;<br />
  	int Fields : 5;<br />
} MyStruct;</code></p>
<p>Marshaling that code could be a pain in the ass. Before all, read <a href=" http://www.jprl.com/interop.html">Jonathan's doc</a>, then forget about the C's sizeof, sum all the bit fields and get the value, in our sample struct we need to get that as 1 byte (<em>1 + 2 + 5 = 8 bits = 1 byte</em>) and then use the <strong>System.Collections.BitArray</strong> class, and convert that to their data type value. (I wrote a wrapper for doing this in a easiest way)</p>
<p>See the <a href="http://www.cs.cf.ac.uk/Dave/C/node13.html">graphical explanation</a> for understanding this.</p>
<p>See this sample</p>
<p><code lang="c">/* libsample.h */</p>
<p>typedef struct {<br />
 	unsigned int Some : 1;<br />
 	unsigned int Bit : 2;<br />
  	unsigned int Fields : 5;<br />
} MyStruct;</p>
<p>MyStruct get_mystruct (void);</p>
<p>int some (void);</code></p>
<p><code lang="c">/* libsample.c */<br />
#include <stdio .h><br />
#include "libsample.h"</p>
<p>MyStruct get_mystruct (void)<br />
{<br />
	MyStruct a;<br />
	a.Some = 0x01; //One bit: 1 - 0<br />
	a.Bit = 0x02; //Two bits: 10 - 2<br />
	a.Fields = 0x1A; //Five bits: 0001 1010 - 26<br />
	//Full return: 1101 1010<br />
	return a;<br />
}</p>
<p>int some (void)<br />
{<br />
	return 0;<br />
}</stdio></code></p>
<p>Then compiling</p>
<p><code lang="sh"><br />
gcc -fPIC -Wall -g -c libsample.c<br />
gcc -g -shared -Wl,-soname,libsample.so.0 \<br />
    -o libsample.so.0.0 libsample.o -lc<br />
/sbin/ldconfig -n .<br />
ln -sf libsample.so.0 libsample.so<br />
</code></p>
<p>Will create the shared libraries, let's see the C# PInvoke.</p>
<p><code lang="csharp">using System;<br />
using System.Collections;<br />
using System.Runtime.InteropServices;</p>
<p>public class Sample<br />
{<br />
    [StructLayout (LayoutKind.Sequential, Size=1, Pack=4)]<br />
    public struct MyStruct<br />
    {<br />
		public byte Value;</p>
<p>		public uint GetSome ()<br />
		{<br />
			BitArray bArray = new BitArray (new byte[] { Value });<br />
			BitFieldFormater a = new BitFieldFormater (bArray);<br />
			return a.GetInt (0, 1);<br />
		}</p>
<p>		public uint GetBit ()<br />
		{<br />
			BitArray bArray = new BitArray (new byte[] { Value });<br />
			BitFieldFormater a = new BitFieldFormater (bArray);<br />
			return a.GetInt (1, 2);<br />
		}</p>
<p>		public uint GetFields ()<br />
		{<br />
			BitArray bArray = new BitArray (new byte[] { Value });<br />
			BitFieldFormater a = new BitFieldFormater (bArray);<br />
			return a.GetInt (3, 5);<br />
		}</p>
<p>		public override string ToString ()<br />
		{<br />
			return "Some "+GetSome ()+" Bit "+GetBit ()+" Fields "+GetFields ();<br />
		}<br />
	}</p>
<p>	[DllImport ("libsample.so")]<br />
	public static unsafe extern MyStruct get_mystruct (); //notice the return value</p>
<p>	[DllImport ("libsample.so")]<br />
	public static unsafe extern int some (); //notice the return value</p>
<p>	public static void Main ()<br />
	{<br />
		MyStruct myStruct = get_mystruct ();<br />
		System.Console.WriteLine ("some (): "+some ());<br />
		System.Console.WriteLine ("get_mystruct (): "+myStruct);<br />
	}<br />
}</code></p>
<p>I'm using thre a class called <strong>BitFieldFormater</strong> for doing the magic:</p>
<p><code lang="csharp">using System;<br />
using System.Collections;</p>
<p>public class BitFieldFormater<br />
{<br />
	public BitFieldFormater (BitArray bitArray)<br />
	{<br />
		_bitArray = bitArray;<br />
	}</p>
<p>	public uint GetUInt (int beginBit, int bitLength)<br />
	{<br />
			if ((beginBit + bitLength) > _bitArray.Count)<br />
				throw new ArgumentException ("Begin bit plus bit length is greater than array's length");</p>
<p>			string requestedString = "";</p>
<p>			//Getting bit values from the BitArray<br />
			for (int i = 0; i < bitLength; i++)<br />
				requestedString = Convert.ToInt32 (_bitArray [beginBit + i]) + requestedString;</p>
<p>			return (uint) BinaryToInteger (requestedString);<br />
	}</p>
<p>	private int BinaryToInteger (string binary)<br />
	{<br />
		char []elements = binary.ToCharArray ();<br />
		int result = 0, i = 0, pow = 0;<br />
		for (i = elements.Length - 1; i >= 0; i--) {<br />
			if (elements[i] == '1')<br />
				result += (int) Math.Pow (2, pow);<br />
			pow++;<br />
		}<br />
		return result;<br />
	}</p>
<p>	private BitArray _bitArray;<br />
}</code></p>
<p>Any bugs, please, let me know. I haven't yet tested this class with structs with byte-size greater than 1... further testing is required.</p>
<p><strong>UPDATED. Feb 3rd.</strong> Lot of useless code removed... <em>what the fuck was I thinking!?</em></p>
