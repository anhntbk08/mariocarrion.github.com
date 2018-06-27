---
date: 2010-03-17T12:42:12Z
title: 'Comparing Ruby and C#: Equality'
url: /2010/03/17/comparing-ruby-and-c-equality.html
---

<p><a href="http://www.flickr.com/photos/mariocarrion/4439073605/" title="Beauty by Mario Carrion, on Flickr"><img src="http://farm3.static.flickr.com/2792/4439073605_ef6885dd43_m.jpg" width="240" height="180" alt="Beauty" class="aligncenter" /></a></p>
<p>While reading <a href="2010/01/21/the-ruby-programming-language/">The Ruby Programming Language</a> I wrote a couple of notes about the language comparing it to C#. This is the first post of the series talking about those notes.</p>
<p>C# and Ruby share a similar syntax to compare equality in objects. Both use the operator equals (==) and, at least, one method to compare. Ruby uses <em>equal?</em> and <em>eql?</em>, C# uses <em>Equals</em>. Also, both support overriding the equals (==) operator to provide a different logic in case that's required. The methods' name are different but they work pretty much the same.</p>
<p>Understanding the difference between both languages is really simple. If you already know the difference between reference types and values types you are pretty much all set.</p>
<h3>Ruby</h3>
<h4>Method equal?</h4>
<p>Method used to test reference equality in two objects. For example:</p>


{{< highlight ruby >}}
#!/usr/bin/env ruby

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
{{< / highlight >}}

<h4>Method eql?</h4>
<p>Synonym of equal?, not strict type conversion. Notice Hash classes uses this method for creating the hash, so if two values are the same the hash method should return the same value.</p>

{{< highlight ruby >}}
#!/usr/bin/env ruby

a = 0
b = 0.0
c = b
d = e = 0

# "false" Pointer c points to b, and b and a are different types
puts "c.eql?(a) #{c.eql?(a)}" 
# "false" Different types
puts "b.eql?(a) #{b.eql?(a)}" 
# "true" Same type, same value. 
puts "d.eql?(e) #{d.eql?(e)}"
{{< / highlight >}}

<h4>Operator equals (==)</h4>
<p>By default, in Object class, it's a synonym of equal?. Tests reference equality.</p>

{{< highlight ruby >}}
#!/usr/bin/env ruby

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
puts "d == e #{d == e}"
{{< / highlight >}}

## C#


Before explaining the equality options, notice one important difference between Ruby and C#.

**First**, Ruby is a <strong>dynamic typed language</strong>. When declaring variables there's no <em>meaning</em> of <em>variable type</em>, all variables can be used to identify instances of different types depending on the situation. For example, we can define a variable <em>x</em> to act as a <em>string</em>, and then use the same variable <em>x</em> to act as an <em>integer</em>, this doesn't mean we are converting the string to integer, this means we are using the same pointer (variable x) for two different types, string and integer, pointing to two different addresses in memory. For example:

{{< highlight ruby >}}
#!/usr/bin/env ruby

a = "I'm string"
# Output: "a Value: 'I'm string' Class: 'String'"
puts "a Value: '#{a}' Class: '#{a.class}'"

# Output: "a Value: '10.0' Class: 'Float'"
a = 10.0
puts "a Value: '#{a}' Class: '#{a.class}'"</pre>
{{< / highlight >}}

<p>C# is a <strong>static typed language</strong>, all variables must indicate their type before instantiating an object. For example, when declaring a variable <em>x</em> of type <em>string</em>, you will be able to create an instance of <em>string</em>, <strong>only</strong>, there's no way to "reuse" <em>x</em> as an <em>integer</em> in the same scope. Try to compile the following example, it <strong>will</strong> fail:</p>

{{< highlight csharp >}}
public class RubyAndCSharp {
	
	public static void Main (string []args) {
		string x = "I'm string";
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());

		x = 10.0; // It will fail here: "error CS0029: Cannot implicitly convert type `double' to `string'"
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());
	}
}
{{< / highlight >}}

<p><strong>Second</strong>, memory management. Both languages manage memory automatically: by default all memory is created and released automatically, there is no need to explicitly release or allocate memory, unless the programmer wants to do so. However, in C# there's a "difference" between types. There are two <em>type categories</em>: <a href="http://msdn.microsoft.com/en-us/library/s1ax56ch.aspx">Value Type</a> and <a href="http://msdn.microsoft.com/en-us/library/490f96s2.aspx">Reference Type</a>. The difference, related to memory use, is the way they work and the addresses in memory they use. Declaring value types automatically allocates memory, declaring reference types declares a pointer and the memory is allocated when the object pointed by the variable is instantiated. The Value Types are allocated in the <a href="http://en.wikipedia.org/wiki/Stack-based_memory_allocation">stack</a> and the Reference Types are allocated in the <a href="http://en.wikipedia.org/wiki/Dynamic_memory_allocation">heap</a>.</p>

This difference is really important. Comparing two instances of `objects` with different "category", one value type and one reference type, does not work, it just fails. Is like comparing an apple to an orange. Is comparing a value stored in the stack to a value stored in the heap. We can't compare them without writing any extra code.

And this extra code means using the base class `object` as the pointer for different types, because both types, value type and reference type, are subclasses of object, in one way or another. Let's try to compile the following example:

{{< highlight csharp >}}
public class RubyAndCSharp {
	public static void Main (string []args) {
		object x = "I'm string";
		// Output: "a Value: 'I'm string' Class: 'System.String'"
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());

		x = 10.0;
		// Output: "a Value: '10' Class: 'System.Double'"
		System.Console.WriteLine ("a Value: '{0}' Class: '{1}'", x, x.GetType ());
	}
}
{{< / highlight >}}

After this short (or long?) explanation we are ready to see talk about the methods.

## Method Object.Equals()

Is used to test reference equality in reference types and bitwise equality in value types. For example:

{{< highlight csharp >}}
public class RubyAndCSharp {

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
}
{{< / highlight >}}

## Operator equals (==)

Is, basically, a synonym of object.Equals, same rules apply.

{{< highlight csharp >}}
public class RubyAndCSharp {

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
}
{{< /highlight >}}

## Operator Object.ReferenceEquals()

Pretty straightforward, tests reference:

{{< highlight csharp >}}
public class RubyAndCSharp {

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
}
{{< /highlight >}}

## Colophon

Sometimes you will have to use an **object** reference to refer to both types, value and reference, if you are planning to compare their value you have to use the static method **object.Equals(a,b)**. Using the operator equals (==) will always return false, because of the [boxing/unboxing](http://msdn.microsoft.com/en-us/library/yz2be5wk(VS.80).aspx):

{{< highlight csharp >}}
public class RubyAndCSharp {
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
}
{{< / highlight >}}
