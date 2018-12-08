---
date: 2018-12-05
title: "Finished Reading: Microservices Patterns"
description: "How good or bad is this book?"
url: /2018/12/05/microservices-patterns.html
---

{{< tweet 1070440801887498240 >}}

[**Microservices Patterns: with examples in Java**](https://www.manning.com/books/microservices-patterns) is a book published by Manning in October 2018 and written by [Chris Richardson](http://www.chrisrichardson.net/about.html).

---

[Microservices Patterns](https://microservices.io/) is a long read, but worth the time investment, that covers practically everything you need to know to properly implement Microservices. 

There's a lot covered in the book that requires the reader to have some previous knowledge, I can see it being hard to follow without knowing some concepts in advance, and in the end it won't be beneficial because you won't be able to get the most out of the content.

From its title we know the code included in the book is written in Java, and even if Java it's not your primary language you should have no problem following the code, it is easy to understsand and it can be translated to your favorite programming language without too much problem.

In **Microservices Patterns** we follow a fictitious company, called `Food To Go, Inc`, and their effort to slowly transition to a Microservices Architecture, to finally leave the monolith hell. I like this approach because this is most of the times what we see when implementing Microservices: we start with a legacy/monolith system that then we slowly have to transition to much more smaller and concrete services, this while keeping the old system live while the new one is in development.

I recommend reading **Microservices Patterns** in order because each new chapter complements the previous one, it introduces concepts that help you understand the different facets you have to consider when building Microservices.

To me the best chapters are those related to solving concrete and real problems we face when using Microservices: specifically distributed transactions and distributed queries, those two topics are clearly explained.

One surprising thing in **Microservices Patterns**, and one that I really appreciate, is that it includes **2 chapters** dedicated to testing, it introduces different techniques we can use for properly testing our services.

If I have something _"bad"_ to say about the books is the fact the author uses his own framework to explain some critical concepts, I found that a bit biased, but other than that nitpick this is perhaps the definitive book for building Microservices, and together with [Microservices in Action]({{< relref "2018-11-01-microservices-in-action.markdown" >}}) are basicaly the only things _you would need_ for building Microservices correctly.
