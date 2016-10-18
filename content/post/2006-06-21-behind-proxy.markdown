---
date: 2006-06-21T13:26:06Z
title: Behind proxy
url: /2006/06/21/behind-proxy.html
---

<p>If you are using <a href="http://www.debian.org">Debian</a> at work and you need to update/upgrade or even install any debian package through <a href="http://www.debian.org/doc/manuals/apt-howto/">apt</a> and you are behind some MS proxy server (that's my case) you need to install <em><a href="http://packages.debian.org/stable/web/ntlmaps">ntlmaps</a></em> package and export some variables:</p>
<p><code lang="bash">function proxy(){<br />
        echo -n username:<br />
        read -e username<br />
        echo -n password:<br />
        read -es password<br />
        export http_proxy=http://$username:$password@proxyaddress:port/<br />
        export ftp_proxy=http://$username:$password@proxyaddress:port/<br />
        echo -e \nProxy environment variable set.<br />
}</code></p>
<p>Don't forget to change: <em>proxyaddress:port.</em> With this everything should work.</p>
<p>Want to know more? There are two references I read: <a href="http://www.debian-administration.org/articles/353">1</a>, <a href="http://blog.mypapit.net/2006/02/how-to-use-apt-get-behind-proxy-server-ubuntudebian.html">2</a>.</p>
