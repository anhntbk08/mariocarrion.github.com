---
date: 2008-10-05T00:02:57Z
title: HP Pavilion TX2500z. Part I
url: /2008/10/05/hp-pavilion-tx2500z-part-i.html
---

<p>I have no complains about my <a href="http://blog.carrion.ws/2007/08/03/dell-inspiron-1420/">Dell Inspiron 1420</a>, (I love it, indeed), is lighter than my <a href="http://blog.carrion.ws/2005/03/30/finalmente-2/">older Dell Inspiron 1150</a>, however I decided to get a new one for several reasons, the most import is that I really want to spend more time playing with <a href="http://www.mono-project.com/Moonlight">Moonlight</a> and Drawing Recognition, so getting a Tablet PC was the next step. The ugly about Tablet PCs is the price, most of them are really expensive, I spent a lot time reviewing the <a href="http://shop.lenovo.com/us/notebooks/thinkpad/x-series-tablet">Lenovo X61</a>, <a href="http://www.dell.com/tablet">Dell XT</a> and <a href="http://www.tabletpc.toshiba.com">Toshiba Portege</a>, however I found one with great hardware and good price: <a href="http://shopping.hp.com">HP Pavilion TX2500z</a>.</p>
<p>I'm aware that supporting Tablet PCs in Linux is not the most common thing, is not like people buying Tablet PCs to install Linux, you don't see that, actually, I haven't seen (live) someone using a Tablet PC with Linux; and, being honest with you, I don't trust HP because of a previous hardware experience, but, that was long time ago (6 years I think), so this time I decided to give it a try and being brave (really brave!), and, actually I have no complains about the hardware.</p>
<p>Running OpenSUSE 11 in HP Pavilion TX2500z is somehow hard, will take you time but, I think is worth it. I installed it using OpenSUSE 11 DVD, so here we go!.</p>
<p>My HP Pavilion TX2500z hardware is the following:</p>
<ul>
<li>AMD Turion(TM) X2 Ultra Dual-Core Mobile Processor ZM-86 (2.4 GHz)</li>
<li>12.1" diagonal WXGA High-Definition HP BrightView Widescreen (1280 x 800) w/Integrated Touch-screen</li>
<li>4GB DDR2 System Memory</li>
<li>ATI Radeon HD 3200 Graphics</li>
<li>320GB 5400RPM SATA Hard Drive</li>
<li>Webcam and Fingerprint Reader</li>
<li>802.11a/b/g/n WLAN and Bluetooth</li>
<li>SuperMulti 8X DVD+/-R/RW with Double Layer Support</li>
</ul>
<p>lspci:</p>
<p><code><br />
00:00.0 Host bridge: Advanced Micro Devices [AMD] RS780 Host Bridge<br />
00:01.0 PCI bridge: Advanced Micro Devices [AMD] RS780 PCI to PCI bridge (int gfx)<br />
00:04.0 PCI bridge: Advanced Micro Devices [AMD] RS780 PCI to PCI bridge (PCIE port 0)<br />
00:05.0 PCI bridge: Advanced Micro Devices [AMD] RS780 PCI to PCI bridge (PCIE port 1)<br />
00:06.0 PCI bridge: Advanced Micro Devices [AMD] RS780 PCI to PCI bridge (PCIE port 2)<br />
00:11.0 SATA controller: ATI Technologies Inc SB700/SB800 SATA Controller [AHCI mode]<br />
00:12.0 USB Controller: ATI Technologies Inc SB700/SB800 USB OHCI0 Controller<br />
00:12.1 USB Controller: ATI Technologies Inc SB700/SB800 USB OHCI1 Controller<br />
00:12.2 USB Controller: ATI Technologies Inc SB700/SB800 USB EHCI Controller<br />
00:13.0 USB Controller: ATI Technologies Inc SB700/SB800 USB OHCI0 Controller<br />
00:13.1 USB Controller: ATI Technologies Inc SB700/SB800 USB OHCI1 Controller<br />
00:13.2 USB Controller: ATI Technologies Inc SB700/SB800 USB EHCI Controller<br />
00:14.0 SMBus: ATI Technologies Inc SBx00 SMBus Controller (rev 3a)<br />
00:14.1 IDE interface: ATI Technologies Inc SB700/SB800 IDE Controller<br />
00:14.2 Audio device: ATI Technologies Inc SBx00 Azalia<br />
00:14.3 ISA bridge: ATI Technologies Inc SB700/SB800 LPC host controller<br />
00:14.4 PCI bridge: ATI Technologies Inc SBx00 PCI to PCI Bridge<br />
00:14.5 USB Controller: ATI Technologies Inc SB700/SB800 USB OHCI2 Controller<br />
00:18.0 Host bridge: Advanced Micro Devices [AMD] Family 11h HyperTransport Configuration (rev 40)<br />
00:18.1 Host bridge: Advanced Micro Devices [AMD] Family 11h Address Map<br />
00:18.2 Host bridge: Advanced Micro Devices [AMD] Family 11h DRAM Controller<br />
00:18.3 Host bridge: Advanced Micro Devices [AMD] Family 11h Miscellaneous Control<br />
00:18.4 Host bridge: Advanced Micro Devices [AMD] Family 11h Link Control<br />
01:05.0 VGA compatible controller: ATI Technologies Inc RS780M/RS780MN [Radeon HD 3200 Graphics]<br />
08:00.0 Network controller: Broadcom Corporation BCM4322 802.11a/b/g/n Wireless LAN Controller (rev 01)<br />
09:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168B PCI Express Gigabit Ethernet controller (rev 02)<br />
</code></p>
<p>Forget about everything you find in <a href="http://www.google.com/search?q=HP+Pavilion+TX2500z+Linux&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a">Google</a> (if you find something!), or forums, and so on. Seems that this hardware is an upgraded version, so, any NVidia-based guide won't work, but you can use it as reference.</p>
<p><strong>Installation</strong></p>
<p>Start as usual, booting the DVD, and using the following kernel arguments:</p>
<pre>acpi=off</pre>
<p>otherwise you'll get a black screen after the "OpenSUSE Loading" progress bar, and of course, this means that you won't be able to install it. <a href="https://bugzilla.novell.com/show_bug.cgi?id=430453">Bug #430453</a>. Remember to remove "acpi=off" from your kernel arguments after installing: open YaST and edit it, in "Boot Loader". Don't forget to update your OpenSUSE before continuing.</p>
<p><strong>Video configuration</strong></p>
<p>By default you will use <em>vesa</em> in your Video card, so, you'll need ATI drivers ( <em>fglrx</em>), just follow the <a href="http://en.opensuse.org/ATI_Driver_HOWTO">1-click installer</a>. After installation don't forget to logout. Then use a terminal: CTRL+ALT+F1 and:</p>
<ul>
<li>Stop gdm:
<pre>sudo gdm-stop</pre>
</li>
<li>Update Xorg file:
<pre>sudo aticonfig --initial</pre>
</li>
<li>Run:
<pre>sudo sax2 -r</pre>
</li>
<li>Sax2 will detect your card, however, you will have to explicitly indicate your first mouse device, select "Synaptics" and save your settings, otherwise using your mousepad will be <strong>really</strong> annoying.</li>
<li>Start GDM:
<pre>gdm-start</pre>
</li>
</ul>
<p>Compiz works, but I recommend you to disable <em>"mimap"</em> in "Application Switcher" Compiz Plugin, otherwise you will see a blank screen in each application preview when doing ALT+TAB.</p>
<p><strong>Sound</strong></p>
<p>The Sound Card is detected, but doesn't work, you can use YaST to set the model in your Sound Card, however due to a bug the value isn't saved (<a href="https://bugzilla.novell.com/show_bug.cgi?id=430734">Bug #430734</a>), so you have to edit: <em>/etc/modprobe.d/alsa-base</em> and add the following line:</p>
<pre>options snd-hda-intel model=dell</pre>
<p><strong>Wireless</strong></p>
<p>I found in several forums that enabling ndiswrapper and installing the MS Windows driver will allow you to use your wireless card, however, it didn't work for me. I installed <a href=" http://www.broadcom.com/support/802.11/linux_sta.php">official Broadcom module</a> instead. You will need to download the x64 version (of course!) and follow the <a href="http://www.broadcom.com/docs/linux_sta/README.txt">README</a>. I copied the tar.gz to <em>/opt/bcm4322</em> because I wanted to install the module automatically into the kernel every time the computer starts up, so editing: <em>/etc/init.d/boot.local</em> and adding the following lines make it happen: </p>
<ul>
<li>/sbin/modprobe -k ieee80211_crypt_tkip</li>
<li>/sbin/insmod /opt/bcm4322/wl.ko</li>
</ul>
<p><strong>Tablet PC</strong></p>
<p>Don't forget to read the <a href="http://en.opensuse.org/TabletPCs">OpenSuSE Tablet PC Page</a>. First, you will have to add a new repository that includes support for this Tablet PC</p>
<pre>http://download.opensuse.org/repositories/home:/dkukawka/</pre>
<p>and install the following packages:</p>
<ul>
<li>wacom-kmp-default</li>
<li>x11-input-wacom</li>
<li>x11-input-wacom-tools</li>
</ul>
<p>Next, to load your wacom module automatically you have to edit your <em>/etc/init.d/boot.local</em>:</p>
<p><pre>/sbin/modprobe -k wacom</pre></p>
<p>You will have to log out and log in before setting up your Tablet support. Open YaST to configure your X11, in "Graphics Card and Monitor", your screen will be black, don't get scared, this is expected. In YaST you will have to modify your screen resolution to 12.2, because by default is detected as something else, otherwise the Pen won't work as expected because of the screen resolution. (<a href="https://bugzilla.novell.com/show_bug.cgi?id=430527">Bug #430527</a>)</p>
<p><strong>Screen Rotation</strong></p>
<p>Seems that Screen Rotation isn't yet supported, (according to <a href="http://wiki.cchtml.com/index.php/Features">this</a>), there's an open bug in ATI Drivers that you <a href="http://ati.cchtml.com/show_bug.cgi?id=119">can follow</a>, is 3 years old :). However seems that some brave people had managed to get it, I haven't tested it:</p>
<ul>
<li>http://ubuntuforums.org/showthread.php?p=4680284</li>
<li>http://ubuntuforums.org/showthread.php?t=703806</li>
</ul>
<p><strong>Memory Card Reader</strong></p>
<p>Nothing to configure here. Plug your card and it should mount it automatically.</p>
<p><strong>Bluetooth</strong></p>
<p>Nothing to configure here.</p>
<p><strong>Webcam</strong></p>
<p>Nothing to configure here, run <em><a href="http://live.gnome.org/Cheese">cheese</a></em> and have fun.</p>
<p><strong>Fingerprint Reader</strong></p>
<p>You need to add the following repository to YaST. (<a href="https://bugzilla.novell.com/show_bug.cgi?id=432199">Bug 432199</a>)</p>
<pre>http://download.opensuse.org/repositories/home:/dgege:/fprint/openSUSE_11.0/</pre>
<p>and install the following packages: <em>pam_fprint libfprint fprint_demo</em>. Notice that even the device is supported I don't see a real use for it, IMO, I mean, the integration is not yet tight so, you can't do too much. To configure your fingerprint you have to do execute:</p>
<pre>fprint_demo</pre>
<p>Your user must be in the <em>fprint</em> group. Scan your fingerprints. BTW, there's a bug in the x86_64 package, you can fix it doing the following:</p>
<pre>ln -s /lib/security/pam_fprint.so /lib64/security/</pre>
<p>This is needed if you want to test your fingerprint with PAM: <em>/etc/pam.d/common-auth</em> </p>
<pre>authÂ Â  sufficientÂ Â Â Â Â  pam_fprint.so</pre>
<p><strong>Remote Controls</strong></p>
<p>I haven't set up this completely, however seems that the device is somehow supported. You will need the following package: <em>lirc-kmp-default lirc-32bit</em>. I've followed <a href="http://gentoo-wiki.com/Lirc">Gentoo's LIRC Page</a>, but nothing. If you find the way to set the Remote Control, let me know.</p>
