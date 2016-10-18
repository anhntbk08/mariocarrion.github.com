---
date: 2006-08-16T22:37:42Z
title: Exceptions
url: /2006/08/16/exceptions.html
---

<p>Since C++ includes exceptions improves applications' lifetime while running, "catching" known errors always helps, but what about the pretty older (but nicer) C?? The following simulates Java's <em>try-catch-finally</em>. It's based on the code written by Francisco A. MÃ¡rquez, on <a href="http://www.ra-ma.es/libros/0001692.htm">his book</a>.</p>
<p>File <em>exception.h</em></p>
<p><code lang="c">#ifndef __EXCEPTION_H__<br />
#define __EXCEPTION_H__<br />
#include [signal .h] //Replace with "lower-than" "greather-than"<br />
#include [setjmp .h]</p>
<p>typedef int exception_t;</p>
<p>extern exception_t<br />
	ARITHMETIC,		/* SIGFPE */<br />
	HANGUP,			/* SIGHUP */<br />
	ILLEGAL_INSTRUCTION, 	/* SIGILL */<br />
	SEGMENT_VIOLATION,	/* SIGSEGV */<br />
	TERMINATION,		/* SIGTERM */<br />
	UNKNOWN;</p>
<p>extern jmp_buf __jmpbuf;</p>
<p>/*<br />
 * try {<br />
 * 	insert-code-here<br />
 * } catch (Exception) {<br />
 * 	deal-with-the-exception<br />
 * } finally {<br />
 * 	do-something<br />
 * }<br />
 * */<br />
#define try {exception_t current_exception;\<br />
	sigset_t oset;\<br />
	struct sigaction oact;\<br />
	void exception_lock_signal (sigset_t *oset, struct sigaction *oact);\<br />
	void exception_unlock_signal (sigset_t *oset, struct sigaction *oact);\<br />
	exception_lock_signal (&oset, &oact);\<br />
	if ((current_exception = (exception_t) setjmp (__jmpbuf)) == 0)<br />
#define catch(exception) else if (current_exception == (int) &exception)<br />
#define finally exception_unlock_signal (&oset, &oact);}<br />
#define throw(exception) longjmp (__jmpbuf, (int) &exception);</p>
<p>#endif</code></p>
<p>File <em>exception.c</em></p>
<p><code lang="C">#include [errno .h] //Replace with "lower-than" "greather-than"<br />
#include [stdio .h]<br />
#include "exception.h"</p>
<p>exception_t<br />
	ARITHMETIC,<br />
	HANGUP,<br />
	ILLEGAL_INSTRUCTION,<br />
	SEGMENT_VIOLATION,<br />
	TERMINATION,<br />
	UNKNOWN;</p>
<p>jmp_buf __jmpbuf;</p>
<p>void exception_error (int err, char *str)<br />
{<br />
	printf ("EXCEPTION ERROR: (%i) %s\n", err, str);<br />
}</p>
<p>void exception_manager (int signal)<br />
{<br />
	switch (signal) {<br />
		case SIGFPE:<br />
			throw (ARITHMETIC);<br />
			break;<br />
		case SIGHUP:<br />
			throw (HANGUP);<br />
			break;<br />
		case SIGILL:<br />
			throw (ILLEGAL_INSTRUCTION);<br />
			break;<br />
		case SIGSEGV:<br />
			throw (SEGMENT_VIOLATION);<br />
			break;<br />
		case SIGTERM:<br />
			throw (TERMINATION);<br />
			break;<br />
		default:<br />
			throw (UNKNOWN);<br />
	}<br />
}</p>
<p>void exception_lock_signal (sigset_t *oset, struct sigaction *oact)<br />
{<br />
	int error = 0;<br />
	sigset_t set;<br />
	struct sigaction act;</p>
<p>	sigemptyset (&set);<br />
	sigaddset (&set, SIGFPE);<br />
	sigaddset (&set, SIGHUP);<br />
	sigaddset (&set, SIGILL);<br />
	sigaddset (&set, SIGSEGV);<br />
	sigaddset (&set, SIGTERM);<br />
	if ((error = sigprocmask (SIG_UNBLOCK, &set, oset)) == -1)<br />
		exception_error (errno, "sigprocmask");<br />
	act.sa_handler = exception_manager;<br />
	sigfillset (&act.sa_mask);<br />
	act.sa_flags = SA_RESETHAND;<br />
	if ((error = sigaction (SIGFPE, &act, oact)) == -1)<br />
		exception_error (errno, "sigaction SIGFPE");<br />
	if ((error = sigaction (SIGHUP, &act, oact)) == -1)<br />
		exception_error (errno, "sigaction SIGHUP");<br />
	if ((error = sigaction (SIGILL, &act, oact)) == -1)<br />
		exception_error (errno, "sigaction SIGILL");<br />
	if ((error = sigaction (SIGSEGV, &act, oact)) == -1)<br />
		exception_error (errno, "sigaction SIGSEGV");<br />
	if ((error = sigaction (SIGTERM, &act, oact)) == -1)<br />
		exception_error (errno, "sigaction SIGTERM");<br />
}</p>
<p>void exception_unlock_signal (sigset_t *oset, struct sigaction *oact)<br />
{<br />
	int error = 0;</p>
<p>	if ((error = sigprocmask (SIG_SETMASK, oset, NULL)) == -1)<br />
		exception_error (error, "sigprockmask SIG_SETMASK");<br />
	if ((error = sigaction (SIGFPE, oact, NULL)) == -1)<br />
		exception_error (error, "sigaction SIGFPE");<br />
	if ((error = sigaction (SIGHUP, oact, NULL)) == -1)<br />
		exception_error (error, "sigaction SIGHUP");<br />
	if ((error = sigaction (SIGILL, oact, NULL)) == -1)<br />
		exception_error (error, "sigaction SIGILL");<br />
	if ((error = sigaction (SIGSEGV, oact, NULL)) == -1)<br />
		exception_error (error, "sigaction SIGSEGV");<br />
	if ((error = sigaction (SIGTERM, oact, NULL)) == -1)<br />
		exception_error (error, "sigaction SIGTERM");</p>
<p>}</code></p>
<p>And yes... there is also the example code:</p>
<p><code lang="C">#include [stdio .h] //Replace with "lower-than" "greather-than"<br />
#include "exception.h"</p>
<p>int main ()<br />
{<br />
	exception_t Error_de_Lectura;<br />
	int  x;<br />
	try {<br />
		printf ("Protected scope. BEGIN\n");<br />
		strcpy (NULL, "Nice!");<br />
		printf ("Protected scope. END\n");<br />
	} catch (Error_de_Lectura) {<br />
		printf ("Reading error\n");<br />
	} catch (ARITHMETIC) {<br />
		printf ("Arithmetic error\n");<br />
		throw (Error_de_Lectura);<br />
	} catch (ILLEGAL_INSTRUCTION) {<br />
		printf ("Instruccion ilegal");<br />
	} catch (SEGMENT_VIOLATION) {<br />
		printf ("Segmentation fault!.\n");<br />
		x = 0 /0;<br />
	} finally {<br />
		printf ("Finally reached\n");<br />
	}<br />
	return 0;<br />
}</code></p>
<p>Awesome, isn't it?.</p>
