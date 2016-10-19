---
date: 2010-01-25T22:15:59Z
title: Parallel Development Environments? Pulque!
url: /2010/01/25/parallel-development-environments-pulque.html
---

<p><a href="http://www.flickr.com/photos/astro-dudes/2735367731/"><img title="Â¡Quiero pulque! by Claire L. Evans" src="http://farm4.static.flickr.com/3108/2735367731_73c00175a0_m.jpg" alt="Â¡Quiero pulque!" width="240" height="180" /></a></p>
<p><a rel="cc:attributionURL" href="http://www.flickr.com/photos/astro-dudes/">By Claire L. Evans</a> / <a rel="license" href="http://creativecommons.org/licenses/by-nd/2.0/">CC BY-ND 2.0</a></p>
<p><em>This is an updated version of <a href="/2009/07/01/multiple-parallel-mono-environments/">Multiple Parallel Mono Environments</a>.</em></p>
<h3>What is Pulque?</h3>
<p><em>Pulque</em> is a collection of applications written in Ruby and Bash scripting to maintain parallel development environments.</p>
<h3>Why does Pulque exist?</h3>
<p>Three reasons:</p>
<ol>
<li>I need to keep <em>multiple versions installed</em> of the same software,</li>
<li>I need to know what <em>Version Control System</em> is used by the software, and the most important</li>
<li>I want to keep myself <strong>sane</strong>.</li>
</ol>
<p>At work, I have to interact with different open source projects, most of them use <a href="http://subversion.tigris.org/">Subversion</a> and <a href="http://git-scm.com/">Git</a>, but some others use <a href="http://bazaar.canonical.com/en/">Bazaar</a> and <a href="http://mercurial.selenic.com/">Mercurial</a>. Keeping track of the current parallel development environment and the VCS used by the software is exhausting.</p>
<p>You spend time focusing on something that shouldn't be that important: </p>
<ul>
<li>Managing your parallel environments and,</li>
<li>Keeping track of the VCS used by the software</li>
</ul>
<p>Is easy to get confused when interacting with the repository, for example, executing <em>svn update</em> when the software is stored in a <em>git</em> repository. Is silly, but <strong>it happens</strong>. Unless you are using an IDE that support Multiple Parallel Development Environments you will need the terminal to configure and build your projects.</p>
<p><em>Pulque</em> helps you maintaining parallel development environments by: </p>
<ul>
<li>Printing in the bash prompt the <em>name of the parallel development environment</em> and <em>the type of the VCS</em>, this information is updated depending on the working directory, </li>
<li>Defining aliases to the default commands used to configure and build the software project, to always prefix your projects using your parallel environment, and</li>
<li>Showing a failure or success alert when the command finishes.</li>
</ul>
<p><object width="425" height="344"><param name="movie" value="http://www.youtube.com/v/Fj3dsNwWOVQ&hl=en_US&fs=1&color1=0x3a3a3a&color2=0x999999"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/Fj3dsNwWOVQ&hl=en_US&fs=1&color1=0x3a3a3a&color2=0x999999" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="425" height="344"></embed></object></p>
<h3>Installing and using Pulque</h3>
<p>Follow the instructions in <a href="http://github.com/mariocarrion/pulque/blob/master/INSTALL">INSTALL</a>, or if you are using openSUSE 11.2:</p>
<p style="text-align: center;"><a href="http://download.opensuse.org/repositories/home:/MarioCarrion/openSUSE_11.2/pulque.ymp"><img alt="OneClick Install" src="http://www.mariocarrion.com/icons/oneclick.png" title="OneClick Install" width="162" height="46" class="aligncenter"  /><br />Click here to drink Pulque!</a></p>
<p>Don't forget to add the function <em>pswitch</em> to your <em>.bashrc</em>. Bash will autocomplete your environment name when using <em>TAB TAB</em>.</p>
<pre class="brush:bash">
function pswitch {
  source /usr/bin/__pswitch $1
}
</pre>
<p>Read the <a href="http://github.com/mariocarrion/pulque/blob/master/USING">USING</a> file to understand how to use <em>Pulque</em> in the daily basis. If you find something weird or interesting please <a href="http://github.com/mariocarrion/pulque/issues">create an issue</a> to fix it.</p>
<h3>Colophon</h3>
<p>According to <a href="http://en.wikipedia.org/wiki/Pulque ">Wikipedia</a>: "<em>Pulque, or octli, is a milk-colored, somewhat viscous alcoholic beverage made from the fermented sap of the maguey plant, and is a traditional native beverage of Mexico.</em>"</p>
