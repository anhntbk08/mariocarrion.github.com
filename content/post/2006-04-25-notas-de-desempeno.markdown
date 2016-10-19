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
- author: HardBit
  author_email: ivan@tidemexico.com
  author_url: http://www.hardbit.org
  content: "Eso es muy cierto, los comentarios puristas, en mi caso no me considero
    un \"desarollador\" y mucho menos con una basta experiencia, pero he programador
    en diferente lenguajes de programacion y siempre existen las guerras santas, pero
    bueno para mi .Net es un Framework que en efecto acelera el desarollo, eso claro
    no contando con otros factores de desarollo como lo es la metodologia, patrones
    de diseÃ±o, etc...\r\n\r\nSolo resta decir que la plataforma .Net acelera el desarollo
    y punto, por muchas razon comprobables, y en cuanto a performance, tambien se
    puede comprobar como lo has hecho con codigo no administrador.\r\n\r\n:)\r\n\r\nHardBit
    | Programador Win32\r\nwww.hardbit.org"
  date: 2006-04-26 02:37:50 -0400
  date_gmt: 2006-04-26 06:37:50 -0400
  id: 63
- author: Mario CarriÃ³n
  author_email: mario@monouml.org
  author_url: http://mario.monouml.org
  content: Si es cierto, .NET tampoco es la panacea, seguro mÃ¡s adelante habrÃ¡ una
    plataforma mejor y despuÃ©s de ella otra mÃ¡s y asÃ­, y esa es la idea que cada
    ocasiÃ³n se mejore el desarrollo y las aplicaciones sean mejores, pero es una
    pena que ahora tan fÃ¡cil que es, que se incrementen las aplicaciones mal hechas,
    es de alguna forma como la historia de GNU/Linux, es bueno tener mÃ¡s gente involucrada
    pero es malo "omitir" algunas bÃ¡sicas de la filosofÃ­a, aÃºn hay personas que
    creen que "free software" es software gratis, en fin.
  date: 2006-04-26 22:51:10 -0400
  date_gmt: 2006-04-27 02:51:10 -0400
  id: 64
- author: anonymono
  author_email: no@no.no
  author_url: ""
  content: "Es que el free software es software gratis, pero tambiÃ©n libre. Pero
    que sea gratis quiere decir que es gratis si quieres cogerlo, es decir, si quieres
    usar lo que ya estÃ¡ hecho. Si sin embargo quieres desarrollar algo nuevo, eso
    no es gratis.\r\n\r\nSon muy interesantes tus entradas sobre Mono, sigue asÃ­.\r\n\r\nPor
    cierto, me resulta curiosa la palabra \"desempeÃ±o\". En EspaÃ±a usamos \"rendimiento\"
    ;)\r\n\r\nSaludos."
  date: 2006-04-27 03:57:56 -0400
  date_gmt: 2006-04-27 07:57:56 -0400
  id: 66
date: 2006-04-25T22:30:57Z
date_gmt: 2006-04-26 02:30:57 -0400
published: true
status: publish
tags:
- espaÃ±ol
- development
title: Notas de desempeÃ±o
url: /2006/04/25/notas-de-desempeno/
wordpress_id: 275
wordpress_url: http://mario.monouml.org/index.php/2006/04/25/notas-de-desempeno/
---

<p>A pesar de todos los comentarios puristas, usualmente absurdos y sin fundamentos, referentes a la plataforma <a href="http://www.mono-project.com">Mono</a> (y MS .NET), escribir cÃ³digo en esa plataforma realmente agiliza el desarrollo, en .NET no todo es "arrastrar y soltar", ni llenar las "formas" y cambiarles los colores arbitrariamente, ni hacer supuesta orientaciÃ³n a objetos copiando trozos de cÃ³digo (estÃ¡ticos por cierto) a diferentes mÃ©todos. Escribir cÃ³digo en .NET cualquiera lo puede hacer, pero el hacerlo bien requiere habilidades y experiencia en <a href="http://en.wikipedia.org/wiki/C_programming_language">otros</a> <a href="http://en.wikipedia.org/wiki/C%2B%2B">lenguajes</a>.</p>
<p>PodrÃ­amos pensar para escribir una aplicaciÃ³n de tiempo real debemos  seleccionar un lenguaje que pueda al final general un binario dependiente de <a href="http://en.wikipedia.org/wiki/Platform_%28computing%29">plataforma</a> y <a href="http://en.wikipedia.org/wiki/Computer_architecture">arquitectura</a>, de esta forma se podrÃ¡n explotar, entre otras cosas, las capacidades de CPU y un manejo adecuado de memoria y administraciÃ³n de esta, Â¿QuÃ© es lo malo?, hay que saber como hacerlo y aprender lleva tiempo y tiempo es dinero, mÃ¡s tiempo significa mÃ¡s inversiÃ³n y eso es algo de lo que usualmente no disponemos, ademÃ¡s la plataforma que se ofrece a travÃ©s de la conjunciÃ³n del <a href="http://en.wikipedia.org/wiki/Common_Language_Runtime">CLR</a> y el <a href="http://en.wikipedia.org/wiki/Common_Intermediate_Language">CIL</a> hacen que podamos tener lo mejor de los dos mundos, hacer que el tiempo de desarrollo se reduzca y el desempeÃ±o sea al menos semejante a una aplicaciÃ³n de arquitectura y plataforma dependiente, es obvio que un desempeÃ±o excelente en comparaciÃ³n a un compilado-dependiente no se podrÃ¡ obtener, pero sin embargo siempre se busca el mejor.</p>
<p>Mi proyecto actual del trabajo es el claro ejemplo del extremo, donde se debe escribir una aplicaciÃ³n en .NET con un desempeÃ±o excelente, el retardo mÃ¡ximo de actualizaciÃ³n es de 3 segundos, actualmente lo he bajado de 6-8 a 3-1 segundos, cosa que me agrada, pero seguro se puede mejorar mÃ¡s, algunas cosas que me ayudaron a mejorar el desempeÃ±o fue:</p>
<ol>
<li>Parar el uso de Enumeradores, reemplazalos con punteros, con cÃ³digo no administrado.</li>
<li>No usar indexadores para acceder a arreglos cambiando el cÃ³digo a un uso de aritmÃ©tica de punteros, con cÃ³digo no administrado.</li>
<li>Concatenaciones a travÃ©z de System.Text.StringBuilder, en vez de utilizar el clÃ¡sico "<em>cadena + cadena</em>".</li>
<li>DÃ©bido a que recibo informaciÃ³n binaria de estructuras escritas en C mediante un broadcast, es necesario generar las versiones C# correspondientes a aquellas struct en C con un Marshalling de modo que se pueda hacer un casting de tipo <em>*(Estructura *) ptr</em>.</li>
</ol>
<p>Existe <a href="http://www.codeproject.com/csharp/iter_perf.asp">un artÃ­culo</a> que muestra un buen caso de ejemplo indicando desempeÃ±o al momento de hacer ciclos a arreglos, dentro se utiliza un ejemplo de punteros escritos en C++ administrado, la versiÃ³n de C# serÃ­a algo asÃ­:</p>
<p><code lang="csharp">using System;</p>
<p>namespace Iterations<br />
{<br />
        public class Pointer<br />
        {<br />
                public unsafe static void iterate (Data data)<br />
                {<br />
                        double d;<br />
                        fixed (double *ptr = &data.Array [0]) {<br />
                                int l = data.Array.Length;<br />
                                for (int i = 0; i < l; i++)<br />
                                        d = *(ptr +i);<br />
                        }<br />
                }<br />
        }<br />
}</code></p>
<p>Los resultados son contundentes:</p>
<p></code><code lang="genero">repetitions: 1000<br />
iterations: 1.000000e+006</p>
<p>Enumeration:            32.87 seconds<br />
Indexing:               11.246 seconds<br />
Indirect Arrays:        10.172 seconds<br />
Direct Arrays:          5.44 seconds<br />
Pointer Math:           4.828 seconds</code></p>
<p>El retardo principal se debe a los objetos generados durante la enumeraciÃ³n, <em>foreach</em> no es la elecciÃ³n en aplicaciones de alto desempeÃ±o, sin duda es sencillo de implementar pero es lento al ejecutar, la soluciÃ³n mÃ¡s rÃ¡pida a travÃ©z de punteros se debe a que validaciones como el Ã­ndice del arreglo no es considerado, dejando todo la lÃ³gica de validaciÃ³n al programador.</p>
<p>Hay cosas que me faltan de eliminar como ese abuso exagerado de boxing/unboxing al momento de tener mi colecciÃ³n de estructuras recibidas por el broadcast, ademÃ¡s de la creaciÃ³n innecesario de tipos por valor, reemplazando con una lista enlazada en cÃ³digo no administrado y pasos por referencia respectivamente. Un ejemplo de esto serÃ­a:</p>
<p><code lang="csharp">using System;</p>
<p>namespace Research<br />
{<br />
        unsafe public struct MyStruct<br />
        {<br />
                public MyStruct (int integer)<br />
                {<br />
                        Integer = integer;<br />
                        Next = null;<br />
                }</p>
<p>                public int Integer;<br />
                public MyStruct *Next;</p>
<p>                public override string ToString ()<br />
                {<br />
                        return "Integer: "+Integer+" at "+<br />
                                "Ptr "+((int)&(*Next));<br />
                }<br />
        }</p>
<p>        //Quick sample, don't bother me ;-)<br />
        public class Sample<br />
        {<br />
                unsafe public static void Main (string []args)<br />
                {<br />
                        MyStruct obj1 = new MyStruct ();<br />
                        MyStruct obj2 = new MyStruct ();<br />
                        obj1.Next = null;<br />
                        obj2.Next = &obj1;<br />
                        obj1.Integer = 1;<br />
                        obj2.Integer = 2;<br />
                        ChangeByPointer (&obj1.Integer);<br />
                        ChangeByReference (ref obj2.Integer);<br />
                        Console.WriteLine (obj1 +" * "+  obj2);<br />
                }</p>
<p>                unsafe public static void ChangeByPointer (int *reference)<br />
                {<br />
                        *(reference) += 5;<br />
                }</p>
<p>                unsafe public static void ChangeByReference (ref int reference)<br />
                {<br />
                        reference += 5;<br />
                }<br />
        }<br />
}</code></p>
<p>Algo interesante es el hecho de que ambos mÃ©todos generan la misma secuencia de instrucciones CIL, lo cual obviamente indica que son iguales, por tal razÃ³n cualquier elecciÃ³n es buena:</p>
<p><code lang="asm">//... more before</p>
<p>// method line 5<br />
    .method public static  hidebysig<br />
           default void ChangeByPointer (int32* reference)  cil managed<br />
    {<br />
        // Method begins at RVA 0x21c4<br />
        // Code size 7 (0x7)<br />
        .maxstack 8<br />
        IL_0000:  ldarg.0<br />
        IL_0001:  dup<br />
        IL_0002:  ldind.i4<br />
        IL_0003:  ldc.i4.5<br />
        IL_0004:  add<br />
        IL_0005:  stind.i4<br />
        IL_0006:  ret<br />
    } // end of method Sample::default void ChangeByPointer (int32* reference)</p>
<p>    // method line 6<br />
    .method public static  hidebysig<br />
           default void ChangeByReference (int32& reference)  cil managed<br />
    {<br />
        // Method begins at RVA 0x21cc<br />
        // Code size 7 (0x7)<br />
        .maxstack 8<br />
        IL_0000:  ldarg.0<br />
        IL_0001:  dup<br />
        IL_0002:  ldind.i4<br />
        IL_0003:  ldc.i4.5<br />
        IL_0004:  add<br />
        IL_0005:  stind.i4<br />
        IL_0006:  ret<br />
    } // end of method Sample::default void ChangeByReference (int32& reference)<br />
//more later...</code></p>
<p>Faltan detalles por mejorar, pero sin duda "jugar" con punteros siempre serÃ¡ lo mejor.</p>
