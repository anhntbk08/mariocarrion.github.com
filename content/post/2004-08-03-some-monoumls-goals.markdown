---
date: 2004-08-03T00:57:51Z
title: Some MonoUML's goals
url: /2004/08/03/some-monoumls-goals.html
---

<div style="clear:both;"></div>
<p>Recently I've been working a lot with the MonoUML's GUI, at the beggining I used MonoDevelop then I changed to MonoDevelop later I returned to MonoDevelop and now I'm using GEdit, why too may changes? Because I want to code using tools as standard as possible, using the UTF-8 character encoding will bother somepeople but some other will love it. The MonoUML's gui, still doesn't do anything nor save/open files or else; maybe in one week I'll commit all the source.<br />
Now I split the GUI in two parts:</p>
<ul>
<li>Core. conceptual interface</li>
<li>Gui. graphical interface</li>
</ul>
<p>I'm still having some warnings<br />
<code><br />
Gnome-CRITICAL **: file gnome-program.c: line 739 (gnome_program_get_app_id): assertion `program != NULL' failed</p>
<p>GLib-CRITICAL **: file gstring.c: line 552 (g_string_prepend): assertion `val != NULL' failed</p>
<p>Gnome-CRITICAL **: file gnome-program.c: line 739 (gnome_program_get_app_id): assertion `program != NULL' failed<br />
</code><br />
I hope clean the code as fast as I can.</p>
<p>I learned today: 'I need more free time'
<div style="clear:both; padding-bottom: 0.25em;"></div>
