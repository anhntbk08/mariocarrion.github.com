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
- author: Rodolfo Campero
  author_email: rodolfo.campero@gmail.com
  author_url: http://rodolfocampero.blogspot.com/
  content: "Hi Mario,\r\n\r\nI'll check your code, but don't hesitate to file bug
    reports dude! - even if it turns out not to be a bug, someone else with a similar
    problem may find a clue.\r\n\r\nRegards,\r\nRodolfo"
  date: 2007-07-06 08:37:45 -0400
  date_gmt: 2007-07-06 14:37:45 -0400
  id: 10325
- author: Rodolfo Campero
  author_email: rodolfo.campero@gmail.com
  author_url: http://rodolfocampero.blogspot.com/
  content: "The posted code works; I just re-read your post and you talk about crashes
    related to template binding, not the given test case. Could you please file a
    bug report or post some sample code?\r\n\r\nBTW, in order to make the output cleaner,
    I modified the object array:\r\n  new object [] { klass, T, K, TObj, KObj }\r\nto
    be\r\n  new object [] { TObj, KObj, T, K, klass }\r\n\r\nThis avoids the creation
    of some proxy elements.\r\n\r\nRegards,\r\nRodolfo"
  date: 2007-07-06 08:52:15 -0400
  date_gmt: 2007-07-06 14:52:15 -0400
  id: 10326
- author: Mario CarriÃ³n
  author_email: mario@monouml.org
  author_url: http://mario.monouml.org
  content: "I'm cooking the bug report, will report it today.\r\n\r\nRegards,\r\nMario"
  date: 2007-07-06 16:15:54 -0400
  date_gmt: 2007-07-06 22:15:54 -0400
  id: 10328
date: 2007-07-06T03:41:10Z
date_gmt: 2007-07-06 09:41:10 -0400
published: true
status: publish
tags:
- monouml
- development
- english
title: Reverse Engineering CLR 2.0 Generics
url: /2007/07/06/reverse-engineering-clr-20-generics/
wordpress_id: 402
wordpress_url: http://mario.monouml.org/index.php/2007/07/06/reverse-engineering-clr-20-generics/
---

<p>There are two goals with this new Reverse Engineering API:</p>
<ol>
<li>Implement an extensible, clean and easy-to-use Reverse Engineering API, hiding complex things by using UML-magic methods.</li>
<li>Implement CIL plugin by using this new API, to read 1.1 and 2.0 CLR assemblies.</li>
</ol>
<p>To accomplish second goal I decided to use <a href="http://www.mono-project.com/Cecil">Cecil</a> instead of <a href="http://msdn2.microsoft.com/en-us/library/system.reflection(VS.71).aspx">Reflection</a> because, IMO, Cecil has a cleaner API (not yet documented, but going to sources helps and, of course, you can <a href="http://groups.google.com.mx/group/mono-cecil">always ask</a>) and thinking on the future we might read the full assembly (including method body, for example) to define some diagrams, such as <a href="http://en.wikipedia.org/wiki/Sequence_diagram">Sequence Diagram</a>.</p>
<p>Most notable difference between first version and this new one, is the 2.0 CIL support, and reverse engineering Generics isn't that easy, to do so the following are my ideas to face and finish both implementations:</p>
<ol>
<li>Refactor CIL plugin to handle on a clean way all the Cecil's TypeReference, including PointerType, ArrayType, ReferenceType and GenericInstanceType. Today am using the if-else-if "pattern" not even close to best solution.</li>
<li>Test nUML to handle Templates, I did some tests and many worked, template binding and XMI exporting seems to crash, however template definition doesn't. The following is my test case:</li>
</ol>
<p><code lang="csharp">using System;<br />
using System.IO;<br />
using NUml.Xmi2;<br />
using NUml.Uml2;</p>
<p>class MainClass<br />
{<br />
	public static void Main(string[] args)<br />
	{<br />
		DataType TObj = Create.DataType ();<br />
		TObj.Name = "TKey";<br />
		DataType KObj = Create.DataType ();<br />
		KObj.Name = "TValue";<br />
		TemplateSignature signature = Create.TemplateSignature ();<br />
		ClassifierTemplateParameter T = Create.ClassifierTemplateParameter ();<br />
		ClassifierTemplateParameter K = Create.ClassifierTemplateParameter ();<br />
		T.Signature = signature;<br />
		T.Default = TObj;<br />
		K.Signature = signature;<br />
		K.Default = KObj;<br />
		signature.Parameter.Add (T);<br />
		signature.Parameter.Add (K);<br />
		Class klass = Create.Class ();<br />
		/* Systems.Collection.Dictionary`2[TKey , TValue] emulation */<br />
		klass.Name = "Dictionary";<br />
		klass.OwnedTemplateSignature = signature;</p>
<p>                SerializationDriver driver = new SerializationDriver ();<br />
                driver.AddSerializer (new NUml.Uml2.Serialization.Serializer ());<br />
                driver.Serialize (new object [] { klass, T, K, TObj, KObj },<br />
			Console.OpenStandardOutput(), "urn:numl.sourceforge.net:testing:templates");<br />
        }</p>
<p>}</code></p>
<ol start="3">
<li>Implement the MonoUML visualizer, to show the Parameters defined on the Templates.</li>
<li>Test, test and test.</li>
</ol>
<p>If you are wondering about Templates and so on, UML 2 Super Structure (05-07-04) defines them from page 600 to 631, go ahead.</p>
