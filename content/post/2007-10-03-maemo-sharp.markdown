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
date: 2007-10-03T22:51:54Z
date_gmt: 2007-10-04 04:51:54 -0400
published: true
status: publish
tags:
- mono
- nokia770
- english
title: maemo-sharp
url: /2007/10/03/maemo-sharp/
wordpress_id: 421
wordpress_url: http://mario.monouml.org/index.php/2007/10/03/maemo-sharp/
---

<p>Wondering how to develop maemo# applications? Follow this recipe to do so:</p>
<ol>
<li>Install Scratchbox, using either the Debian packages or the <a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/">binaries</a>, I'm using the binaries due to the package didn't work for me. I installed:
<ul>
<li><a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-core-1.0.8-i386.tar.gz">scratchbox-core</a></li>
<li><a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-devkit-cputransp-1.0.3-i386.tar.gz">scratchbox-devkit-cputransp</a></li>
<li><a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-devkit-debian-1.0.9-i386.tar.gz">scratchbox-devkit-debian</a></li>
<li><a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-libs-1.0.8-i386.tar.gz">scratchbox-libs</a></li>
<li><a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-toolchain-cs2005q3.2-glibc-arm-1.0.5-i386.tar.gz">scratchbox-toolchain-cs2005q3.2-glibc-arm</a></li>
<li><a href="http://scratchbox.org/download/files/sbox-releases/apophis/tarball/scratchbox-toolchain-cs2005q3.2-glibc-i386-1.0.5-i386.tar.gz">scratchbox-toolchain-cs2005q3.2-glibc-i386-1.0.5-i386</a></li>
</ul>
</li>
<li>Set up your targets.</li>
<li>Go to Mono's <a href=" http://www.mono-project.com/Maemo">maemo</a> page, follow the instructions.</li>
<li>Checkout <a href="http://anonsvn.mono-project.com/viewcvs/trunk/maemo/samples/">maemo-sharp</a> from svn and make it. Be aware the Debian package isn't the latest one and you have to include your built maemo-sharp.dll to your compiled assembly.</li>
</ol>
<p>And here it is, running in the scratchbox:</p>
<p>
<a href="http://www.flickr.com/photos/mariocarrion/1480641049/" title="Photo Sharing"><img src="http://farm2.static.flickr.com/1366/1480641049_d3aafedce8_m.jpg" width="240" height="150" alt="maemo-sharp application sample" /></a></p>
