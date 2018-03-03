---
date: 2018-03-01
title: "Finished Reading: Building Evolutionary Architectures"
description: "How good or bad is this book?"
url: /2018/03/01/building-evolutionary-architectures.html
---

{{< tweet 946814032140558336 >}}

[Building Evolutionary Architectures](https://www.thoughtworks.com/books/building-evolutionary-architectures) is a book written by Neal Ford, Rebecca Parsons and Patrick Kua, it was published by O'Reilly in October 2017, it is a short and concise read. It somehow feels similar to [Building Microservices]({{< relref "2017-10-11-building-microservices.markdown" >}}), maybe because both books were written by ThoughtWorks employees.

[Building Evolutionary Architectures](https://smile.amazon.com/gp/product/1491986360/) introduces (not surprisingly because that's the book's title!) the concept of _building evolvable architectures_, which in short describes how to build architectures that have the flexibility to be updated without too much hassle and, more importantly, in an easy way.

It does not enforce any type of architecture nor it tries to preach why some of them are better than others; it is not a step-by-step guide either; instead it focuses on detailing how to measure your architecture to correctly record metrics associated to the _-ilities_, like **adaptibility**, **flexibility** or **testability**, just to name few (and actually the full list of _ilities_ is way longer than that).

In **Building Evolutionary Architectures** the authors use a concept I never heard before, which we all have been using professionally for years already, called `Fitness Functions` which indicates how certain architectural characteristics are measured, think of writing Unitary Tests, measuring Latency or Deployment Process, for example.

Those `Fitness Functions` are what in the end drive the _evolvability_ of your Architecture, for example, measuring the speed of your existing Deployment Process can indicate how fast or slow you can deliver new code to production.

_Building Evolutionary Architectures_ includes a lot of gems like tips to avoid falling into traps for example: following the "Share Nothing" idea when building microservices, avoiding vendor locking, inappropriate data coupling and the abuse of code reuse; as well as building proper interfaces internally between dependencies and more.

{{< tweet 969214053687185408 >}}

_Building Evolutionary Architectures_ is a recommended book, it is a quick read that should help Software Architects measure [brown/green]field projects and prepare them for the constant and imminent change in the future.
