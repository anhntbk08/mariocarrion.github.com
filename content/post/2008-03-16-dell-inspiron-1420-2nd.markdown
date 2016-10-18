---
date: 2008-03-16T16:40:11Z
title: Dell Inspiron 1420, 2nd
url: /2008/03/16/dell-inspiron-1420-2nd.html
---

<p>I've upgraded my <a href="https://wiki.ubuntu.com/GutsyGibbon">Gutsy</a> to <a href="https://wiki.ubuntu.com/HardyHeron">Hardy</a> and everything was nice until I noticed <a href="http://banshee-project.org/">Banshee</a> was playing but no sound was heard. This bug reminded me when I installed <a href="http://blog.carrion.ws/2007/08/03/dell-inspiron-1420/">Gutsy</a> first time, I tried the same solution but didn't work, however I decided to re-read the <a href="https://help.ubuntu.com/community/HdaIntelSoundHowto">wiki</a> and the <a href="http://www.mjmwired.net/kernel/Documentation/sound/alsa/ALSA-Configuration.txt">ALSA configuration</a> to try new arguments:</p>
<p><code bash>options snd-hda-intel model=dell-m26</code></p>
<p>It worked. By the way I like the Clock update:</p>
<p><a href="http://www.flickr.com/photos/mariocarrion/2338201273/" title="GNOME Clock by Mario CarriÃ³n, on Flickr"><img src="http://farm3.static.flickr.com/2303/2338201273_7e6e9ac01d_m.jpg" width="107" height="240" alt="GNOME Clock" /></a></p>
