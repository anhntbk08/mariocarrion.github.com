---
date: 2010-06-22T15:54:14Z
title: 'Hackweek V: YaSTroid'
url: /2010/06/22/hackweek-v-yastroid.html
---

<p><a href="https://features.opensuse.org/hackweek">Hackweek</a> is an excellent opportunity to try something new. Hackweek V was not the exception. From June 7th to June 11th I joined a fantastic group of hackers to implement <a href="http://gitorious.org/opensuse/yastroid">YaSTroid</a>, our Android Front-end to <a href="http://en.opensuse.org/YaST/Web">WebYaST</a>.</p>
<p>The week was fun. Learning new stuff, in this case <a href="http://www.android.com/">Android</a>, always helps me to see things different and somehow makes me appreciate other development platforms. Recalling Java was not that difficult. Honestly I thought Java had something new to offer to all developers, but it seems that Java hasn't changed dramatically in years.</p>
<h3>WebYaST and YaSTroid</h3>
<p>WebYaST is an open source project which goal is to provide a web front-end for YaST functionality to enable remote 1:1 management. The interaction is basically like this (see the <a href="http://en.opensuse.org/YaST/Web/Architecture">detailed diagram</a> to get more information):</p>
<p><a href="http://www.flickr.com/photos/mariocarrion/4725368064/" title="WebYaST by Mario Carrion, on Flickr"><img src="http://farm2.static.flickr.com/1203/4725368064_2e9b9b8c0e.jpg" width="181" height="305" alt="WebYaST" class="aligncenter" /></a></p>
<p>WebYaST and YaSTroid communicate using the <a href="http://en.opensuse.org/YaST/Web/Development/REST_Service_Documentation">REST API</a>. If you have installed WebYaST you can access the documentation locally using:</p>
<pre>http://localhost/restdoc</pre>
<p>This website should show you a list of available methods and their arguments, if any, and examples showing you how to use them and the data returned. Pretty straightforward. Is also good idea to read the <a href="http://gitorious.org/opensuse/yast-rest-service">source code</a> in case the documentation is missing. Everything is written in Ruby, so it should really simple to read.</p>
<h3>Getting YaSTroid</h3>
<p>Developing YaSTroid requires having <a href="http://developer.android.com/sdk/index.html">Eclipse and Android</a> installed. After that clone the repository. Make sure you are using Android 1.5 when defining your virtual device.</p>
<pre>git clone git@gitorious.org:opensuse/yastroid.git</pre>
<h3>Result</h3>
<p><a href="http://www.flickr.com/photos/mariocarrion/4724778779/" title="WebYaST + YaSTroid by Mario Carrion, on Flickr"><img src="http://farm2.static.flickr.com/1030/4724778779_8956a64b5f_m.jpg" width="240" height="127" alt="WebYaST + YaSTroid" class="aligncenter"  /></a>&nbsp;&nbsp;<a href="http://www.flickr.com/photos/mariocarrion/4725501446/" title="WebYaST + YaSTroid by Mario Carrion, on Flickr"><img src="http://farm2.static.flickr.com/1200/4725501446_c826ac04d4_m.jpg" width="240" height="126" alt="WebYaST + YaSTroid"  class="aligncenter"  /></a></p>
<p>Stephen and Scott recorded a video demoing the application using a real device, I recommend watching it full-screen to see all details.</p>
<p>If you can't see the embedded video <a href="http://www.novell.com/common/flash/play.php?media=http://cdn.novell.com/cached/video/2010/misc/yastroid.flv">follow this link</a>.</p>
<h3>Useful links</h3>
<ul>
<li><a href="http://www.decriptor.com/2010/06/22/yastroid/">YaSTroid</a> by Stephen Shaw</li>
<li><a href="http://en.opensuse.org/YaST">YaST - openSUSE</a></li>
</ul>
