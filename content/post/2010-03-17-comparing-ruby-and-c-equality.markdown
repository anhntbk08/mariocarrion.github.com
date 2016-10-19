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
comments:
- author: sukru
  author_email: stikves@hotmail.com
  author_url: ""
  content: "There is a small mixup in titles:\r\n \"Method equal?\"\r\n and \"Operator
    equals (==)\" are swapped i Ruby section.\r\n\r\nAlso while base C# object.Equals
    implementation is as you describe (reference for reference, bitwise for value),
    sub-classes are able to (and often do) implement value equality by overriding
    the method:\r\n\r\nhttp://msdn.microsoft.com/en-us/library/bsc2ak47.aspx\r\n\r\nNote
    that a derived type might override the Equals  method to implement value equality.
    Value equality means the compared objects have the same value even though they
    have different binary representations. For example, consider two Decimal  objects
    that represent the numbers 1.10 and 1.1000. The Decimal  objects do not have bitwise
    equality because they have different binary representations to account for the
    different number of trailing zeroes. However, the objects have value equality
    because the numbers 1.10 and 1.1000 are considered equal for comparison purposes
    since the trailing zeroes are insignificant."
  date: 2010-03-17 14:54:45 -0400
  date_gmt: 2010-03-17 19:54:45 -0400
  id: 15009
- author: Mario Carrion
  author_email: mario@carrion.mx
  author_url: http://blog.carrion.ws/
  content: I <strong>totally</strong> agree with you, overriding <em>Equals()</em>
    or <em>==</em> will change the meaning of the original method or operator. The
    idea of this post was to show the default implementations, explaining why would
    it be different is out the scope. Thanks for bringing this up, is important to
    tell this difference.
  date: 2010-03-17 15:09:21 -0400
  date_gmt: 2010-03-17 20:09:21 -0400
  id: 15011
- author: yoeri
  author_email: yoerivdm@gmail.com
  author_url: ""
  content: "Hi, small typo ... Ruby equal? line 11 should say b and a are different
    types, now it says b and c are different types.\r\n\r\ngrtz\r\ny"
  date: 2010-03-18 01:45:18 -0400
  date_gmt: 2010-03-18 06:45:18 -0400
  id: 15012
- author: doza
  author_email: doza@fren.pl
  author_url: ""
  content: Ruby doesn't have weak typing, you probably meant dynamic
  date: 2010-03-18 02:57:34 -0400
  date_gmt: 2010-03-18 07:57:34 -0400
  id: 15013
- author: Mario Carrion
  author_email: mario@carrion.mx
  author_url: http://blog.carrion.ws/
  content: "@yoeri Fixed!\r\n@doza You are <strong>absolutely</strong> right. Post
    updated."
  date: 2010-03-18 17:15:45 -0400
  date_gmt: 2010-03-18 22:15:45 -0400
  id: 15014
- author: Andreas
  author_email: SpamSaver@gmx.de
  author_url: ""
  content: "Just some comments:\r\n\r\nThe Colophon sample is somewhat unfortunate
    because the String case of\r\nSystem.Console.WriteLine (Object.ReferenceEquals
    (obj0, obj1));\r\nwill deliver somesthing completely different from what somebody
    would expect after your post.\r\n\r\nAnd the explanation for Equals() is problematic.
    Equals SHOULD deliver if two instances are - well - equal, NOT that they are the
    same reference. It is right that the default implementation works like that, but
    it SHOULD be overridden in subclasses to test for content equality."
  date: 2010-03-20 05:45:54 -0400
  date_gmt: 2010-03-20 10:45:54 -0400
  id: 15016
date: 2010-03-17T12:42:12Z
date_gmt: 2010-03-17 17:42:12 -0400
published: true
status: publish
tags:
- mono
- development
- opensuse
- english
- ruby
- "2010"
- c#
- resolutions
- march
- ruby&amp;c#
title: 'Comparing Ruby and C#: Equality'
url: /2010/03/17/comparing-ruby-and-c-equality/
wordpress_id: 637
wordpress_url: http://blog.carrion.ws/?p=637
---

<p><a href="http://www.flickr.com/photos/mariocarrion/4439073605/" title="Beauty by Mario Carrion, on Flickr"><img src="http://farm3.static.flickr.com/2792/4439073605_ef6885dd43_m.jpg" width="240" height="180" alt="Beauty" class="aligncenter" /></a></p>
<p>While reading <a href="2010/01/21/the-ruby-programming-language/">The Ruby Programming Language</a> I wrote a couple of notes about the language comparing it to C#. This is the first post of the series talking about those notes.</p>
<p>C# and Ruby share a similar syntax to compare equality in objects. Both use the operator equals (==) and, at least, one method to compare. Ruby uses <em>equal?</em> and <em>eql?</em>, C# uses <em>Equals</em>. Also, both support overriding the equals (==) operator to provide a different logic in case that's required. The methods' name are different but they work pretty much the same.</p>
<p>Understanding the difference between both languages is really simple. If you already know the difference between reference types and values types you are pretty much all set.</p>
<h3>Ruby</h3>
<h4>Method equal?</h4>
<p>Method used to test reference equality in two objects. For example:</p>
<pre class="brush:ruby">#!/usr/bin/env ruby

a = 0
b = 0.0
c = b
d = e = 0

# "false" pointer c points to b, and b and a 
# are different types.w
puts "c.equal?(a) #{c.equal?(a)}" 
# "false" b and a are different types
puts "b.equal?(a) #{b.equal?(a)}" 
# "true" Same type, same value. 
puts "d.equal?(e) #{d.equal?(e)}"</pre>
<h4>Method eql?</h4>
<p>Synonym of equal?, not strict type conversion. Notice Hash classes uses this method for creating the hash, so if two values are the same the hash method should return the same value.</p>
<pre class="brush:ruby">#!/usr/bin/env ruby

a = 0
b = 0.0
c = b
d = e = 0

# "false" Pointer c points to b, and b and a are different types
puts "c.eql?(a) #{c.eql?(a)}" 
# "false" Different types
puts "b.eql?(a) #{b.eql?(a)}" 
# "true" Same type, same value. 
puts "d.eql?(e) #{d.eql?(e)}"</pre>
<h4>Operator equals (==)</h4>
<p>By default, in Object class, it's a synonym of equal?. Tests reference equality.</p>
<pre class="brush:ruby">#!/usr/bin/env ruby

a = 0
b = 0.0
c = b
d = e = 0

# "true" Even when pointer c points to b, and b and a 
# are different types, the value is the same
puts "c == a #{c == a}" 
# "true" Type is casted to allow comparing them
puts "b == a #{b == a}" 
# "true" Same type, same value. 
puts "d == e #{d == e}"</pre>
<h3>C#</h3>
<p>Before explaining the equality options, notice one important difference between Ruby and C#.</p>
<p><strong>First</strong>, Ruby is a <strong>dynamic typed language</strong>. When declaring variables there's no <em>meaning</em> of <em>variable type</em>, all variables can be used to identify instances of different types depending on the situation. For example, we can define a variable <em>x</em> to act as a <em>string</em>, and then use the same variable <em>x</em> to act as an <em>integer</em>, this doesn't mean we are converting the string to integer, this means we are using the same pointer (variable x) for two different types, string and integer, pointing to two different addresses in memory. For example:</p>
<pre class="brush:ruby">#!/usr/bin/env ruby

a = "I'm string"
# Output: "a Value: 'I'm string' Class: 'String'"
puts "a Value: '#{a}' Class: '#{a.class}'"

# Output: "a Value: '10.0' Class: 'Float'"
a = 10.0
puts "a Value: '#{a}' Class: '#{a.class}'"</pre>
<p>C# is a <strong>static typed language</strong>, all variables must indicate their type before instantiating an object. For example, when declaring a variable <em>x</em> of type <em>string</em>, you will be able to create an instance of <em>string</em>, <strong>only</strong>, there's no way to "reuse" <em>x</em> as an <em>integer</em> in the same scope. Try to compile the following example, it <strong>will</strong> fail:</p>
<pre class="brush:csharp">public class RubyAndCSharp {
	
	public static void Main (string []args) {
		string x = "I'm string";
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());

		x = 10.0; // It will fail here: "error CS0029: Cannot implicitly convert type `double' to `string'"
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());
	}
}</pre>
<p><strong>Second</strong>, memory management. Both languages manage memory automatically: by default all memory is created and released automatically, there is no need to explicitly release or allocate memory, unless the programmer wants to do so. However, in C# there's a "difference" between types. There are two <em>type categories</em>: <a href="http://msdn.microsoft.com/en-us/library/s1ax56ch.aspx">Value Type</a> and <a href="http://msdn.microsoft.com/en-us/library/490f96s2.aspx">Reference Type</a>. The difference, related to memory use, is the way they work and the addresses in memory they use. Declaring value types automatically allocates memory, declaring reference types declares a pointer and the memory is allocated when the object pointed by the variable is instantiated. The Value Types are allocated in the <a href="http://en.wikipedia.org/wiki/Stack-based_memory_allocation">stack</a> and the Reference Types are allocated in the <a href="http://en.wikipedia.org/wiki/Dynamic_memory_allocation">heap</a>.</p>
<p>This difference is really important. Comparing two instances of objects with different "category", one value type and one reference type, does not work, it just fails. Is like comparing an apple to an orange. Is comparing a value stored in the stack to a value stored in the heap. We can't compare them without writing any extra code.</p>
<p>And this extra code means using the base class <em>object</em> as the pointer for different types, because both types, value type and reference type, are subclasses of object, in one way or another. Let's try to compile the following example:</p>
<pre class="brush:csharp">public class RubyAndCSharp {
	
	public static void Main (string []args) {
		object x = "I'm string";
		// Output: "a Value: 'I'm string' Class: 'System.String'"
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());

		x = 10.0;
		// Output: "a Value: '10' Class: 'System.Double'"
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());
	}
}</pre>
<p>After this short (or long?) explanation we are ready to see talk about the methods.</p>
<h4>Method Object.Equals()</h4>
<p>Is used to test reference equality in reference types and bitwise equality in value types. For example:</p>
<pre class="brush:csharp">public class RubyAndCSharp {

	class MyClass {
		public string Name { get; set; }
		public override string ToString () { return Name; }
	}
	
	public static void Main (string []args) {
		// object.Equals in Reference Types uses address memory
		MyClass myClass0 = new MyClass () { Name = "test" };
		MyClass myClass1 = myClass0;

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myClass0, myClass1, object.Equals (myClass0, myClass1));
		
		// Let's try again. This will return false. myClass1 and myClass2 are different instances
		myClass1 = new MyClass () { Name = "test" };

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myClass0, myClass1, object.Equals (myClass0, myClass1));
		
		// It doesn't matter myInt0 and myInt1 are different variables, equality will be true.
		int myInt0 = 1; 
		int myInt1 = 1;

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myInt0, myInt1, object.Equals (myInt0, myInt1));
	}
}</pre>
<h4>Operator equals (==)</h4>
<p>Is, basically, a synonym of object.Equals, same rules apply.</p>
<pre class="brush:csharp">public class RubyAndCSharp {

	class MyClass {
		public string Name { get; set; }
		public override string ToString () { return Name; }
	}
	
	public static void Main (string []args) {
		// == in Reference Types uses address memory
		MyClass myClass0 = new MyClass () { Name = "test" };
		MyClass myClass1 = myClass0;

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myClass0, myClass1, myClass0 == myClass1);
		
		// Let's try again. This will return false. myClass1 and myClass2 are different instances
		myClass1 = new MyClass () { Name = "test" };

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myClass0, myClass1, myClass0 == myClass1);
		
		// It doesn't matter myInt0 and myInt1 are different variables
		int myInt0 = 1; 
		int myInt1 = 1;

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myInt0, myInt1, myInt0 == myInt1);
	}
}</pre>
<h4>Operator Object.ReferenceEquals()</h4>
<p>Pretty straightforward, tests reference:</p>
<pre class="brush:csharp">public class RubyAndCSharp {

	class MyClass {
		public string Name { get; set; }
		public override string ToString () { return Name; }
	}
	
	public static void Main (string []args) {
		// Object.ReferenceEquals in Reference Types uses address memory
		MyClass myClass0 = new MyClass () { Name = "test" };
		MyClass myClass1 = myClass0;

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myClass0, myClass1, System.Object.ReferenceEquals (myClass0, myClass1));
		
		// Let's try again. This will return false. myClass1 and myClass2 are different instances
		myClass1 = new MyClass () { Name = "test" };

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myClass0, myClass1, System.Object.ReferenceEquals (myClass0, myClass1));
		
		// This will also return false.
		int myInt0 = 1; 
		int myInt1 = 1;

		System.Console.WriteLine ("object.Equals('{0}','{1}') = {2}", myInt0, myInt1, System.Object.ReferenceEquals (myInt0, myInt1));
	}
}</pre>
<h4>Colophon</h4>
<p>Sometimes you will have to use an <strong>object</strong> reference to refer to both types, value and reference, if you are planning to compare their value you have to use the static method <strong>object.Equals(a,b)</strong>. Using the operator equals (==) will always return false, because of the <a href="http://msdn.microsoft.com/en-us/library/yz2be5wk(VS.80).aspx">boxing/unboxing</a>:</p>
<pre class="brush:csharp">public class RubyAndCSharp {
	
	public static void Main (string []args) {
		string str0 = "hola";
		string str1 = "hola";
		
		object obj0 = str0;
		object obj1 = str1;

		System.Console.WriteLine ("Equals: {0}, Using ==: {1}, object.Equals {2}", 
		                          obj0.Equals (obj1), // True
		                          obj0 == obj1, // True
		                          object.Equals (obj0, obj1)); // True
		                          
		bool bool0 = true;
		bool bool1 = true;
		
		obj0 = bool0;
		obj1 = bool1;

		System.Console.WriteLine ("Equals: {0}, ==: {1}, object.Equals {2}", 
		                          obj0.Equals (obj1), // True
		                          obj0 == obj1, // False
		                          object.Equals (obj0, obj1)); // True
		                          
	}
}</pre>
<p><em>Updated 2010-03-17</em>: Thanks to <em>sukru</em> for noticing the error in the examples.</p>
<p><em>Updated 2010-03-18</em>: Fixed typos, thanks to <em>yoeri</em> and <em>doza</em> noticing them.</p>
