---
date: 2005-04-10T16:56:00Z
title: MonoUML, IngenierÃ­a Inversa, Cuarta Parte
url: /2005/04/10/monouml-ingenieria-inversa-cuarta-parte.html
---

<div style="clear:both;"></div>
<p align="justify">Casi todo listo para terminar la librerÃ­a, he limpiado el cÃ³digo ahora esta mÃ¡s legible, mÃ¡s rÃ¡pido y con mayor soporte: clases anidadas, enumeraciones, arreglos, elementos pasados por referencia y punteros, y lo que habÃ­a dicho antes, un parÃ¡metro para "nivelar" la profundidad de la importaciÃ³n, ahora por defecto se hace la importaciÃ³n <span style="font-weight:bold;">AssemblyImport</span>, es decir Ãºnicamente se hace ingenierÃ­a inversa a los ensamblados importados y no a sus dependencias, algo que por lo general es lo que se busca, y ademÃ¡s esta el clÃ¡sico <span style="font-weight:bold;">FullImport</span>, donde se busca hasta el nivel mÃ¡s bajo de informaciÃ³n, por ejemplo si un mÃ©todo utiliza un System.Int32 (o un int en pocas palabras), tambiÃ©n se la hace ingenierÃ­a inversa al System.Int32 a pesar de que es parte de la librerÃ­a base, y asÃ­, todo recursivamente. AdemÃ¡s de eso ya no hay problemas de <span style="font-style:italic;">Duplicated Key</span> al cargarlo en <a href="http://monouml.sourceforge.net">MonoUML</a>, en pocas palabras todo va genial.</p>
<p align="center"><a href="http://monouml.sourceforge.net/screenshots/reveng.png"><img src="http://monouml.sourceforge.net/screenshots/reveng.png" width="400" height="330" title="Reverse Engineering" alt="Reverse Engineering" border="0"/></a></p>
<p align="justify">El cÃ³digo correspondiente es el siguiente:</p>
<pre>
<font color="#a52a2a"><b>using</b></font> System;

<font color="#2e8b57"><b>namespace</b></font> NamespaceSample
{
        <font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>interface</b></font> MyInterface
        {
                <font color="#2e8b57"><b>string</b></font> HelloWorld ();
        }

        <font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>enum</b></font> MyEnumeration
        {
                Some,
                Thing,
                Here
        }

        <font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>abstract</b></font> <font color="#2e8b57"><b>class</b></font> MyAbstractClass
        {
                <font color="#2e8b57"><b>public</b></font> MyAbstractClass (MyEnumeration em)
                {
                }
        }

        <font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>class</b></font> MyClass : MyAbstractClass, MyInterface
        {
                <font color="#2e8b57"><b>public</b></font> MyClass (MyEnumeration enm) : <font color="#a52a2a"><b>base</b></font> (enm)
                {
                }

                <font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>string</b></font> HelloWorld ()
                {
                        <font color="#a52a2a"><b>return</b></font> <font color="#ff00ff">&quot;hola mundo!&quot;</font>;
                }

                <font color="#2e8b57"><b>public</b></font> <font color="#2e8b57"><b>void</b></font> ByReference (<font color="#a52a2a"><b>ref</b></font> <font color="#2e8b57"><b>int</b></font> i)
                {
                }

                <font color="#2e8b57"><b>protected</b></font> <font color="#2e8b57"><b>class</b></font> InternalClass
                {
                        <font color="#2e8b57"><b>public</b></font> InternalClass (MyClass parentClass)
                        {
                        }

                        <font color="#2e8b57"><b>private</b></font> <font color="#2e8b57"><b>void</b></font> InternalHelloWorld ()
                        {
                        }

                        <font color="#2e8b57"><b>private</b></font> <font color="#2e8b57"><b>string</b></font> _myString;
                        <font color="#2e8b57"><b>private</b></font> <font color="#2e8b57"><b>int</b></font>[] _myArray;
                }
        }
}
</pre>
<p align="justify">Espero acepten <a href="http://www.cicol.org.mx/comas/general/proposals/35">mi propuesta</a>, tengo mucho que platicar :)</p>
<p align="justify"><span style="font-weight:bold;">ActualizaciÃ³n</span>: CorreciÃ³n de errores en imagÃ©n, CVS refleja los cambios.</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
