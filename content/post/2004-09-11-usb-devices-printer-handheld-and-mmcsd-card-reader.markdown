---
date: 2004-09-11T01:48:30Z
title: 'USB Devices: Printer, Handheld and MMC/SD Card Reader'
url: /2004/09/11/usb-devices-printer-handheld-and-mmcsd-card-reader.html
---

<div style="clear:both;"></div>
<p>Yesterday and today I've spent almost all my freetime setting up my USB devices</p>
<ul>
<li>USB Printer: HP Deskjet 3650</li>
<li>USB Handheld: Palm Zire 71</li>
<li>USB MMC/SD Card Reader: Palm</li>
</ul>
<p><span style="font-weight:bold;">USB Printer</span></p>
<ol>
<li>We need the <span style="font-style:italic;">printer</span> module from the USB Devices</li>
<li>Then: <code>apt-get install cupsys hpijs foomatic-db-hpijs</code></li>
<li>Get the current <a href="http://www.linuxprinting.org/show_printer.cgi?recnum=HP-DeskJet_3650">HP's driver</a></li>
<li><code># /etc/init.d/cupsys restart</code></li>
<li>Add your printer using the CUPS manager.<br /><code>$ mozilla-firefox <a href="http://localhost:631">http://localhost:631</a></code></li>
<li>Test it, have fun</li>
</ol>
<p><span style="font-weight:bold;">USB Handheld</span></p>
<ol>
<li>We need the <span style="font-style:italic;">visor</span> module from the USB Serial</li>
<li>Then: <code>apt-get install pilot-link jpilot</code></li>
<li>Ask the answer from dpkg</li>
<li>Run terminal, then <code>$ jpilot</code></li>
<li>Test it, have fun</li>
</ol>
<p><span style="font-weight:bold;">USB MMC/SD Card Reader</span></p>
<ol>
<li>We need the <span style="font-style:italic;">store</span> module from the USB Storage</li>
<li>Then: <code>apt-get install sg3-utils</code></li>
<li>Plug the reader, then: <code># cat /proc/scsi/scsi</code></li>
<li>Then: <code># sg_scan -i && sg_map</code></li>
<li>Mount it, test it, have fun</li>
<li>Don't  forget to umount it when finished</li>
</ol>
<p>The printer works pretty well, the palm works pretty well and the card reader works pretty well. Everything goes fine.</p>
<p><span style="font-weight:bold;">I learned today:</span> 'Too close for being an end-user environment'
<div style="clear:both; padding-bottom: 0.25em;"></div>
