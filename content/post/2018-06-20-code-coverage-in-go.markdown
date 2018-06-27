---
date: 2018-06-20
title: "Go Tip: Code Coverage"
description: "How to get the code full coverage in Go"
url: /2018/06/20/code-coverage-in-go.html
---

Code coverage in Go is included in the toolchain and it is as simple as appending `-coverprofile` to the usual `go test` command, kind of like using:

```
go test -coverprofile=cover.out <package-name>
```

Assuming all tests pass, then you should get an output similar to:

```bash
ok  	<package-name>	0.046s	coverage: <XY.Z>% of statements
```

Where **XY.Z** is the actual code coverage percentage. Notice that the _coverprofile_ file, `cover.out`, can be used for generating a more human friendly output, like HTML, with:

```bash
go tool cover -html=cover.out -o coverage/index.html
```

This workflow is perfect when you're only working on one package, but if you're working on a _monorepo_ getting the **total** code coverage requires a bit extra work. 

Enter [gocovmerge](https://github.com/wadey/gocovmerge) a tool written in Go that merges multiple _coverprofiles_ into one, for example assuming you generated two coverprofiles: `cover1.out` and `cover2.out`, you would use:

```bash
gocovmerge cover*out > profiles_merged
```

Which then we can use to properly generate one single HTML file, with:

```bash
go tool cover -html=profiles_merged -o coverage/index.html
```

But more importantly generate a total percentage with:

```bash
go tool cover -func=profiles_merged > coverage_output
```

With that you could actually get the real final coverage using something like:

```bash
tail -n 1 coverage_output | tr -s '\t' ' ' | sed -n 's/.*\([0-9][0-9]\).*/\1/p'
```

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
