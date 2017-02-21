---
date: 2017-02-20
title: "Finished Reading: Go Programming Blueprints: Second Edition"
description: "How good or bad is this book?"
url: /2017/02/20/go-programming-blueprints-second-edition.html
---

I must confess I did not read [Go Programming Blueprints: Second Edition](https://www.packtpub.com/application-development/go-programming-blueprints-second-edition) from top to bottom like all the previous books I've read so far, the reason being I read the [first edition last year]({{< relref "2016-12-16-go-programming-blueprints.markdown" >}}) and I know for sure editions do not change **a lot** from one to another.

However, although I knew this was not going to change a lot I was still interested about it, because Mat Ryer, the author of this book, gave a talk at [GothamGo 2016]({{< relref "2016-12-16-go-programming-blueprints.markdown" >}}), and he mentioned the new chapters included gRPC as well as some covering microservices and Go, so getting this new edition during the 2016 Packt sale was a no-brainer for me.

{{< tweet 809795487725453312 >}}

That being said how good (or bad?) are the new chapters?

I've been toying around with gRPC for a while, nothing in production yet but what Mat covers is what I had to learn the hard way, so if you're starting with gRPC having everything in one place is really useful and saves you some time. Mat uses [go-kit](https://github.com/go-kit/kit) as the way to explain microservices + grpc + go, so that's an interesting new thing to learn.

He also does a great job covering [Docker and Go]({{< relref "2016-10-31-small-docker-container.markdown" >}}), and just like the gRPC content, it saves you a lot of time if this is your first attempt trying to build your own Go-based Docker images.

Finally, it is hard to tell what changed from the first edition to the second one, however if you're interested in seeing what changed from the first github tag to the second one, please [see the compare](https://github.com/matryer/goblueprints/compare/cb2078d9aa6b5b7cc51e80912be82cbba4d2f9a1...b4de110c767ba438fadf376534701a2595832bc5).
