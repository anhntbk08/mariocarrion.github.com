---
date: 2006-05-01T22:52:22Z
title: Notas de desempeÃ±o, 2
url: /2006/05/01/notas-de-desempeno-2.html
---

<p>DespuÃ©s de haber hecho lo <a href="http://mario.monouml.org/index.php/2006/04/25/notas-de-desempeno/">antes comentado</a> y cambiar las clases por estructuras he notado que (sin la menor duda) se acelara el desempeÃ±o, he bajado la respuesta de 6~8 segundos a menos de un segundo, lo cual es algo grandioso, procesar mÃ¡s de 21000 estructuras de aproxidamente 1500 bytes cada una es fantÃ¡stico, el consumo de CPU es de 1%-3% (hablando de un P4 2.4Ghz), claro que este caso de prueba es "<em>el peor de los casos</em>" y tambiÃ©n, aÃºn, hay detalles que podrÃ­an ser mejorados, los resultados son excelentes. Durante la recepciÃ³n utilizo la soluciÃ³n del marshalling+cast, de modo que se hace un cast explÃ­cito al tipo de estructura, por ejemplo, suponiendo que tenemos una estructura definida como: </p>
<p><code lang="csharp">[StructLayout (LayoutKind.Explicit)]<br />
public struct MyStruct<br />
{<br />
	[FieldOffset (0)]<br />
	public int Integer;</p>
<p>	[FieldOffset (4)]<br />
	public short Short;<br />
}</code></p>
<p>PodrÃ­amos dentro de alguna parte de nuestra lÃ³gica de procesamiento del flujo binario, hacer el cast:</p>
<p><code lang="csharp">fixed (byte *data = reader.ReadBytes (sizeof (MyStruct))) {<br />
	header = *(MyStruct *) data;<br />
}</code></p>
<p>Donde el flujo lo leemos a travÃ©s de la variable <em>reader</em> (BinaryReader). Lo mÃ¡s probable es que este proceso se encuentre dentro de un ciclo infinito que se encuentra recibiendo la informaciÃ³n del flujo de red. DespuÃ©s de unas pruebas, que hice por simple curiosidad, note algo muy interesante de las formas de obtener el tamaÃ±o de una definiciÃ³n de estructura y clase, lo mÃ¡s sorprendente fue que el mÃ©todo propuesto por "<em>Marshal.SizeOf (typeof (MyStruct))</em>", es mÃ¡s lento, y sin duda es cierto, pues cada ocasiÃ³n que es llamado se realiza un asignaciÃ³n por la CLR para calcular su tamaÃ±o. </p>
<pre>repetitions: 1000
iterations: 1.000000e+006

TestSizeOfStatic :      7.773 seconds
TestSizeOf:     2.781 seconds
TestSizeOfMarshal :     50.093 seconds</pre>
<p>Debido a que sizeof Ãºnicamente sirve para tipos por valor, no es posible aplicar este mÃ©todo a una clase y tendrÃ­amos que utilizar <em>Marshal.SizeOf</em> para obtener este tamaÃ±o, una soluciÃ³n para no afectar el desempeÃ±o y no utilizar siempre la opciÃ³n no recomendada es agregando una propiedad estÃ¡tica a nuestra clase ademÃ¡s de una variable privada estÃ¡tica que mantenga este tamaÃ±o, algo como:</p>
<p><code lang="csharp">[StructLayout (LayoutKind.Sequential)]<br />
public class MyClass<br />
{<br />
	public int Integer;<br />
	public short Short;</p>
<p>	static unsafe MyClass ()<br />
	{<br />
		_size = Marshal.SizeOf (typeof (MyClass));<br />
	}</p>
<p>	public static int Size<br />
	{<br />
		get { return _size; }<br />
	}</p>
<p>	private static int _size;<br />
}</code></p>
<p>AdemÃ¡s hay que recordar que el <em>overhead</em> de utilizar una clase en comparaciÃ³n a una estructura es mayor. Hay detalles en las clases, al igual que en las estructuras, que deben ser consideradas, el <a href="http://www.mono-project.com/Interop_with_Native_Libraries">sitio de mono</a> tiene algunos buenos consejos para esto.</p>
