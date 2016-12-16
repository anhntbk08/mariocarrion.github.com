---
date: 2016-12-15T00:00:00Z
title: "Building Go programs using Makefiles"
description: "How to build a bunch of Go CLI containerized programs using Makefiles"
url: /2016/12/15/go-makefiles.html
---

The idiomatic way of installing binaries in Go is using `go install <path-to-binary>`, for example something like:

```
go install github.com/MarioCarrion/go-makefiles-skeleton/cmd/hello
```

will build and then install the `hello` program into your `$GOPATH/bin` (of course assuming you previously `go get` it), and that is great if that's what you're looking for. However, if you're like me and you use [small docker images]({{< relref "2016-10-31-small-docker-container.markdown" >}}) for running your programs on production, then you need to have a Makefile for building all of them consistently; of course this does not mean you can't have the best of both worlds.

Let's assume you have a collection of binaries, following the common pattern of defining a package, this package is then used by all the programs in `cmd/`, so you would have something like this:

```
$ ls -d *.go */*/*
cmd/hello/main.go     cmd/something/main.go something.go
```

I created a [small repo](https://github.com/MarioCarrion/go-makefiles-skeleton) containing this example, so you can follow along; using that said repo you could execute:

`go install github.com/MarioCarrion/go-makefiles-skeleton/cmd/...`

That will build and install both programs:

```
$ which hello
/home/mario/goworkspace/bin/hello
$ which something
/home/mario/goworkspace/bin/something
```

What is needed next is to create a Makefile for building all our binaries in a Docker image, then copy those to the static and final image which in the end will be used for the final container. You can follow the [Makefile](https://github.com/MarioCarrion/go-makefiles-skeleton/blob/master/Makefile) from the repo, it literally contains the following:

{{< highlight ruby >}}
NAMESPACE=mariocarrion/go-makefiles-skeleton

PROGRAMS=hello something

.PHONY: clean

default: build

$(PROGRAMS):
	docker run --tty ${NAMESPACE}:build /bin/true && \
		docker cp `docker ps -q -n=1`:/$@ . && \
		docker rm `docker ps -q -n=1`

builddocker:
	docker build --tag ${NAMESPACE}:build --file ./Dockerfile.build .

build: builddocker $(PROGRAMS)
	docker run --tty ${NAMESPACE}:build /bin/true && \
		docker rm `docker ps -q -n=1` && \
		docker build --rm --tag ${NAMESPACE}:latest --file ./Dockerfile.static .

gobuild:
	for program in $(PROGRAMS) ; do \
		CGO_ENABLED=0 GOOS=linux go build --ldflags="-s" -a -installsuffix cgo \
			-o $${program} ./go/src/github.com/MarioCarrion/go-makefiles-skeleton/cmd/$${program}; \
	done
{{< / highlight >}}

The important bit is the `PROGRAMS` variable, which is currently hardcoded to the existing directories in `cmd/` that represent the Go programs to be built. Could we get this variable from the output of a simple `ls`? Yes, definitely.

Another important part of this build is the [static Dockerfile](https://github.com/MarioCarrion/go-makefiles-skeleton/blob/master/Dockerfile.static):

{{< highlight ruby >}}
# vim: set syntax=dockerfile:
FROM tianon/true

MAINTAINER Mario Carrion "info@xyz"

COPY ["hello", \
      "something", \
      "/app/"]

ENTRYPOINT ["/app/hello"]
CMD []
{{< / highlight >}}

Again, similar to the Makefile it hardcodes the files to be copied.

In the end those are the two caveats of this process, you have to explicitly add the programs to both files in order to correctly build the whole thing, I'll think about a better alternative and as soon as I have a fix for this, I'll blog about it for sure.
