---
date: 2006-05-07T19:26:58Z
title: Working again
url: /2006/05/07/working-again.html
---

<p>I'm running Debian Sid in my laptop and I still don't know why the Debian package team uses a older <a href="http://ndiswrapper.sourceforge.net">ndiswrapper</a> version, current version (1.8), sometimes works and some others crashes the kernel, after downloading most recent version (1.16) and installing, <a href="http://iogear.com/main.php?loc=dm&driver&Item=GWP512#display">my PCMCIA card</a> is working again :-),</p>
<pre>root@decadence:~/Documents/Downloads/wireless/WINXP# dmesg |tail
pccard: CardBus card inserted into slot 0
ndiswrapper version 1.16 loaded (preempt=no,smp=no)
ndiswrapper: driver mrv8k51 (Marvell,01/19/2004,2.3.0.3) loaded
PCI: Enabling device 0000:03:00.0 (0000 -> 0002)
ACPI: PCI Interrupt 0000:03:00.0[A] -> Link [LNKA] -> GSI 11 (level, low) -> IRQ 11
PCI: Setting latency timer of device 0000:03:00.0 to 64
ndiswrapper: using irq 11
wlan0: vendor: 'Marvell 802.11 Driver'
wlan0: ndiswrapper ethernet device 00:0c:55:01:40:78 using driver mrv8k51, 11AB:1FA6.5.conf
wlan0: encryption modes supported: WEP; TKIP with WPA</pre>
