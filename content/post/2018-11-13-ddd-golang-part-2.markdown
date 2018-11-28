---
date: 2018-11-13
title: "Domain Driven Design and Go: Part 2, Domain Modeling"
description: "DDD + Go: Part 2."
url: /2018/11/13/domain-driven-design-go-part-2.html
---

## Introduction

[Last time]({{< relref "2018-11-07-ddd-golang-loteria.markdown" >}}) we talked about how awesome **Loter&iacute;a** is and we defined the concrete rules of the game. What's next is not a surprise: we are going to translate those rules. We will convert them into something _the machine_ can understand.

Let's go through each rule and "translate it" to technical terms.

> There is a deck with 54 cards,

The deck is represented with an array of 54 `Card`s,

> There are N players, each player is given one _Tabla_ (Board),

We have N `Player`s, each of them has one `Board`, the players can not choose those said boards, they are randomly assigned,

> _Tablas_ always have a randomly created 4x4 grid of cards,

> Given _tablas_ are unique during the duration of the game,

`Board`s are random and _unique_ per game session, meaning **no player** will be using the same permutation of values on the board of any other board already created,

> There's a _Cantor_ (Announcer), who is in charge of randomly selecting cards from the deck,
> Players have to listen to the announced cards and mark them on their boards,

Those two requirements are really clear, however we still need a bit more of time to provide a better technical implementation. Let's move those to the _parking lot_.

> The winner is determined by the first player who shouts **"LOTER&Iacute;A!"** and (**more importantly**) has four sequential marked cards in a horizontal, vertical or diagonal row.

We need a way to allow the players to **shout** they won and, obviously, we must validate that the result really matches the rules.

## Iteration #1

[Diff implementing this iteration](https://github.com/MarioCarrion/loteria/compare/70c3ce9..c1c937a).

Initial iteration will consider the following three, of eight, requirements:

* There is a deck with 54 cards,
* _Tablas_ always have a randomly created 4x4 grid of cards, and
* The winner has four sequential marked cards in a horizontal, vertical or diagonal row.

### There is a deck with 54 cards

Defining a `Card` type should clarify our goal, then we need an array of `Card`s with a length of 54, or even better we can define a new type `Deck` to [explicitly indicate that](https://github.com/MarioCarrion/loteria/blob/c1c937ae4556b51284915ae1fa84efe6a2f66edc/card.go#L3-L10):

{{< highlight go >}}
type (
	// Card defines the card, which is part of the board and also announced by
	// the caller.
	Card uint64

	// Deck defines the type containing all the 54 Cards.
	Deck [54]Card
)
{{< / highlight >}}

Why is the card `uint64`? Because this type has 64 bits, which in practice can represent up to 64 different cards, so by using this type we can flag each bit to independently indicate a concrete card per bit; we only need 54 but we support up to 64. That being said... why `uint64` instead of `int64`? Well I personally like working with non negative numbers (not that any of this matters at all in this particular case).

Defining the concrete cards is a repetitive exercise, [sort of like](https://github.com/MarioCarrion/loteria/blob/c1c937ae4556b51284915ae1fa84efe6a2f66edc/card.go#L13-L68):

{{< highlight go >}}
const (
	RoosterCard Card = iota
	DevilCard
	LadyCard
	DandyCard
	// all other cards ...
)
{{< / highlight >}}

### Tablas always have a randomly created 4x4 grid of cards

`Board`s have 16 `Card`s, defining them as a concrete type is the way to go because we are going to be interacting with then heavily during our game, so this makes sense:

{{< highlight go >}}
type (
	// Board defines a "tabla", which is 4x4 grid of 16 Cards.
	Board struct {
		cards map[Card]index
	}
)
{{< / highlight >}}

> Notice there's an `index` type, I will describe that below.

What about the _randomly created_ requirement? For that, the best approach would be to create a [concrete "constructor"](https://github.com/MarioCarrion/loteria/blob/c1c937ae4556b51284915ae1fa84efe6a2f66edc/board.go#L38-L51), like so:

{{< highlight go >}}
// NewRandomBoard returns a board with random Cards.
func NewRandomBoard() Board {
	r := rand.New(rand.NewSource(time.Now().UnixNano()))

	cards := map[Card]index{}
	for len(cards) < 16 {
		v := r.Intn(53)
		if _, ok := cards[Card(v)]; !ok {
			cards[Card(v)] = index(1) << uint16(len(cards))
		}
	}

	return Board{cards: cards}
}
{{< / highlight >}}

That function above randomizes 16 numbers between 0 and 53 and assigns them to the internal map. One **really important thing** to notice in this function is the value of `index` in the map, it represents the _location_ of this card in the (to be added) `marked` attribute. Please continue reading.

### The winner has four sequential marked cards

This means we require having a way to _mark_ cards on our `Board`: 

{{< highlight go >}}
// Mark marks off the card on the board.
func (b *Board) Mark(c Card) error {
	index, ok := b.cards[c]
	if !ok {
		return ErrCardNotOnBoard
	}

	b.marked |= index

	return nil
}
{{< / highlight >}}

The _method_ above introduces the field [`marked`](https://github.com/MarioCarrion/loteria/blob/c1c937ae4556b51284915ae1fa84efe6a2f66edc/board.go#L11) which was mentioned above, this attribute is used to keep track of the *marked* cards, using bit flagging. This same field, `marked`, is also used to determine if the `Board` is a [_winning one_](https://github.com/MarioCarrion/loteria/blob/664e47f8a428772cef79edb2a0916090090bc475/board.go#L66-L75):

{{< highlight go >}}
// Winner indicates whether the marked cards win the game.
func (b *Board) Winner() bool {
	for _, pattern := range defaultWinningPatterns {
		if (uint16(b.marked) & uint16(pattern)) == uint16(pattern) {
			b.WinningPattern = pattern
			return true
		}
	}
	return false
}
{{< / highlight >}}

Where those `defaultWinningPatterns` are predefined [Winning Patterns](https://github.com/MarioCarrion/loteria/blob/664e47f8a428772cef79edb2a0916090090bc475/winning_pattern.go#L9-L24) we computed in advance.

----

It looks like we made significant progress!! Let’s take a break for now, digest everything and come back tomorrow.
