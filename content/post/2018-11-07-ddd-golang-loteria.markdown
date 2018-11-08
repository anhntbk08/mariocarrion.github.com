---
date: 2018-11-07
title: "Domain Driven Design and Go: Loteria!"
description: "DDD + Go + Loteria = Fun"
url: /2018/11/07/domain-driven-design-go-loteria.html
---

## Introduction

Last weekend we went to the [American Museum of Natural History](https://www.amnh.org/) to attend the [Día de Muertos festival](https://www.amnh.org/calendar/day-of-the-dead). The program itself was awesome and overall it was a fantastic experience. What surprised me the most during this visit, and definitely my _personal highlight_, is that it made me remember a game I used to play when I was a kid called: [Loter&iacute;a](https://en.wikipedia.org/wiki/Loter%C3%ADa).

{{< tweet 1059154713244024832 >}}

This made me recall yet another thing: _the rules to play Loter&iacute;a are pretty straightforward_, it's sort of like a _"Mexican Bingo"_.

> Hear me out! All of this is going to make sense, wait for it.

With those facts and the need I've been having of finding a "real" project, big enough yet easy to understand to use as an example (so a lot of people can benefit from it) for showing off Domain Driven Design and Go is what encouraged me to start this new "initiative". 

> At work we have our own proprietary domain, and obviously I can not share that with you all, and I didn't want to use the usual "To Do program" because that really does not help that much, IMO.

[Domain Driven Design](https://en.wikipedia.org/wiki/Domain-driven_design) is not something new, it's been here for more than a decade already, however in recent years has become more relevant because of the popularity of _Microservices_ and how those are meant to be designed to do one single thing only the best way possible.

Domain Driven Design literature is vast, there are thousands of resources describing concrete implementations in different frameworks and programming languages, however not that many idiomatic ones in Go. I know [Ben](https://medium.com/wtf-dial/wtf-dial-domain-model-9655cd523182) and [Peter](https://peter.bourgon.org/go-for-industrial-programming/) are the prominent experts of showing us "how to do it" in Go, but still those specific resources are far from what I can consider a full working example.

So, starting today I'll be implementing this new project, a game using concrete Domain Rules that will evolve into a much more complex "production-like" service that is idiomatic and follows, as best possible, the Domain Driven Design software development approach.

## Before continuing

If you're not familiar with Domain Driven Design, I highly recommend you watching this online course:

* [Part 1: Overview and Core Values of Domain-Driven Design](https://www.youtube.com/watch?v=Z0zpSB85XGs),
* [Part 2: Strategic Design: Domains, Subdomains, Bounded Contexts & Context Maps](https://www.youtube.com/watch?v=pNTsTVoV2qA),
* [Part 3: Internal Building Blocks: Aggregates, Entities, Value Objects Part 3/5](https://www.youtube.com/watch?v=RHg53wMflCc),
* [Part 4: Domain Events & Event Storming Part Four](https://www.youtube.com/watch?v=yWDaBdV-SL8), and
* Part 5: is not yet out.

and reading the original resources:

* [Domain-Driven Design: Tackling Complexity in the Heart of Software 1st Edition](https://smile.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215/)
* [Patterns, Principles, and Practices of Domain-Driven Design](https://smile.amazon.com/dp/1118714709/)

## Let's start now! Loter&iacute;a Domain

**Loter&iacute;a Mexicana**'s simplest variant consists of the following rules:

* There is a deck with 54 cards,
* There are N players, each player is given one _Tabla_ (Board),
* _Tablas_ always have a randomly created 4x4 grid of cards,
* Given _tablas_ are unique during the duration of the game,
* There's a _Cantor_ (Announcer), who is in charge of randomly selecting cards from the deck,
* Players have to listen to the announced cards and mark then on their boards,
* The winner is determined by the first player who shouts **"LOTER&Iacute;A!"** and (**more importantly**) has four sequential marked cards in a horizontal, vertical or diagonal row.

That being said, let's take a break for now, digest everything and come back tomorrow.
