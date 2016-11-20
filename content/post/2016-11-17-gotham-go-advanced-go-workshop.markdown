---
date: 2016-11-17T00:00:00Z
title: "GothamGo 2016: Advanced Go Workshop"
description: "I attended Advanced Go Workshop by William Kennedy"
url: /2016/11/17/gotham-go-2016-advanced-go-workshop.html
---

{{< tweet 799254038705340416 >}}

I discovered [GothamGo](http://gothamgo.com/) last year while reading about Go, sadly, I missed [GothamGo 2015](https://www.youtube.com/playlist?list=PLeGxIOPLk9ELh9tsPZMzau6CzMjfMzp9-). This year I wanted to change that, I did not want to miss the opportunity, so I decided to take two days off from work and go all in!

I attended [Bill's](https://www.goinggo.net/) Workshop, called: [Advanced Go](https://www.ardanlabs.com/advanced-ultimate-go), Bill Kennedy is one of the authors of [Go in Action]({{< relref "2016-07-15-go-in-action.markdown" >}}), one of my favorite and easy to read Go books.

To be honest with you this is my first workshop, **ever**. I honestly believed that it was going to be a little bit _hard_ for me to follow up, I don't know... I guess I'm always a pessimist guy. Either way I'm pleasantly surprised my previous [debugging experience]({{< relref "2011-01-12-die-bug.markdown" >}}) as well as my CS background help me to understand with no issues everything Bill said.

Bill's program covered the following topics:

* [Mechanical Sympathy](https://www.youtube.com/watch?v=MC1EKLQ2Wmg): which honestly did not know about it until after listening to [GoTime's episode 6](https://changelog.com/gotime/6), which obviously has the same name and has Bill as the guest. To me this was the most refreshing topic, it was really nice to listen someone talk about CPU caches, processors, hardware and how all of that matters when developing software.
* [Data Oriented Design](https://github.com/ardanlabs/gotraining/tree/master/topics/api/composition): important topic for people new to Go, to think how to represent all the different things you want to build based on their behavior instead of what they are.
* [Concurrency](https://github.com/ardanlabs/gotraining/tree/master/topics/concurrency): explanation about Goroutines, Channels, how the behave with the processor, memory sharing and whatnot.
* [Testing](https://github.com/ardanlabs/gotraining/tree/master/topics/testing): testing examples.
* [Benchmarking](https://github.com/ardanlabs/gotraining/tree/master/topics/testing/benchmarks): concrete benchmarking, for improving your code.
* [Profiling and Debugging](https://github.com/ardanlabs/gotraining/tree/master/topics/profiling): this was the most interesting thing to me, how to profile and understand the data.

As a cool surprise [Filipo](https://twitter.com/FiloSottile) was also there, and he showed us how to trace networking as well as system calls. Pretty cool stuff.

{{< tweet 799367059222265858 >}}

I personally enjoyed this workshop a lot, Bill's way of explaining things, his enthusiasm and stories blend nicely with the topics covered. For me it was a phenomenal way to kick off GothamGo 2016.
