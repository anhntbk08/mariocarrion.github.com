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
comments:
- author: TermiT
  author_email: drtermit@gmail.com
  author_url: http://blog.termit.name/
  content: It's great feature. I  really like it. Gonna to tweet about it :)
  date: 2009-07-28 04:11:55 -0400
  date_gmt: 2009-07-28 08:11:55 -0400
  id: 14965
date: 2009-07-27T13:51:56Z
date_gmt: 2009-07-27 17:51:56 -0400
published: true
status: publish
tags:
- mono
- opensuse
- english
title: 'Hackweek IV: Gwibber + Sharing'
url: /2009/07/27/hackweek-iv-gwibber-sharing/
wordpress_id: 589
wordpress_url: http://blog.carrion.ws/?p=589
---

<p>I decided to try something different this <a href="http://news.opensuse.org/2009/07/08/hack-week-iv-approaches/">Hackweek</a> to learn a programming language and get involved into another exciting <em>software libre</em> project. There were too many options, too many good projects to work on. I selected <a href="http://live.gnome.org/Gwibber">gwibber</a> because of three reasons:</p>
<ol>
<li>gwibber supports several <a href="http://bazaar.launchpad.net/~gwibber-committers/gwibber/trunk/files/head%3A/gwibber/microblog/">microblogging services</a>, including my favorites: <a href="http://www.twitter.com/">Twitter</a> and <a href="http://www.facebook.com/">Facebook</a>.</li>
<li>gwibber is written in Python.</li>
<li>gwibber doesn't integrate with other gnome applications, for example <a href="http://projects.gnome.org/cheese/">Cheese</a> or <a href="http://live.gnome.org/Nautilus">Nautilus</a>.</li>
</ol>
<h3>So... what's the new cool feature?</h3>
<p>Something I like to call "Sharing Services". What's a <em>sharing service</em>? A sharing service is a service using an online provider to share data, easier impossible. For example: Images would be shared using <a href="http://twitpic.com/">Twitpic</a>, Videos would use <a href="http://yfrog.com/">yfrog</a>, Files would use <a href="http://drop.io/">Drop.io</a> and Plaint Text files would use <a href="http://pastebin.ca/">Pastebin</a> (this is configurable, in case you were wondering) I'm sure you got the idea.</p>
<p><a title="Data Sharing on Gwibber by Mario Carrion, on Flickr" href="http://www.flickr.com/photos/mariocarrion/3761746699/"><img src="http://farm3.static.flickr.com/2429/3761746699_f73e35f00b_m.jpg" alt="Data Sharing on Gwibber" width="240" height="186" /></a> <a title="Data Sharing on Gwibber by Mario Carrion, on Flickr" href="http://www.flickr.com/photos/mariocarrion/3762563436/"><img src="http://farm3.static.flickr.com/2528/3762563436_6dacc2b37b_m.jpg" alt="Data Sharing on Gwibber" width="240" height="183" /></a></p>
<h3>Technical approach</h3>
<p>The implementation is based on the following UML class diagram:</p>
<p><a title="Data Sharing on Gwibber by Mario Carrion, on Flickr" href="http://www.flickr.com/photos/mariocarrion/3762526330/"><img src="http://farm4.static.flickr.com/3516/3762526330_ccfdc15155_m.jpg" alt="Data Sharing on Gwibber" width="240" height="236" /></a></p>
<p>The idea is simple, subclass <em>Provider</em> and override <em>share</em> method and you are pretty much all set. I already implemented 3 services: <em>twitpic</em> to share images, <em>yfrog</em> to share images and video, and <em>pastebin.ca</em> to share plain text files. My plans include to implement the following providers:</p>
<h4>Plain text</h4>
<ul>
<li><a href="http://www.pastebin.cz/info/api">Pastebin.cz</a></li>
<li><a href="http://openpaste.org/en/help/#api-tools">OpenPaste</a></li>
</ul>
<h4>Video</h4>
<ul>
<li><a href="http://www.vimeo.com/">Vimeo</a></li>
<li><a href="http://twitvid.io/">Twitvid</a></li>
</ul>
<h4>Files</h4>
<ul>
<li><a href="http://drop.io/">Drop.io</a></li>
</ul>
<p>To allow communication between gnome/gtk/dbus-based applications I added a new dbus method: <em>share(filename,message)</em>, that way you can "share" your file using a message, you don't need to explicitly tell the provider+service to use, gwibber will use the filename's mime-type to get the valid provider and the configured service, convenient isn't it?</p>
<p><a title="Data Sharing on Gwibber  by Mario Carrion, on Flickr" href="http://www.flickr.com/photos/mariocarrion/3762638188/"><img src="http://farm3.static.flickr.com/2472/3762638188_992bfb26c3_m.jpg" alt="Data Sharing on Gwibber " width="240" height="183" /></a></p>
<h3>Where to get it?</h3>
<p>I branched <a href="https://code.launchpad.net/~gwibber-committers/gwibber/trunk">trunk</a> to implement this feature, you can read <a href="https://code.launchpad.net/~mario-carrion/gwibber/gwibber-services">launchpad</a> to get more information, basically you need to:</p>
<pre class="bash">bzr branch lp:~mario-carrion/gwibber/gwibber-services</pre>
<p>and execute:</p>
<pre class="bash">./bin/gwibber</pre>
<p>I also included a patch for cheese, I'm using <a href="http://git.gnome.org/cgit/cheese/log/?h=gnome-2-26">gnome-2-26</a> branch, in case you want to share your videos and images on gwibber using cheese.</p>
<h3>Cool video</h3>
<p><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="425" height="344" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="allowFullScreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="src" value="http://www.youtube.com/v/nbeRTHTfZjM&amp;hl=en&amp;fs=1&amp;color1=0x006699&amp;color2=0x54abd6" /><param name="allowfullscreen" value="true" /><embed type="application/x-shockwave-flash" width="425" height="344" src="http://www.youtube.com/v/nbeRTHTfZjM&amp;hl=en&amp;fs=1&amp;color1=0x006699&amp;color2=0x54abd6" allowscriptaccess="always" allowfullscreen="true"></embed></object></p>
<h3>Known bugs and issues</h3>
<p>I'm aware of several bugs, for example: web timeouts, invalid responses and random deadlocks, so take it easy, remember: <strong>this is a preview, be happy</strong>. Also I need to think about multiple instances and implementing a real HTTP handler instead of using the MultiPartForm class, will decide it later.</p>
<p>OpenSUSE 11.1 Users: you may need to install python-related dependencies. OpenSUSE 11.1-64, if you want to use the nautilus extension, you will need create a symbolic link in <em>/usr/lib/</em> for <em>libpython2.6.so</em>. I'm going to report the packing bug as soon as possible.</p>
<p>BTW, you can always follow me on twitter: <a href="http://www.twitter.com/mariocarrion">@mariocarrion</a> in case you want to recommend me a new provider.</p>
