---
date: 2010-08-26T10:09:37Z
title: Mono Accessibility 2.1
url: /2010/08/26/mono-accessibility-2-1.html
---

[![Candles](http://farm5.static.flickr.com/4136/4886351160_d6472b6aea_m.jpg)](http://www.flickr.com/photos/mariocarrion/4886351160/ "Candles by Mario Carrion, on Flickr")

Last [Tuesday](http://mono-project.com/Accessibility:_Release_Notes_2.1), we presented [Mono Accessibility](http://mono-project.com/Accessibility) 2.1. We worked really hard on this release. Our main goals were, among other things, to improve our [UI Automation](http://msdn.microsoft.com/en-us/library/ms753107.aspx) Client API implementation, polish the interaction with at-spi2, better Moonlight accessibility and to handle custom and client-side providers. The great work made by all the contributors was the reason this release accomplished those goals.

### What happened since last time?

Explaining this release is kind of hard if you are not involved in Mono Accessibility, and even more difficult if you're not involved in Accessibility at all. However, if you're familiar with Mono and .NET you are, also, aware of the possibility of developing .NET-based applications that run on both platforms with minor* changes or no changes at all. But, before the implementation of Mono Accessibility, there was something missing: all those applications were not accessible.

This meant two things. First Atk-based Assistive Technologies (ATs) were not able to access Windows Forms nor Silverlight applications. Second .NET-based ATs using UI Automation were not able to run on Mono. Making them useless for people requiring Accessibility to interact with software running Mono on Linux**.

After the implementation of Mono Accessibility, we have: 

*   UI Automation API Framework
*   Bridge between UI Automation and ATK

This way ATs using either Accessibility Technology, Atk or UI Automation, will be able to interact with Gtk+, Windows Forms and Silverlight applications, with no changes at all.

### This is what happened

In the following video: (if you are using a RSS reader click [this link](http://www.youtube.com/watch?v=NwMXYXGincE)) [gcalctool](http://live.gnome.org/Gcalctool) is launched and an application, using UI Automation Client API, interacts with it, clicking buttons "2", "+", "3" and "=".
</p>

Then [UIA Explorer](http://github.com/mattguo/UIAExplorer), a .NET- based application using UI Automation Client API, also interacts with gcalctool, if you pay attention you will notice that UIA Explorer also lists all other Gtk+ based applications, such as Nautilus and the GNOME Panel.

Finally Mozilla Firefox is executed (both Novell Moonlight with Accessibility Support and Novell Moonlight Accessibility Extensions plugins were installed prior running it) and an Atk-based Accessility Debugger, [Accerciser](http://live.gnome.org/Accerciser), is launched to interact with the Moonlight application.

<object width="425" height="330"><param name="movie" value="http://www.youtube.com/v/NwMXYXGincE?fs=1&amp;hl=en_US&amp;rel=0&amp;hd=1"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/NwMXYXGincE?fs=1&amp;hl=en_US&amp;rel=0&amp;hd=1" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="425" height="330"></embed></object>

The source code used to test GCalctool is the following:

{{< highlight csharp >}}
// gmcs -pkg:mono-uia gcalc.cs && mono gcalc.exe

using System;
using System.Linq;
using System.Windows.Automation;

namespace Mono.A11y.Examples {
	public class GCalc {
		public static void Main (string []args)
		{
			AndCondition cond
				= new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty,
				                                            ControlType.Window),
				                    new PropertyCondition (AutomationElementIdentifiers.NameProperty, "Calculator"));
			var gcalc = AutomationElement.RootElement.FindFirst (TreeScope.Children, cond);

			cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty,
			                                                 ControlType.Button),
			                         new PropertyCondition (AutomationElementIdentifiers.NameProperty, "Add"));
			var addButton = gcalc.FindFirst (TreeScope.Descendants, cond);

			cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty,
			                                                 ControlType.Button),
			                         new PropertyCondition (AutomationElementIdentifiers.NameProperty, "Numeric 2"));
			var Button2 = gcalc.FindFirst (TreeScope.Descendants, cond);

			cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty,
			                                                 ControlType.Button),
			                         new PropertyCondition (AutomationElementIdentifiers.NameProperty, "Numeric 3"));
			var Button3 = gcalc.FindFirst (TreeScope.Descendants, cond);

			cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty,
			                                                 ControlType.Button),
			                         new PropertyCondition (AutomationElementIdentifiers.NameProperty, "Calculate result"));
			var calcButton = gcalc.FindFirst (TreeScope.Descendants, cond);

			cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty,
			                                                 ControlType.Button),
			                         new PropertyCondition (AutomationElementIdentifiers.NameProperty, "Calculate result"));
			var resultText = gcalc.FindFirst (TreeScope.Descendants, cond);

			// Clicking buttons
			InvokePattern addInvoke = (InvokePattern) addButton.GetCurrentPattern (InvokePattern.Pattern);
			InvokePattern Invoke2 = (InvokePattern) Button2.GetCurrentPattern (InvokePattern.Pattern);
			InvokePattern Invoke3 = (InvokePattern) Button3.GetCurrentPattern (InvokePattern.Pattern);
			InvokePattern calcInvoke = (InvokePattern) calcButton.GetCurrentPattern (InvokePattern.Pattern);

			System.Console.WriteLine ("Pressing \"2\"");
			System.Threading.Thread.Sleep (500);
			Invoke2.Invoke ();

			System.Console.WriteLine ("Pressing \"+\"");
			System.Threading.Thread.Sleep (500);
			addInvoke.Invoke ();

			System.Console.WriteLine ("Pressing \"3\"");
			System.Threading.Thread.Sleep (500);
			Invoke3.Invoke ();

			System.Console.WriteLine ("Pressing \"=\"");
			System.Threading.Thread.Sleep (500);
			calcInvoke.Invoke ();
		}
	}
}
{{< / highlight >}}


### Where do I get it?

If you installed [Mono Accessibility 2.0](2010/03/03/accessibility-in-moonlight/) an option to upgrade should be available now, if not Mono Accessibility is available for a variety of Linux distributions, including:

*   openSUSE 11.2 [1-Click Install](http://download.opensuse.org/repositories/Mono:/UIA/openSUSE_11.2/mono-uia.ymp)
*   Ubuntu Karmic Koala [Package Archive on Launchpad](https://edge.launchpad.net/~mono-a11y/+archive/releases)
*   Fedora 12 [openSUSE Build Service<a />](http://download.opensuse.org/repositories/Mono:/UIA/Fedora_12/ Repository)

Moonlight applications require the following extra steps:

*   Install the updated _xulrunner_ package from the above repositories. _(Required until patch on [bug #480317](https://bugzilla.mozilla.org/show_bug.cgi?id=480317)) gets approved._
*   Install Novell Moonlight with Accessibility Support for [32 bit](http://www.mono-a11y.org/archive/moonlight-plugins/2.3.99.0accessibility/novell-moonlight-2.3.99.0accessibility-i586.xpi) or [ 64 bit](http://www.mono-a11y.org/archive/moonlight-plugins/2.3.99.0accessibility/novell-moonlight-2.3.99.0accessibility-x86_64.xpi).
*   Install [Novell Moonlight Accessibility Extensions](http://www.mono-a11y.org/archive/moonlight-a11y-plugins/2.1/novell-moonlight-a11y-2.1-noarch.xpi)

Have fun and if you find any bug with this release, please [file it](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation file bugs). If you want to contribute or need specific assistance, please join our [mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or drop in [#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

* _Of course this depends on what APIs you are using. If you want to know how compatible is your application try [MoMA](http://www.mono-project.com/MoMA)._

** _Notice however, even though Mono is muti platform and UI Automation is included in both Mono and Silverlight, in order to allow other ATs running on other platforms, different than Linux, you will require to implement an specific bridge to talk to you OS Accessibility Layer._
