---
date: 2006-01-21T23:49:48Z
title: Beagle from sources
url: /2006/01/21/beagle-from-sources.html
---

<p>Time ago I played with <a target="_blank" title="Beagle" href="http://beaglewiki.org/Main_Page">Beagle</a> (<em>apt-get install beagle</em>), but after its <a title="Beagle" target="_blank" href="http://mail.gnome.org/archives/dashboard-hackers/2006-January/msg00051.html">0.20 release</a> decided to build it from sources. I don't do apt-get because I'm running mono from svn, yes, I know can have <a target="_blank" href="http://www.mono-project.com/Parallel_Mono_Environments">parallel installations</a> but like living in the edge ;-). Compiling takes sometime, allmost all the time because of the dependencies, if you want to enable everything you must compile allmost all. Here's my quick-and-dirty guide for building Beagle 0.20 from sources.</p>
<p>I'm running linux 2.6.12-9-686 from deb package with <a target="_blank" title="Ubuntu distribution" href="http://www.ubuntu.com/">Ubuntu</a> <a target="_blank" title="Ubuntu breezy" href="http://www.ubuntu.com/download">Breezy</a>. Guided from <a target="_blank" title="Beagle" href="http://beaglewiki.org/Installing_Beagle">beagle's wiki-page</a> I began installing. Remember that using another --prefix rather than /usr is a <strong>very good idea</strong>, I use <em>/opt/beagle/</em>, remember to set <em>$PATH</em>, <em>$LD_CONFIG_PATH </em>and <em>$PKG_CONFIG_PATH</em> while installing the packages,</p>
<ol>
<li><a target="_blank" title="SQLite" href="http://sqlite.org/sqlite-2.8.17.tar.gz">sqlite-2.8.17.tar.gz</a></li>
<li><a target="_blank" title="gmime" href="http://spruce.sourceforge.net/gmime/sources/v2.1/gmime-2.1.19.tar.gz">gmime-2.1.19.tar.gz</a></li>
<li>XFree86 libs, <em>apt-get install libxss-dev</em></li>
<li>evolution-sharp
<ul>
<li><em>apt-get install evolution-data-server-dev evolution-dev</em></li>
<li><a target="_blank" title="evolution-sharp" href="ftp://ftp.gnome.org/pub/gnome/sources/evolution-sharp/0.9/evolution-sharp-0.9.1.tar.gz">evolution-sharp-0.9.1.tar.gz</a></li>
</ul>
</li>
<li>galago, here you need <a target="_blank" title="dbus-sharp" href="http://www.freedesktop.org/wiki/Software_2fdbus">dbus-sharp</a>... then you need dbus even if you already have it.
<ul>
<li><em>apt-get instlal libdbus-1-dev libdbus-glib-1-dev</em></li>
<li><a target="_blank" title="DBus" href="http://dbus.freedesktop.org/releases/dbus-0.60.tar.gz">dbus-0.60.tar.gz</a>, use <em>--enable-mono --enable-mono-docs </em>while configuring.<em><br />
</em></li>
<li><a target="_blank" title="Galago" href="http://www.galago-project.org/files/releases/source/libgalago/libgalago-0.3.3.tar.gz">libgalago-0.3.3.tar.gz</a></li>
<li><a target="_blank" title="Galago .NET Bindings" href="http://www.galago-project.org/files/releases/source/galago-sharp/galago-sharp-0.3.2.tar.gz">galago-sharp-0.3.2.tar.gz</a></li>
</ul>
</li>
<li>libexif, <em>apt-get install libexif-dev</em></li>
<li>gsf-sharp
<ul>
<li><em>apt-get install libgsf-gnome-1-dev libgsf-1-dev</em></li>
<li><a target="_blank" title="gsf-sharp" href="http://primates.ximian.com/~joe/gsf-sharp-0.6.tar.gz">gsf-sharp-0.6.tar.gz</a></li>
</ul>
</li>
</ol>
<p>Then, <em>beagled</em>, and <em>beagle-search</em>, and done.</p>
<p><a target="_blank" title="Beagle" href="http://static.flickr.com/28/89575463_8834eab49b_o.png"><img alt="Beagle" title="Beagle" src="http://static.flickr.com/28/89575463_8834eab49b_m.jpg" /></a></p>
