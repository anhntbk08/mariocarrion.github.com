---
date: "2019-01-04"
title: "Go + Docker Tip: Private repos and Gitlab CI"
description: "How to dance the song called: git clone private repos in GitlabCI"
url: /2019/01/04/go-docker-private-repos-gitlab-ci.html
---

It's been a [few years]({{< relref "2017-10-16-gitlab-ci-services.markdown" >}}) since I shared a really useful tip related to Gitlab and GitlabCI. This time it's about a few things to considering when building a Go programs using Docker, Docker in Docker, Gitlab CI and more importantly private git repositories that happen to represent Go binaries or/and Go packages.

## Prerequisites

To make this work there are 2 requirements:

* You have previous experience building Go programs with Docker using multi staged builds, and
* You already have a working GitlabCI Docker pipeline that uses Docker in Docker.

## Making it work

The trickiest part when working with Docker and dependent Go private repositories is permissions, there a few ways to solve this, like defining a new private key and therefore a corresponding deploy key, copying the actual SSH key or even defining personal access tokens; however our preferred way to solve this is to use the [CI\_JOB\_TOKEN environment variable](https://docs.gitlab.com/ee/user/project/new_ci_build_permissions_model.html#dependent-repositories) when `go get`ting repositories.

This works by setting the `insteadOf` git configuration (during build) to use the `gitlab-co-token` username and https instead of ssh, basically adding the following commands to your `Dockerfile`:

{{< highlight yaml >}}
ARG CI_JOB_TOKEN

ENV CI_JOB_TOKEN=$CI_JOB_TOKEN

RUN git config \
  --global url."https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.private/group".insteadOf \
  "git@gitlab.private:group"
{{< / highlight >}}

Notice I'm also using the _ARG_ called `CI_JOB_TOKEN` which is populated through `--build-arg`, so in practice if you were to build this Dockerfile you would need to use:

```
docker build --build-arg CI_JOB_TOKEN=$CI_JOB_TOKEN -f Dockerfile -t $some_tag .
```

Finally the last important thing to never forget is to always use multi-stage builds when using this paradigm, otherwise your final image will save the `CI_JOB_TOKEN`, and really we don't want that.

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
