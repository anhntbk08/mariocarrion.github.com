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
date: 2004-09-04T12:50:36Z
published: true
status: publish
tags:
- personal
- english
title: Justifying the project
url: /2004/09/04/justifying-the-project/
wordpress_id: 46
wordpress_url: http://mario.monouml.org/index.php/2004/09/04/justifying-the-project/
---

<div style="clear:both;"></div>
<p>I spent this weekend setting up all the necessary for using <a href="http://www.postgresql.org/">PostgreSQL</a> through MS' .NET (using the ODBC provided by <a href="http://gborg.postgresql.org/project/psqlodbc/projdisplay.php">GBorg</a>, that team is also developing some .NET Data Provider, but it is too unstable, and I don't to fail my DataBase subject at school =P).</p>
<p><span style="font-weight: bold;">Yes!! I know</span>, I'M USING MS' .NET, What about your <a href="http://www.mono-project.com">Mono Project</a>?, BUT WHAT ELSE CAN I DO?, :( neither of my fellow workers use Linux/Mono, they neither program with C#, and Mono/GTK# is still too much unstable for using it as core framework (sorry fellows but it is the truth), my mates used to develop with Java (some time ago), they like dragging and dropping components from toolbar filled with icons. Anyway, I also set up my Linux box for being used as Primary Domain Controller, you know for authentifying some MS Windows NT based OS, I like <a href="http://www.samba.org/">SAMBA</a> I've learned a lot this two days but I've been to busy and I couldn't work with <a href="http://monouml.sf.net/">MonoUML</a> but it didn't matter because <a href="http://www.sourceforge.net/">SourceForge</a> is in maintenance (look, I'm running MS Windows 2000 Server, with a lot of patches, but I'm still running <a href="http://www.mozilla.org/products/firefox/">Mozilla Firefox</a>!!, did you think I was using MS Internet Explorer?) look at the newest <a href="javascript:popWin('http://www.geocities.com/k4rny/imgs/sf_maintenance.png',552,539)">screenshot</a>.</p>
<p><span style="font-weight:bold;">SAMBA</span> had changed a lot since I used for sharing files all along my network, there are a lot of new features, I did:</p>
<p><code><br />
# apt-get install samba smbclient<br />
</code></p>
<p>then I set up the /etc/samba/smb.conf, adding some variable names; there isn't too much information about Samba3, I found this good articles, they might be useful for someone else:</p>
<ol>
<li><a href="http://ccfaq.valar.co.uk/modules.php?name=News&file=article&sid=254">How to Create a PDC on CC using Samba 3</a>
</li>
<li><a href="http://de.samba.org/samba/ftp/docs/htmldocs/samba-pdc-howto.html">The Samba 2.2 PDC HowTo</a>
</li>
<li><a href="http://daniel.fiser.cz/?go=samba">Samba PDC mini-HOWTO</a>
</li>
</ol>
<p>And what about <span style="font-weight:bold;">PostgreSQL</span>?? We know postgres is the better open sourced database, better than <a href="http://www.oracle.com">Oracle</a>, better than <a href="http://www.mysql.org">MySQL</a> (obvious), better than <a href="http://www.microsoft.com/sql/">MS SQL Server</a> (<span style="font-weight:bold;">OBVIOUS</span>); if you use PostgreSQL by the first time, you won't change it EVER!, it has a <a href="http://www.postgresql.org/users-lounge/features.html">lot of features</a>, I encourage to give it a try. I just:</p>
<p><code><br />
# apt-get install postgresql postgresql-client<br />
</code></p>
<p>then I modified the /etc/postgresql/hba_pg.conf for allowing TCP/IP connections, that's all I need... for now :D.</p>
<p><span style="font-weight:bold;">I learned today: </span>'(and the day before today), we need more companies for supporting open sourced technologies; Open Source is cheaper, better, stabler, what else do you need?'</p>
<p><span style="font-weight:bold;">By the way</span>: 'I will go the see her SOONER! I promise. I found a nice image look it:'</p>
<p><img src="http://www.geocities.com/k4rny/imgs/linux_xp.gif" alt="Mix it up!" title="Mix it up!" /></p>
<div style="clear:both; padding-bottom: 0.25em;"></div>
