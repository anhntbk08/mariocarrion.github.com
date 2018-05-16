---
date: 2018-05-11
title: "Finished Reading: Software Design X-Rays"
description: "How good or bad is this book?"
url: /2018/05/11/software-design-x-rays.html
---

{{< tweet 994918987644506114 >}}

[Software Design X-Rays](https://pragprog.com/book/atevol/software-design-x-rays) is a book written by [Adam Tornhill](http://www.adamtornhill.com/) and published by The Pragmatic Programmers in 2018.

I was interested in reading this book since I saw the [Beta version](https://pragprog.com/frequently-asked-questions/beta-books) a few months back, gladly my interest was rewarded and it did not disappoint. It left me with a new way of looking at Software Development and showed me a measurable way to look at _bottleneck code_ and [hot spots](https://en.wikipedia.org/wiki/Hot_spot_(computer_programming)).

**Software Design X-Rays** introduces the idea of using your version control system history as a way to detect code that currently is, or could become, a problem to maintain in the long run. It reminded me a bit of [Re-Engineering Legacy Software]({{< relref "2016-04-21-re-engineering-legacy-software.markdown" >}}) because it covers how to fix legacy code, however the principal difference between them is how to detect the code that requires to be broken down in advance before replacing it; it helps you detect the offending code and whatever we decide to do to replace it is up to us.

Although in "Software Design X-Rays" analysis tools like [CodeScene](https://codescene.io/) and [Code Maat](https://github.com/adamtornhill/code-maat) are mentioned the principal tool used for almost all examples is surprisingly `git`. That’s what I believe makes this book so approachable, because it is most likely you're already familiar with `git`, so using what is learned from the book is easier to apply.  Using `git` with different input arguments, depending on the goal we are trying to achieve, we are able to determine  code that changes together, code that changes too frequently or code that will be difficult to understand if the principal developer decide to leave.

Those kind of metrics together with your CI steps like testing, linting and minimum code coverage help you determine the overall health of our codebase and guides you during its lifetime.

Cool short read and more importantly, really well spent time.
