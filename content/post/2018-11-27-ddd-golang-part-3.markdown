---
date: 2018-11-27
title: "Domain Driven Design and Go: Part 3, Domain Modeling"
description: "DDD + Go: Part 3."
url: /2018/11/27/domain-driven-design-go-part-3.html
---

## Introduction

[We already implemented 3 of 8 rules]({{< relref "2018-11-13-ddd-golang-part-2.markdown" >}}), those three already model the main game rules, the _"non-interactive"_ things: boards, cards and deck; what we need next are the _"interactive"_ things: players and their actions. Specifically we must implement the following:

* Given tablas are unique during the duration of the game,
* There are N players, each player is given one Tabla (Board),
* There's a Cantor (Announcer), who is in charge of randomly selecting cards from the deck,
* Players have to listen to the announced cards and mark them on their boards, and
* The winner is determined by the first player who shouts "LOTER&IACUTE;!" 

# Iteration #2

[Diff implementing this iteration](https://github.com/MarioCarrion/loteria/compare/c1c937a..a8cd79a).

From reading the requirements we can tell there are two subjects: `Caller` and `Player`, the `Caller` is the one announcing the game (orchestrating the game and publishing the called cards) and the `Player`s are the ones listening (are subscribed) to the game. (Please notice I will not cover the specific event handlers in this iteration, I will do that next time).

Taking those requirements we can model two concrete subjects accordingly, first one is the _Caller_ which acts a game host, it does the following:

* Accepts new players: `Players have to listen to the announced cards`,
* Assigns unique and random boards to those players: `There are N players, each player is given one Tabla (Board)` and `Given tablas are unique during the duration of the game`,
* Announces cards: `Announcer is in charge of randomly selecting cards from the deck`, and
* Validates the players really won when they say they did: `The winner is determined by the first player who shouts "LOTERIA"`.

The second one is the _Player_:

* Has one randomized/unique board: `Each player is given one Tabla (Board)` and `Given tablas are unique during the duration of the game`, 
* Interact with the _Board_ after listening to the _Caller_: `Players have to listen to the announced cards and mark them on their boards`, and
* They indicate to the _Caller_ they won: `The winner is determined by the first player who shouts "LOTERIA!"`.

## Caller

To satisfy the requirements the `Caller` requires keeping track of:

* `Deck` of shuffled cards: to properly announce the cards,
* `Players` playing the game, to properly determine the winner,
* `Boards` assigned to the players: to properly assign unique boards and determine the winner,

For shuffling and announcing cards the original `Deck` type was converted into a struct, and `Shuffe()` and `Select()` methods [were implemented](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/card.go#L163-L181).

A new `Player` type [was added](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/player.go#L8-L12), this is a simple one so far, what's important is that the `Caller` keeps that of those in a map by using their unique name.

To determine the uniqueness of the `Board`s, a [new method](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/board.go#L86-L100) was added:

{{< highlight go >}}
func (b *Board) ID() BoardID {
	if b.id != 0 {
		return b.id
	}

	var res uint64
	for c := range b.cardsMap {
		res |= 1 << uint64(c)
	}

	b.id = BoardID(res)

	return b.id
}
{{< / highlight >}}

Recall we [keep track](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/board.go#L38) of the added cards on the board, and each board represents an `int64` with one bit enabled, so we can easily determine the unique ID using bit masking again. Keeping that information in a `map` allows to satisfy the uniqueness requirement, not to mention that the same `map` is used to [mark off](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/caller.go#L68-L74) our already assigned boards to later determine if the player is really a winner.

## Player

To satisfy the requirements, the `Player` requires doing two things:

* Marking off the `Board`, and
* Shouting "LOTER&Iacute;A!".

This type, so far, is a simple one, it basically [delegates both actions to the Board](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/player.go#L23-L31) which already implements them.

## Putting everything together

Like I mentioned in the beginning this still requires a bit of event publishing and subscription to properly simulate a real game, however the current code implements successfully the business requirements, there's a [command already available that runs all of this](https://github.com/MarioCarrion/loteria/blob/a8cd79ada141f0462d9862e4bb5ad2bc0fda4de2/cmd/main.go#L10-L48). Feel free to check it out.

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/mariocarrion/32211887108/in/dateposted-public/" title="Loteria DDD 3"><img src="https://farm5.staticflickr.com/4912/32211887108_85921ab947_z.jpg" width="640" height="321" alt="Loteria DDD 3"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

----

It looks like we made significant progress!! Let’s take a break for now, digest everything and come back tomorrow.
