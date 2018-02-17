---
date: 2018-02-16
title: "Go Tip: Embedding"
description: "Embedding in Go, how does it work?"
url: /2018/02/16/go-tip-embedding.html
---

One of the cool features in Go is **embedding**; which we can compare it to class inheritance (if you want to compare it to something and you're coming from a class-based programming language) **but** it is not the same.

[Effective Go](https://golang.org/doc/effective_go.html#embedding) includes a nice brief introduction to this feature, I'm expanding that a bit.

Let's say we have a hypothetical startup "Greetings Y'all" which is planning to disrupt the Greetings world! Their MVP includes a `GreetingsService` which includes two greetings: "Hello" and "Good Morning":

{{< highlight go >}}
type GreetingsService interface {
	SayHello() string
	SayGoodMorning() string
}
{{< / highlight >}}

And because all the seed money is almost gone, _Greetings Y'all_ is implementing the first version in English only:

{{< highlight go >}}
type EnglishService struct {
	Country string
}

func (EnglishService) SayHello() string {
	return "hello!"
}

func (EnglishService) SayGoodMorning() string {
	return "good morning!"
}
{{< / highlight >}}

Days pass and the `GreetingsService` becomes a huge success! So _Greetings Y'all_ implements different versions in other languages like: Spanish and Mandarin.

Over time _Greetings Y'all_ decides as a next step in their world domination to introduce (for whatever reason) another unrelated service that happens to greet their users, called `GiveMeYourMoneyService`:

{{< highlight go >}}
type GiveMeYourMoneyService struct {
	GreetingsService
	Country string
}

func (GiveMeYourMoneyService) SayGoodMorning() string {
	return "$$$"
}
{{< / highlight >}}

(Yes, they decided to always say `$$$` instead of Good Morning, startup life I suppose)

The interesting part about this new struct is how it is embedding an interface, this way you can assign any concrete GreetingsService implementation you want, this is important because:

1. You don't have to know which one in advance.
2. You can easily mock this dependency for testing purposes.
3. You can select which one to use depending on your different needs

However there's a case to mention when `GiveMeYourMoneyService` decides to embed `EnglishService`, by embedding this particular concrete implementation it will hide (or shadow) the field called **Country**, because both types use the same field.

So how can we access that specific field then? You would have to convert the type to the concrete implementation:

{{< highlight go >}}
o := GiveMeYourMoneyService{GreetingsService: &EnglishService{Country: "Neverland"}, Country: "Sokovia"}
fmt.Printf("FancierService: %+v\n", o)
fmt.Printf("FancierService.SayHello: %s\n", o.SayHello())
fmt.Printf("FancierService.GoodMorning: %s\n", o.SayGoodMorning())

var e1 *EnglishService = o.GreetingsService.(*EnglishService)
fmt.Printf("original.Country: %s\n", e1.Country)
{{< / highlight >}}

See this gist for the full working example:

{{< gist MarioCarrion f65dee6a460978544a8a7cf4f56d0c73 >}}

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
