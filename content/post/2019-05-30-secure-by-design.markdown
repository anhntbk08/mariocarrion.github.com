---
date: 2019-05-30
title: "Finished Reading: Secure by Design"
description: "How good or bad is this book?"
url: /2019/05/30/secure-by-design.html
---

[**Secure by Design**](https://www.manning.com/books/secure-by-design) is a book written by [Dan Bergh Johnsson](http://dearjunior.blogspot.com/), Daniel Deagun and [Daniel Sawano](https://twitter.com/danielsawano), to be published in two months, in July 2019 by Manning Publications. This review covers the MEAP release of this book, specifically Version 13.

---

**Secure by Design** is a fascinating read because the approach it takes to cover security it's really interesting. It focuses completely on designing systems with secure primitives in mind from the beginning, considers networking interactions (and their possible issues for preventing them, like [circuit breakers](https://github.com/sony/gobreaker) and [timeouts](https://blog.cloudflare.com/the-complete-guide-to-golang-net-http-timeouts/)) as well as some software development techniques to use (like fuzzing and automatic dependency checks) to detect problems before delivering the final product.

My favorite part is how by using [Domain Driven Design]({{< relref "2018-11-07-ddd-golang-loteria.markdown" >}}) most of the topics make even more sense, being familiar with DDD already allowed me to better and quickly understand the new content.

It's not a requirement to know Domain Driven Design in advance, this is because in **Secure by Design** there's a quick introduction to that topic, however having some DDD experience gives you a different perspective about why certain things (like Domain Types and Bounded Contexts) are secure from their inception when initially defining your domain.

Regarding Domain Types the addition of Read-Once values help you avoid leaking important information.

Another important topic covered in **Secure by Design** is Unit Testing, code coverage and input/output validation are a must for implementing secure systems, defining tests that rely on [fuzzing](https://github.com/dvyukov/go-fuzz) allow your APIs to have an extra layer of security.

**Secure by Design** is a must for anyone using Domain Driven Design and more importantly any person building systems who wants to make sure that system is secure from the get-go.

---

`Verdict` **Buy it!**

---

#### Relevant content

{{< youtube ogjOKlXHi08 >}}
