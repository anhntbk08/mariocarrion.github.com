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
date: 2008-11-10T21:35:23Z
date_gmt: 2008-11-11 03:35:23 -0500
published: true
status: publish
tags:
- opensuse
title: HP Pavilion TX2500z. Part II
url: /2008/11/10/hp-pavilion-tx2500z-part-ii/
wordpress_id: 487
wordpress_url: http://blog.carrion.ws/?p=487
---

<p>OpenSUSE 11.1 release is getting closer and I just couldn't wait until <a href="http://en.opensuse.org/Roadmap/11.1">December</a>, so I started to test it. I recommend you to install B4, fixes a lot of bugs.</p>
<p><strong>Video configuration</strong></p>
<p>I didn't install the propietary <a href="http://en.opensuse.org/ATI_Driver_HOWTO">ATI driver</a> (<em>fglrx</em>), instead I'm using the open driver: <em>radeonhd</em> Notice however that after installing you will need to reboot in failsafe and add the <a href="http://download.opensuse.org/repositories/X11:/Drivers:/Video/openSUSE_Factory/">X11 repository</a>, otherwise your computer will freeze after login in. (<a href="https://bugzilla.novell.com/show_bug.cgi?id=437938"><del datetime="2008-11-11T03:01:41+00:00">Bug 437938</del></a>)</p>
<p><strong>Wireless</strong></p>
<p>You just can't build <a href="http://www.broadcom.com/support/802.11/linux_sta.php">the package</a>, yet.</p>
<p><strong>Sound</strong></p>
<p>Is not detected by default, however adding the <em>dell</em> in the model in Yast fixes it. (<a href="https://bugzilla.novell.com/show_bug.cgi?id=430734"><del datetime="2008-11-11T03:01:41+00:00">Bug 430734</del></a>)</p>
<p><strong>Tablet PC</strong></p>
<p>Everything works out of the box, however you will need to set it up when Sax detects your card. (<a href="https://bugzilla.novell.com/show_bug.cgi?id=430527"><del datetime="2008-11-11T03:01:41+00:00">Bug 430527</del></a>)</p>
<p><strong>Fingerprint Reader</strong></p>
<p>Fingerprint Reader is fully integrated. (<a href="https://bugzilla.novell.com/show_bug.cgi?id=432199"><del datetime="2008-11-11T03:01:41+00:00">Bug 432199</del></a>) After log in first time, open Yast and configure your fingerprint.</p>
<p><strong>Remote Control</strong></p>
<p>No idea.</p>
