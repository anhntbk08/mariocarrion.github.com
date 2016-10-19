---
date: 2006-04-02T03:46:08Z
title: Default shortcut
url: /2006/04/02/default-shortcut.html
---

<p>When setting your default Key Shortcut for launching your music player seems to always launch <a href="http://www.gnome.org/projects/rhythmbox/">Rhythmbox</a>. Rhythmbox is good but I prefer using <a href="http://www.banshee-project.org/Main_Page">Banshee</a>, this is well <a href="https://launchpad.net/distros/ubuntu/+source/control-center/+bug/4265">known bug</a>, so, the quickest solution is a simple symbolic link:</p>
<p><code lang="sh">sudo ln -s /usr/bin/banshee /usr/local/bin/rhythmbox</code></p>
