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
- author: "çŸ³å¤´å…”çš„åŸŽå ¡ &raquo; æ\x90žå®šedgyä¸­çš„Finepix F30"
  author_email: ""
  author_url: http://my.donews.com/booker/2007/02/10/finepix_f30_camera_on_edgy_ubuntu/
  content: "[...] å\x8F‚è€ƒäº† http://mario.monouml.org/index.php/2006/06/19/camera-debian/
    [...]"
  date: 2007-02-09 22:47:44 -0500
  date_gmt: 2007-02-10 04:47:44 -0500
  id: 4503
date: 2006-06-19T21:49:30Z
date_gmt: 2006-06-20 02:49:30 -0400
published: true
status: publish
tags:
- debian
- english
title: Camera + Debian
url: /2006/06/19/camera-debian/
wordpress_id: 289
wordpress_url: http://mario.monouml.org/index.php/2006/06/19/camera-debian/
---

<p>I don't know why my <a href="http://www.kodak.com/global/en/service/products/ekn030872.jhtml?pq-path=10/3905/7474/7489">camera</a> isn't added in the default gphoto-udev rules... however adding:</p>
<p><em>SYSFS{idVendor}=="040a", SYSFS{idProduct}=="059c", MODE="0660", GROUP="camera"</em></p>
<p>to:</p>
<p><em>/etc/udev/rules.d/025_libgphoto2.rules</em></p>
<p>fixes:</p>
<p><em>"An error occurred in the io-library. (Could not claim the USB device). Could not claim interface 0 (operation not permitted). Make sure no other program or kernel module (such as sdc2xx, stu680, spca50x) is using the device and you have read/write access to the device."</em></p>
<p>You need, of course, to add your user to <em>camera</em> group. <a href="http://www.flickr.com/photos/mariocarrion/170974400/">Nice</a> <a href="http://www.flickr.com/photos/mariocarrion/170974399/">pictures</a> by the way.</p>
