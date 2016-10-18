---
date: 2005-01-25T05:34:53Z
title: Mono. La magÃ­a de la portabilidad
url: /2005/01/25/mono-la-magia-de-la-portabilidad.html
---

<div style="clear:both;"></div>
<p align="justify">Estoy dÃ­as me la he pasado escribiendo cÃ³digo para un proyecto, ya quiero terminarlo, mientras mÃ¡s pronto termine mÃ¡s pronto me pagan, y mientras mÃ¡s pronto me paguen mÃ¡s tiempo tendrÃ© para <a href="http://monouml.sf.net">MonoUML</a>.</p>
<p align="justify">La aplicaciÃ³n que ando haciendo no es la gran cosa, pero como se busca que funcione en UNIX y MS Windows pues decidÃ­ darme una vuelta por los sistemas propietarios.</p>
<p align="justify">He quedado impresionado con <a href="http://www.mono-project.com">mono</a>, en verdad <a href="http://primates.ximian.com">la gente</a> detrÃ¡s del proyecto esta haciendo un muy buen trabajo, el dÃ­a de hoy probando el instalador de <a href="http://mfconsulting.com/blog/">Paco</a> he quedado tambiÃ©n sorprendido, que buen instalador, todo en uno, no necesitas nada mÃ¡s para comenzar a desarrollar con mono en MS Windows, bueno, un editor quizÃ¡s pero seguro el Bloc de notas serÃ­a tambiÃ©n util, lo unico que (hasta este momento) no tiene es el monodoc, pero bueno, se puede consultar la versiÃ³n <a href="http://www.go-mono.com/docs">en lÃ­nea</a> o probar el port que se esta haciendo.</p>
<p align="justify">
DespuÃ©s de instalar mono en MS Windows y copiar los compilados hechos en Linux y ejecutarlos, no hubo problema alguno, es cierto que las aplicaciones hechas en Gtk se ven mejor en versiones nativas de UNIX, pero tambiÃ©n es cierto que Gtk es portable y no decir de Gtk#, todo funciono perfectamente: threads, gtk#, glade#, pango en inclusive una imÃ¡gen contenido dentro del winexe. Algo tambiÃ©n interesante fue el XSP, de la misma forma, funciono, sin contratiempos, todo bien, los webservices funcionaron, inclusive una actualizaciÃ³n programada en mi aplicaciÃ³n a una BD <a href="http://www.mysql.org">MySQL</a> funcionÃ³ correctamente, sin errores.</p>
<p align="center">
<table align="center">
<tr>
<td width="50%" align="center">
<a href="http://www.geocities.com/k4rny/imgs/2005_ene_25/main_lin.png"><img src="http://www.geocities.com/k4rny/imgs/2005_ene_25/main_lin.png" heigth="187" width="300" alt="Ventana principal. Linux" title="Ventana principal. Linux" border="0"/></a>
</td>
<td width="50%" align="center">
<a href="http://www.geocities.com/k4rny/imgs/2005_ene_25/main_win.png"><img src="http://www.geocities.com/k4rny/imgs/2005_ene_25/main_win.png" heigth="175" width="300" alt="Ventana principal. MS Windows" title="Ventana principal. MS Windows" border="0"/></a>
</td>
</tr>
<tr>
<td width="50%" align="center">
<a href="http://www.geocities.com/k4rny/imgs/2005_ene_25/settings_lin.png"><img src="http://www.geocities.com/k4rny/imgs/2005_ene_25/settings_lin.png" heigth="136" width="300" alt="Configuraci&oacute;n. Linux" title="Configuraci&oacute;n. Linux" border="0"/></a>
</td>
<td width="50%" align="center">
<a href="http://www.geocities.com/k4rny/imgs/2005_ene_25/settings_win.png"><img src="http://www.geocities.com/k4rny/imgs/2005_ene_25/settings_win.png" heigth="129" width="300" alt="Configuraci&oacute;n. MS Windows" title="Configuraci&oacute;n. MS Windows" border="0"/></a>
</td>
</tr>
</table>
<p align="justify">Es claro que las aplicaciones escritas en GTK# se ven mejor en *NIX, pero eso no quiere decir que no funcionen en MS Windows :).</p>
<p align="justify">Por el lado de <a href="http://monouml.sf.net">MonoUML</a>, todo indica que tendrÃ© que apoyar a <a href="http://rodolfocampero.blogspot.com">Rodolfo</a> en la documentaciÃ³n de <a href="http://expertcoder.sf.net">ExpertCoder</a>, para asÃ­ agilizar un poco mÃ¡s la integraciÃ³n entre los widgets de MonoUML.UML2/DI y la implementaciÃ³n de ExpertCoder.Uml2, inclusive he subido unos cambios <a href="http://cvs.sourceforge.net/viewcvs.py/monouml">al CVS</a> para ver como se hace, en realidad podrÃ­a decirse que no hice gran cosa, ahora el UMLActor al cambiar su nombre notifica a los <span style="font-style:italic;">demÃ¡s</span> de esta forma el Tree y la pestaÃ±a de propiedades de actualizaciÃ³n correctamente. Aunque hay algunos detalles que no se si son porque pierdo las referencias a las variables al diagrama o es un error propio de <a href="http://expertcoder.sf.net">EC</a>, pues en ocasiones si salva los cambios y en otras no, es raro, debera depurarse con tiempo. Por cierto que el generador de cÃ³digo de Rodolfo funciona correctamente, por ahora sÃ³lo genera cÃ³digo para C#, pero por algo debemos de comenzar.</p>
<p>
<span style="font-weight:bold;">Nota de hoy</span>: 'Buen trabajo el de los <a href="http://www.ximian.com">monos</a>.'</p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
