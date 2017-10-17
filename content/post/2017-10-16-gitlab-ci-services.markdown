---
date: 2017-10-16
title: "Migrating to Gitlab CI Services"
description: "Our Gitlab CI success story"
url: /2017/10/16/gitlab-ci-services.html
---

We have been a happy [Gitlab](https://about.gitlab.com/) customer for more than 3 years and, today, as a coincidence we celebrate our first year using Gitlab CI!

In the beginning, before the Gitlab CI and Gitlab tight integration, we used the Jenkins integration to build, test and deploy our code, it worked but it that was painful considering all the maintenance tasks related to Jenkins alone, but that is a story for a different post.

I'm a huge fan of **Gitlab CI**, [its integration with Gitlab](https://about.gitlab.com/2015/05/06/why-were-replacing-gitlab-ci-jobs-with-gitlab-ci-dot-yml/) is phenomenal, as a matter of fact we just recently enabled the [autoscale option](https://gitlab.com/gitlab-org/gitlab-runner/blob/master/docs/configuration/autoscale.md) for our gitlab runners to speed up our development process and so far, everything has been a joyful ride.

One thing I discovered while reading about that feature is that there's an option for using [Docker Images](https://docs.gitlab.com/ce/ci/docker/using_docker_images.html) for testing and building; funny thing is that we where doing that already with Docker Compose together with a bunch of Gitlab Runners using [Shell Executors](https://docs.gitlab.com/runner/executors/README.html).

The interesting thing about the **Docker Images'** configuration is the support for something Gitlab calls [services](https://docs.gitlab.com/ce/ci/docker/using_docker_images.html#what-is-a-service) which are (kind of) similar to the [Docker Compose Services](https://docs.docker.com/compose/compose-file/#service-configuration-reference), with a few exceptions and limitations.

For example, having a `docker-compose.yml` file that looks like this:

{{< highlight yaml >}}
version: "2"
services:
  my_ruby_app:
    build:
      dockerfile: Dockerfile
      context: .
    image: mataleon_sp:$CI_BUILD_REF
    command: pwd
    environment:
      RAILS_ENV: test
    depends_on:
      - mysql

  mysql:
    image: mysql:5.7.16
    ports:
      - 3306
    environment:
      MYSQL_ROOT_PASSWORD: ""
      MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
    volumes:
      - ${PWD}/sql/:/docker-entrypoint-initdb.d/
{{< / highlight >}}

Could be, easily, translated and integrated into Gitlab CI like this:

{{< highlight yaml >}}
variables:
  RAILS_ENV: test
  MYSQL_ROOT_PASSWORD: ""
  MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
  CONTAINER_SHA_IMAGE: gitlab-registry.internal.company/namespace/fancy_project:$CI_BUILD_REF

services:
- name: mysql:5.7.16
  alias: mysql

stages:
- build
- test
- deploy

build_docker_image:
  stage: build
  script:
    - docker login -p $DOCKER_PASSWORD -u $DOCKER_USER gitlab-registry.internal.company
    - docker build -t $CONTAINER_SHA_IMAGE -f Dockerfile .
    - docker push $CONTAINER_SHA_IMAGE
    - docker rmi -f $CONTAINER_SHA_IMAGE
  tags:
    - regular
  except:
    - master

specs:
  image: "$CONTAINER_SHA_IMAGE"
  script:
    - ./bin/ci_specs.sh
  stage: test
  tags:
    - autoscale

lint:
  image: "$CONTAINER_SHA_IMAGE"
  script:
    - ./bin/ci_lint.sh
  stage: test
  tags:
    - autoscale

deploy:
  image: "$CONTAINER_SHA_IMAGE"
  script:
    - ./bin/ci_deploy.sh
  stage: deploy
  tags:
    - autoscale
  only:
    - master
{{< / highlight >}}

Important bits to notice in the final `.gitlab-ci.yml` file are:

* The calls to some hypothetical scripts (like `./bin/ci_lint.sh` and `./bin/ci_deploy.sh`) that happen to be using a dynamic `image` defined in the environment variable `$CONTAINER_SHA_IMAGE`, previously built during _build_ stage.
* How the two other environment variables `MYSQL_ROOT_PASSWORD` and `MYSQL_ALLOW_EMPTY_PASSWORD` are now part of the `variables` section, to then be used by the mysql container; and
* The use of two different tags (`autoscale` and `shared`) the latter used for building and pushing the docker image that then in used by the jobs using the former tag.

Although `services` supports some [extended Docker options](https://docs.gitlab.com/ce/ci/docker/using_docker_images.html#extended-docker-configuration-options), there's one that (at the moment) is not supported: volume mounting. So our `mysql` service can not mount the following directly:

```
volumes:
  - ${PWD}/sql/:/docker-entrypoint-initdb.d/
```

The obvious (and best) way to replace that volume mounting is with Database Migrations, because in the end what happens with that specific MySQL container and path is the execution of some arbitrary SQL script(s) when the container is being created.

Gitlab CI **is great**.
