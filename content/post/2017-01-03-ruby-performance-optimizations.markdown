---
date: 2017-01-03T00:00:00Z
title: "Finished Reading: Ruby Performance Optimization"
description: "First year of book! A Ruby book, for real!?"
url: /2017/01/03/ruby-performance-optimizations.html
---

{{< tweet 816507811068866561 >}}

New year 2017 starts with a [bang!](http://ruby-for-beginners.rubymonstas.org/objects/bangs.html)

I said [I was not going to spend any more of my time doing Ruby stuff]({{< relref "2016-12-31-year-in-review.markdown" >}}), but I couldn't pass the opportunity to read this book, I did not know for sure if it was good or bad, not a lot of information out there, but what could go wrong if I read it?

[Ruby Performance Optimization](https://pragprog.com/book/adrpo/ruby-performance-optimization) was written by [Alexander Dymo](http://www.alexdymo.com/) and published by The Pragmatic Bookshelf in 2015, I got it during a sale and I couldn't be any more happier after reading it.

I enjoyed the book a lot, I'm surprised is not more popular, maybe Ruby developers don't care too much performance? Not sure. The key takeaways from this book are the following:

* Using iterators incorrectly could be a reason certain code is underperforming, too much _Rubyisims_ chained together may kill the radio star.
* Explicitly indicating the fact you can not, and should not, try to use Ruby for everything. Thing which for whatever reason sometimes I find difficult to understand why some Ruby developers don't get, _some_ swear by the language and want to use it for everything. Strange.
* The introduction of several profiling tools, a new one I did not know: [KCachegrind](https://kcachegrind.github.io/html/Home.html)
* Several tricks using [ruby-prof](https://github.com/ruby-prof/ruby-prof), a well known Ruby gem.
* [Confidence interval](https://en.wikipedia.org/wiki/Confidence_interval)
* *Query Tests*, to actually test the generated SQL, and *Benchmark Tests* to have proper way to determine if the code degraded (or improved!) after a change.

Overall great book, I really hope all Ruby developers find it sooner than later because it covers a lot of great/fundamental topics and includes clear explanations describing how to properly benchmark code by using all the available tools. Nice.
