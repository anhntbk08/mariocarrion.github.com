---
date: 2018-03-26
title: "Finished Reading: The TAO of Microservices"
description: "How good or bad is this book?"
url: /2018/03/26/the-tao-of-microservices.html
---

{{< tweet 972099557214556160 >}}

[The TAO of Microservices](https://www.manning.com/books/the-tao-of-microservices) is a relatively recent book written by Richard Rodger and published by Manning in December 2017. It takes a different approach than other books [I read already]({{< relref "2017-10-11-building-microservices.markdown" >}}) about the same topic of Microservices because it focuses on a different _paradigm_: breaking down _microservices_ based on their message interaction, which not surprisingly reminds me a lot of an [AWS Product](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html) we are trying out.

_The TAO of Microservices_ does a great job introducing the Microservices Architecture, comparing it to your regular _Monolith_ system and explaining its pros and cons. I liked how in _The TAO of Microservices_ the author is talking to you as a _Software Architect_, in a way it empowers you by doing so and it enforces the idea of _being responsible_ when building and designing systems, and encourages you to think well before choosing this _new_ Microservices Architecture.

It includes well known, and fundamental, concepts (similar to the ones also described in [Building Evolutionary Architectures: Support Constant Change]({{< relref "2018-03-01-building-evolutionary-architectures.markdown" >}})) such as [_Circuit Breaker_](https://en.wikipedia.org/wiki/Circuit_breaker_design_pattern), _Backpressure_ and _Dead-Letter Queues_; as well as monitoring, secure storage and tracing.

My favorite thing in _The TAO of Microservices_ is the mention of [**Move Fast and Break Nothing**](https://zachholman.com/talk/move-fast-break-nothing/), please take some time to read the link and watch the video, it is really worth your time; and I feel is one of those _arts_ Software Developers have lost in the recent years.

One thing that threw me off a bit is this last quote:

{{< tweet 977312686378835968 >}}

_Writting bad code_ should never be a recommendation for anyone, it's like saying _"be sloppy, don't care about it... you will get rid of it anyways_. I think I understand the idea behind adding this qoute but I also think putting it like that out there could give an incorrect idea and _taint_ this new _Microservices Architecture_ "phenomenon".
