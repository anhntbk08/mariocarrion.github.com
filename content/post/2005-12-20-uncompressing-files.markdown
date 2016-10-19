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
date: 2005-12-20T22:15:56Z
date_gmt: 2005-12-21 02:15:56 -0500
published: true
status: publish
tags:
- personal
- english
title: Uncompressing files
url: /2005/12/20/uncompressing-files/
wordpress_id: 212
wordpress_url: http://mario.monouml.org/index.php/2005/12/20/uncompressing-files/
---

<p>I use MS Windows at work (not proud of it), and I use <a href="http://www.winzip.com">Winzip</a> for compressing my files, most recent version includes a newest compression level... I read bzip2 and I though I will be able to uncompress it from my Linux box...WRONG! They use a another algorithm based on the LZMA compression, however, I figure it out after trying the first time:</p>
<p><em>$ unzip filename.zip</em></p>
<p><em>skipping need PK compat. v4.6 (can do v2.1)</em></p>
<p>Then:</p>
<p><em>$ sudo apt-get install p7zip</em></p>
<p>Do the trick</p>
<p><em>7z e -y filename.zip</em></p>
<p>And done ;-)</p>
