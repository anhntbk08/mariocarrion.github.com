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
date: 2006-04-02T03:46:08Z
date_gmt: 2006-04-02 06:46:08 -0400
published: true
status: publish
tags:
- ubuntu
- english
title: Default shortcut
url: /2006/04/02/default-shortcut/
wordpress_id: 264
wordpress_url: http://mario.monouml.org/index.php/2006/04/01/default-shortcut/
---

<p>When setting your default Key Shortcut for launching your music player seems to always launch <a href="http://www.gnome.org/projects/rhythmbox/">Rhythmbox</a>. Rhythmbox is good but I prefer using <a href="http://www.banshee-project.org/Main_Page">Banshee</a>, this is well <a href="https://launchpad.net/distros/ubuntu/+source/control-center/+bug/4265">known bug</a>, so, the quickest solution is a simple symbolic link:</p>
<p><code lang="sh">sudo ln -s /usr/bin/banshee /usr/local/bin/rhythmbox</code></p>
