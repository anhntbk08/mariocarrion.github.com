---
date: 2018-11-13
title: "Domain Driven Design and Go: Part 2, Domain Modeling"
description: "DDD + Go: Part 2."
url: /2018/11/13/domain-driven-design-go-part-2.html
---

## Introduction

[Last time]({{< relref "2018-11-07-ddd-golang-loteria.markdown" >}}) we talked about how awesome **Loter&iacute;a** is and we defined the concrete rules of the game. What's next is not a surprise: we are going to translate those rules, we will convert them into something _the machine_ can understand.

Let's go through each rule and "translate" it into technical terms.

> There is a deck with 54 cards,

The deck is represented with an array of 54 `Card`s,

> There are N players, each player is given one _Tabla_ (Board),

We have N `Player`s, each of them has one `Board`, the players can not choose those said boards, they are randomly assigned,

> _Tablas_ always have a randomly created 4x4 grid of cards,

> Given _tablas_ are unique during the duration of the game,

`Board`s are random and _unique_ per game session, meaning **no player** will be using the same permutation of values on the board of any other board already created,

> There's a _Cantor_ (Announcer), who is in charge of randomly selecting cards from the deck,
> Players have to listen to the announced cards and mark then on their boards,

Those two requirements are really clear, however we still need a bit more of time to provide a better technical implementation. Let's move those to the _parking lot_.

> The winner is determined by the first player who shouts **"LOTER&Iacute;A!"** and (**more importantly**) has four sequential marked cards in a horizontal, vertical or diagonal row.

We need a way to allow the players to **shout** they won and, obviously, we must validate that the result really matches the rules.

## Iteration #1

Initial iteration will consider the following three, of seven, requirements:

* There is a deck with 54 cards,
* Tablas always have a randomly created 4x4 grid of cards, and
* The winner has four sequential marked cards in a horizontal, vertical or diagonal row.
