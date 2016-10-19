---
date: 2016-09-16T00:00:00Z
description: Two weeks ago I started using Docker and Go professionally for real.
image: https://c1.staticflickr.com/9/8279/29287312352_795a8f361c_o.png
image_facebook: https://c1.staticflickr.com/9/8394/28771369964_29174cf13f_o.png
title: First Sprint with Go and Docker
url: /2016/09/16/first-sprint-with-go-and-docker.html
---

In my previous [September 2016 Goals]({{< relref "2016-09-01-_sept-2016.markdown" >}}) post I mentioned that I finally had the chance to start working professionally with Go and Docker, well, how did it [Go](https://golang.org/)?

The truth is that just like with any other new thing you start learning, it takes time to get used to and there's a learning curve. It's frustrating and encouraging at the same time because you have the solution in your head but putting it in _words_ it's more difficult. The best analogy I can think of this experience would be ordering food in a foreign country where the language you speak is not spoken by the locals. Simple as that. You're hungry, you know what you want to eat but you can't express it in proper words, you need to use your hands, maybe draw a couple of things, ask for help, etcetera, etcetera, and all of that takes time.

Well, that's how it went.

* Preparing my Dockerfiles for statically building a go binary was easy, until I started having issues with [imagick](https://github.com/gographics/imagick), which so far I haven't been able to figure out.
* Making sure everything was 100% covered, again took me some time, not because the packages [testing](https://golang.org/pkg/testing/) and [net/http/httptest](https://golang.org/pkg/net/http/httptest/) are difficult to use but more because I had to properly write the code in a way it allowed [interfaces](https://tour.golang.org/methods/4) so I could mock the things I needed to to properly test everything.

In the end, this new project is still a work in progress and it is not ready for production, I believe I will need at least another sprint to finally have it ready, and the truth is that I haven't had enough time to consider the production-specific problems, like deployment, monitoring, logging and whatnot.

In all honesty I'm enjoying programming, **a lot**, in Go and using Docker is a **delight**. I know everything is taking longer than expected, but that's the way it is when building and using something new. However I know one thing for sure: this sprint is going be much more amazing.
