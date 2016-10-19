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
date: 2008-11-22T20:12:44Z
date_gmt: 2008-11-23 01:12:44 -0500
published: true
status: publish
tags:
- opensuse
title: HP Pavilion TX2500z. Part III
url: /2008/11/22/hp-pavilion-tx2500z-part-iii/
wordpress_id: 503
wordpress_url: http://blog.carrion.ws/?p=503
---

<p>There a lot of improvements and fixes in <a href="http://news.opensuse.org/2008/11/13/development-release-opensuse-111-beta-5-now-available/">OpenSUSE 11.1 B5</a>, for example you don't need to add the RadeonHD repository because B5 already includes the fix, however there are some new bugs to be fixed:</p>
<ul>
<li>Bug <a href="https://bugzilla.novell.com/show_bug.cgi?id=441764">441764</a> - GNOME: gnome-keyring support partially broken.</li>
<li>Bug <a href=" https://bugzilla.novell.com/show_bug.cgi?id=445724">445724</a> - gdm: problems with xvkbd on TabletPCs</li>
<li>Bug <a href=" https://bugzilla.novell.com/show_bug.cgi?id=445923">445923</a> - File Selecion Dialog changes its size and position</li>
<li>Bug <a href="https://bugzilla.novell.com/show_bug.cgi?id=438071">438071</a> - root owned icons on the desktop</li>
</ul>
<p>GNOME 2.24.1 is <strong>awesome</strong> in OpenSUSE 11.1 B5, everything is supported by default and you don't need anything but some clicks to fully configure your tablet, however by default the current kernel (2.6.27.5-2) doesn't include the BCM4322 wireless module (<em>wl</em>), and making the <a href="http://www.broadcom.com/support/802.11/linux_sta.php">current tarball</a> will return building errors, however, I've found <a href="http://jaux.net/2008/10/14/patch-to-broadcom-80211-linux-sta-driver-for-kernel-2627/">the solution</a>, apply <a href="http://jaux.net/uploads/2008/10/hybrid_wl-5.10.27.6_patch-2.6.27">the patch</a>, follow the instructions and enjoy.</p>
<p><em>BTW</em>. I love my new <a href="http://en.wikipedia.org/wiki/Canon_EOS_450D">Canon Rebel XSi</a>, replaces my <a href="http://blog.carrion.ws/2007/05/01/new-camera-2nd/">old camera</a>, I'm looking forward to take a lot of photographies!  My <em>official</em> first photography:</p>
<p><a title="Monkey by Mario CarriÃ³n, on Flickr" href="http://www.flickr.com/photos/mariocarrion/3045951813/"><img src="http://farm4.static.flickr.com/3024/3045951813_548e239b48_m.jpg" alt="Monkey" width="160" height="240" /></a></p>
