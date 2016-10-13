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
date: 2009-01-04T23:44:38Z
date_gmt: 2009-01-05 04:44:38 -0500
published: true
status: publish
tags:
- opensuse
title: HP Pavilion TX2500z. Final.
url: /2009/01/04/hp-pavilion-tx2500z-final/
wordpress_id: 557
wordpress_url: http://blog.carrion.ws/?p=557
---

<p>I've been using this tablet for about 4 months with OpenSUSE 11.1, I'm happy: performance, design and hardware support are good for me, however there are few complaints about it:</p>
<h3>Hardware</h3>
<ul>
<li>Keys are small. Are not small as keys in netbooks, but you get tired if you spent more that 6 hours hacking.</li>
<li>Temperature. This is really painful, the hard-disk gets really warm and you can't touch the bottom if you are using doing hard work.</li>
<li>Noise. Same as temperature, using the DVD is somehow annoying, unless you are wearing headphones you don't notice the noise. When using the hard-disk, for example, compiling or searching, happens the same.</li>
</ul>
<p>Recently noticed that HP released <strong>HP TouchSmart tx2z</strong>, this is similar to TX2500z, however the big differences include more memory (up to 8gb) and multi-touch support. Hopefully my complains are already fixed in this newest hardware.</p>
<h3>Software</h3>
<p>Installing OpenSUSE 11.1 in super easy, so installing won't let you down, however you will need <em>extra tunning</em> if you want to support all hardware, in particular <a href="http://smolts.org/smolt-wiki/pci/1002/4383/103c/30f1">sound</a>,  <a href="http://smolts.org/smolt-wiki/pci/14e4/432b/103c/137f">wireless</a> and video:</p>
<h4>radeonhd, open driver</h4>
<p>1.2.3 is installed by default, this version doesn't support Screen Rotation nor 3D Acceleration, according to <a href="http://lists.freedesktop.org/archives/xorg/2008-December/041464.html">1.2.4 releasing notes</a> Screen Rotation is now supported however xrandr doesn't report any rotation information. If you want to upgrade add the following repository and upgrade:<br /><code lang="genero">http://download.opensuse.org/repositories/X11:/Drivers:/Video/openSUSE_11.1/</code>.</p>
<h4>fglrx, proprietary driver</h4>
<p>I recommend to generate the rpm and use zypper to install the generated file, if you are running 64bit you will need to <a href="http://ubuntuforums.org/showthread.php?t=1019712">recreate the symbolic link</a> because seems the fglrx driver is using 32 paths instead of 64, according to <a href="http://wiki.cchtml.com/index.php/Features">documentation</a> Screen Rotation is also supported, but not enabled by default, so execute as root:<br />
<code lang="genero">aticonfig --set-pcs-str="DDX,EnableRandr12,TRUE"</code><br />to enable it, notice this command doesn't change <em>/etc/X11/xorg.conf</em>, it works however sometimes rotating the screen will lead to a black screen.</p>
<h3>Verdict</h3>
<p>I like it, is smaller and lighter that my previous laptop, however the temperature is <strong>really really annoying</strong>.</p>
