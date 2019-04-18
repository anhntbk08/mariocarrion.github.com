---
date: "2019-04-09"
title: "nit: MVP release"
description: "nit is officially completed."
url: /2019/04/04/2019-nit-mvp-release.html
---

[Beginning of the year]({{< relref "2019-01-03-looking-back-at-2018.markdown" >}}) I described my plans for this year, one thing I wanted to complete by the end of February was finishing [`nit`](https://github.com/MarioCarrion/nit), the opinionated code organization linter, it took longer than expected but it is finally available and more importantly it's _on production_ and being actively used.

The most recent version to date is `v0.6.0`, to install it:

* Using go (< 11.1): `go install github.com/MarioCarrion/nit/cmd/nit` or download a precompiled release.
* Using go (>= 1.11): `GO111MODULE=on go get github.com/MarioCarrion/nit/cmd/nit@v0.6.0`,
* Using retool: `retool add github.com/MarioCarrion/nit/cmd/nit v0.6.0`.

I also shared this tool with the [Reddit community](https://www.reddit.com/r/golang/comments/bb9vps/opinionated_code_organization_linter/), the sentiment I got from the comments is it would be nice to support the _standard_ code organization, where the code is more or less organized like:

{{< highlight go >}}
type Foo struct{}
func NewFoo() *Foo { return &Foo{} }
func (f *Foo) Run() {}

type Bar struct{}
func NewBar() *Bar { return &Bar{} }
func (b *Bar) Run() {}
{{< / highlight >}}

And really I don't disagree with that style either, I will definitely add support in the near future.
