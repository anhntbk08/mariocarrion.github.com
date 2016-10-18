---
date: 2010-03-03T13:02:27Z
title: Accessibility in Moonlight
url: /2010/03/03/accessibility-in-moonlight.html
---

<p>An important milestone happened on Friday, February 26: <a href="http://mono-project.com/Accessibility">Mono Accessibility</a> 2.0 <a href="http://mono-project.com/Accessibility:_Release_Notes_2.0">was released</a>. It's important because all applications running on <a href="http://www.mono-project.com/Moonlight">Moonlight</a> 2.0, or greater, will be accessible from now on.</p>
<h3>Accessibility?</h3>
<p>If you are not familiar with this word, <em>Accessibility</em>, it might mean nothing to you and, probably, you will need a more <em>formal</em> definition:</p>
<blockquote><p>"<em>Accessibility is a general term used to describe the degree to which a product, device, service, or environment is accessible by as many people as possible. Accessibility can be viewed as the <strong>ability to access</strong> and possible benefit of some system or entity. Accessibility is often used to focus on people with disabilities and their right of access to entities, often through use of assistive technology." <a href="http://en.wikipedia.org/wiki/Accessibility">Wikipedia</a></em></p></blockquote>
<p>You have interacted with Accessibility in real life, even if this is your first time reading this word. Have you seen those tiny bumps on the floor when taking the subway? Wheelchairs ramps or the dots on elevator buttons? Have you heard that noise, like beeping, when crossing the street? Have you noticed the audio jack in some ATMs?</p>
<p>These are real life examples of Accessibility. Accessibility in software is similar, it's basically the degree of interaction between your software and people with temporal or permanent disabilities. People who can only use the keyboard or the mouse, people with low vision, blind people or people with hearing disabilities. All of them will be able to interact and use your application only if it's accessible. That's why Accessibility is important.</p>
<h3>Accessibility and Moonlight</h3>
<p><a href="http://www.silverlight.net/">Microsoft Silverlight</a> is web application framework for building media experiences and rich interactive applications for the Web. Moonlight is an open source implementation of Silverlight. Besides providing a rich experience for the web, applications running on Moonlight are now available for people with disabilities, allowing them to interact and use these applications. The interaction between these new applications and existent Accessibility Technologies (ATs), such as screen readers, is the same. All existent ATs are reused, it's like interacting with any other desktop application. ATs in GNOME should work right now without any change and, if any change is required, it will help to provide a better integration with this framework.</p>
<h3>Implementation</h3>
<p><a href="http://www.flickr.com/photos/mariocarrion/4402576905/" title="Moonlight Atk Bridge by Mario Carrion, on Flickr"><img src="http://farm3.static.flickr.com/2745/4402576905_5c2ec4cefd.jpg" width="419" height="230" alt="Moonlight Atk Bridge" class="aligncenter" /></a></p>
<p><em>Refer to <a href="http://www.mono-project.com/Accessibility:_Architecture">Accessibility Architecture</a> for a detailed explanation of the complete architecture.</em></p>
<p>In both Accessibility implementations, Silverlight and Moonlight, <a href="http://msdn.microsoft.com/en-us/library/ms747327.aspx">Microsoft UI Automation</a> is used for interacting and exposing data of UI elements of the application. These data are used by ATs to access and manipulate those UI elements. Properties such as visibility, sensitivity or interaction, are exposed by <a href="http://msdn.microsoft.com/en-us/library/ms747229.aspx">Automation Peers</a> (also known as Automation Providers), along with <a href="http://msdn.microsoft.com/en-us/library/ms742306.aspx">Automation Patterns</a> to indicate the type of interaction in the control, for example: accepting selection or allowing clicking. There's always a relation one to one, one Automation Peer and one Control. The properties are available to ATs through the information exposed by the UIA/Atk Bridge module. This module is loaded by the Moonlight application to interact with ATs. It keeps a tree of <a href="http://library.gnome.org/devel/atk/">Atk</a> objects to represent every UI Automation element in the Moonlight application.</p>
<p>The interaction between ATs and Moonlight applications is like this:</p>
<ol>
<li>An AT requests information about the Moonlight control in Firefox.</li>
<li>Firefox asks Moonlight this information.</li>
<li>Moonlight uses the <em>A11yHelper</em> to load the UIA/Atk bridge module and returns the <a href="http://anonsvn.mono-project.com/viewvc/trunk/uia2atk/MoonAtkBridge/MoonAtkBridge/Moonlight.AtkBridge/RootVisualAdapter.cs">root accessible</a>, it represents the control's Automation Peer: <a href="http://anonsvn.mono-project.com/viewvc/trunk/moon/class/System.Windows/System.Windows.Automation.Peers/WindowAutomationPeer.cs">WindowAutomationPeer</a>.</li>
<li>From now on, new AutomationPeers will be mapped, one-to-one, to an Atk.Object. All data requested by an AT will be accessed through the associated Atk.Object, and this one will return information contained in the AutomationPeer.</li>
</ol>
<p>If you are curious you can checkout the sources to see the final implementation:</p>
<ul>
<li><a href="http://anonsvn.mono-project.com/viewvc/trunk/moon/">Moonlight</a>: important bits located in <em>class/System.Windows/System.Windows.Automation.Peers/</em> and <em>class/System.Windows/Mono/A11yHelper.cs</em>.
  </li>
<li><a href="http://anonsvn.mono-project.com/viewvc/trunk/uia2atk/">Moonlight UIA/Atk Bridge</a>: implementation located in <em>MoonAtkBridge/</em>.</li>
</ul>
<h3>How do I install it?</h3>
<p>Before installing, make sure <a href="http://library.gnome.org/users/user-guide/stable/goscustaccess-11.html.en">Assistive Technologies</a> is enabled, then add the Mono UIA repository  (see <a href="http://mono-project.com/Accessibility:_Release_Notes_2.0#Downloading">Downloading</a>) and follow the instructions (taken from <a href="http://mono-project.com/Accessibility:_Release_Notes_2.0#Installing">Installing</a>):</p>
<ol>
<li>Install the updated <em>xulrunner</em> package from the above repositories. (This is required until Firefox 3.7 because of <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=480317">bug #480317</a>)</li>
<li>Install <em>Novell Moonlight with Accessibility Support</em> for <a href="http://mono-a11y.org/releases/2.0/i586/novell-moonlight.xpi">32 bit</a> or <a href="http://mono-a11y.org/releases/2.0/x86_64/novell-moonlight.xpi">64 bit</a>.</li>
<li>Install <em><a href="http://mono-a11y.org/releases/2.0/noarch/novell-moonlight-a11y.xpi">Novell Moonlight Accessibility Extensions</a></em></li>
<li>Restart Firefox</li>
<li>Enjoy!</li>
</ol>
<h3>Useful links</h3>
<ul>
<li><a href="http://msdn.microsoft.com/en-us/windows/bb735024.aspx">Accessibility. Windows Developer Center</a></li>
<li><a href="http://msdn.microsoft.com/en-us/library/cc707824(VS.95).aspx">Silverlight: Accessibility Overview</a></li>
<li><a href="http://projects.gnome.org/accessibility/">GNOME Accessibility</a></li>
<li><a href="http://brad.getcoded.net/blog/entry.php?e=1537848530">Mono Accessibility 2.0 unleashed!</a></li>
</ul>
