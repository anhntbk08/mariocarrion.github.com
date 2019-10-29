---
date: "2019-10-28"
title: "Go: Migrating to modules"
description: "I've successfully migrated 3 enterprise projects to Go modules. Ask me anything."
url: /2019/10/28/golang-migrating-to-go-modules.html
---

Just a few weeks ago I was lucky to work on migrating a few of our [enterprise microservices](https://www.meredith.com/) to Go modules, I faced a few roadblocks and learned a lot about internals of Go Modules as well as Gitlab, in the end all the time invested was really worth it.

Historically we have been using, and recommending, both [dep](https://github.com/golang/dep) and [retool]({{< relref "2019-04-17-golang-retool.markdown" >}}) as tools for managing dependencies, packages and tools respectively. However with the _official_ introduction of [Go Modules](https://blog.golang.org/using-go-modules), sadly, both tools became instantly deprecated.

We use [Gitlab and Gitlab CI]({{< relref "2017-10-16-gitlab-ci-services.markdown" >}}), and the way we structure our projects follows a pattern like this: `<project name>/<team>/<service>`, this pattern is important to keep in mind because having subprojects is [an issue](https://github.com/golang/go/issues/34094) when using Go versions lower than 1.13.3 and 1.12.2.

We depend on the following Go tools for generating our code, testing it, linting it and releasing it:

* Linters
	* [`golangci-lint`](https://github.com/golangci/golangci-lint)
  * [`nit`](https://github.com/MarioCarrion/nit): the [opinionated code organization linter]({{< relref "2018-12-27-nit-the-opinionated-linter.markdown" >}}),
* Code generators
	* [`go-swagger`](https://github.com/go-swagger/go-swagger): for [generating/validating Swagger documentation]({{< relref "2018-04-03-judge-go-swagger-with-dredd.markdown" >}}),
	* [`counterfeiter`](https://github.com/maxbrunsfeld/counterfeiter): for [generating Fakes/Mocks/Stubs]({{< relref "2019-06-24-golang-counterfeiter.markdown" >}}).
* Testing:
  * [go-junit-report](https://github.com/jstemmer/go-junit-report): for generating JUnit XML-compatible file from a Go code coverage artifact,
	* [gocovermerge](https://github.com/wadey/gocovmerge): for [merging multiple code coverage outputs](https://gist.github.com/MarioCarrion/bad8d69432d4e64ef0adf90577a7e49c),
* [migrate](https://github.com/golang-migrate/migrate): for database migrations,
* [go-semrel-gitlab](https://gitlab.com/juhani/go-semrel-gitlab): for generating Gitlab Releases.

Thankfully all those projects were already migrated to Go Modules so depending on them was really easy. I followed the recommended [`tools.go` paradigm](https://github.com/go-modules-by-example/index/blob/master/010_tools/README.md) and indicated a recent version, we had no issues.

One important thing we had to do regarding our internal private packages was to use `git config` for making sure `go get` was using SSH instead of `https` when cloning the repositories, something like the following should be enough:

```
git config --global url."git@gitlab.private:".insteadOf "https://gitlab.private/"
```

And finally we introduced [`direnv`](https://github.com/direnv/direnv) to our workflow, this is so when we install our tools those are relative to the project we are working on, a simple `.envrc` with the following content is enough:

```
PATH_add bin
export GOBIN=$PWD/bin
```

Migrating to Go modules is a simple process **after** 1.13.3.

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
