---
date: 2016-12-20T00:00:00Z
title: "Upgrading Laptop's hard drive"
description: "After 6 years it was time to make an upgrade, this time the hard drive"
url: /2016/12/20/upgrading-latops-hard-drive.html
---

Back in 2010 I bought my first ever [Macbook Pro](https://support.apple.com/kb/sp582?locale=en_US), a shiny 2.4 GHz Intel Core i5 with 4GB of RAM. In 2011 I upgraded the memory from 4GB to 8GB with a pair of [Kingston 4GB Modules](https://smile.amazon.com/gp/product/B001PS9UKW/), in 2014 I replaced the original battery with an [Anker one](https://smile.amazon.com/gp/product/B00D77FL7K/), not the best one but whatever; now two years later, 2016, I decided to replace the factory Hard Drive with an SSD, the original Hitachi 320GB with a [Crucial 275GB SSD](https://smile.amazon.com/gp/product/B01IAGSD5O/) and **what a great difference!**

I believe the huge difference comes because well, the original hard drive is 6 years old already and this new one is an SSD, not a fair comparison but I like the biased results. Everything has improved: booting time, wake up time, even the time it took me to open new iTerm2 tabs, I'm so happy. The truth is that before considering replacing the HDD I was thinking about getting a brand new laptop, a Windows Laptop to be precise, I was thinking about a Windows one because multiple developers are really enjoying the Linux integration, so I wanted to give it a try.

{{< tweet 801449292716212224 >}}

But you know I was hesitant to buy a new laptop, investing $1,300+ it's too much right now, so for $84 I get what I need at this precise moment, old laptop feels like a new one. Hopefully I can replace my laptop's battery as well because it is time as well.

Replacing the hard drive was a breeze, iFixit has a [phenomenal guide](https://www.ifixit.com/Guide/MacBook+Pro+15-Inch+Unibody+Mid+2010+Hard+Drive+Replacement/3030) that details every step, you just need to have the right tools otherwise you won't go too far (Torx and Tri-win screwdrivers are a pain to find!)

Installing and upgrading macOS was the thing that took me the most time, about 2-3 hours to have everything installed and upgraded. I tried installing Sierra directly by using the [Internet Recovery Option](https://support.apple.com/en-us/HT201314), but that did not work, I was getting a timeout error because, apparently, my WiFi was not working correctly.

In the end I installed it from the original DVD (macOS 10.6.5) and slowly upgraded every minor version until 10.7, after that I upgraded to Sierra. Slow process but it worked with zero issues.

{{< tweet 811062471997931520 >}}

{{< tweet 811084576617594880 >}}

I also had to update my [BOOSTRAP file](https://github.com/MarioCarrion/mc-profile/blob/master/BOOTSTRAP.md) to include the most recent changes I had to do to have everything running correctly with this new upgrade. I want to start using Docker for everything (except git and vim) so installing things locally (like _rvm_, _databases_ or whatever required libraries) are no no for me now, no need to clutter my laptop, also containers are life.
