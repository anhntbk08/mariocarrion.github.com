---
date: "2019-04-17"
title: "Go Tool: retool"
description: "TwitchTV's 'retool' a tool for versioniong Go tools"
url: /2019/04/17/golang-tools-twitchtv-retool.html
---

One of thoughest things in Go is versioning, for library dependencies there are different ways to handle this, [vendoring](https://golang.org/cmd/go/#hdr-Vendor_Directories) automatically using a tool like [`dep`](https://github.com/golang/dep), which is the _de facto_ most popular tool for doing so, or using [modules](https://blog.golang.org/using-go-modules), which happens to be the new official workflow.

For tools that you depend on, for example for generating code (like [`counterfeiter`](https://github.com/maxbrunsfeld/counterfeiter) or [go-swagger](https://github.com/go-swagger/go-swagger)) or linters (like [golangci-lint](https://github.com/golangci/golangci-lint)), things get a bit more complicated, sure you could hack your `PATH` to point to different versions and use [docker]({{< relref "2017-01-09-docker-development-environment.markdown" >}}) for wrapping those commands and specific versions; but that is definetely messy and is not sustainable in the long run.

**However**, assuming the tools you depend are written in Go, you should definetely use [`retool`](https://github.com/twitchtv/retool).

## retool

`retool` is a tool for vendoring concrete Go programs' versions that **are not** imported by your code.

### Installing

This is a bit an _egg-chicken situation_, it is because to date `retool` does not support Go modules, so to install it you would need to explicitly use the usual trick, assuming you want to install `v1.3.7` you would do something like the following:

{{< highlight java >}}
git clone git@github.com:twitchtv/retool.git $GOPATH/github.com/twitchtv/retool
cd $GOPATH/github.com/twitchtv/retool && git checkout tags/v1.3.7
go get github.com/twitchtv/retool
{{< / highlight >}}

### Using

The workflow to enable `retool` using _the tool_ is the following: assuming we want to use `counterfeiter` version `v6.0.1` we will do the following to add this version of this tool:

{{< highlight java >}}
retool add github.com/maxbrunsfeld/counterfeiter v6.0.1
{{< / highlight >}}

Then doing something like `retool counterfeiter` would allow you to call this vendored tool. If we are planning to use a forked tool, then doing something like the following will work:

{{< highlight java >}}
retool -f git@some.fork.com:something/go-counterfeiter \
  add github.com/maxbrunsfeld/counterfeiter v6.0.1
{{< / highlight >}}

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
