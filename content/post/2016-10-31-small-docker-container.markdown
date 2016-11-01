---
date: 2016-10-31T00:00:00Z
title: "Small(est) Docker Image for Go Programs"
description: "Creating the smallest Docker Images for Go programs"
url: /2016/10/31/small-go-docker-image.html
---

At work I've been focused recently on building more and more Go and Docker-related projects, all of them so far, follow the same pattern: use Docker Container to build a statically linked Go program **AND** use Docker Container for running that said Go program.

There a lot of articles related to creating small Docker images for [Go programs](https://github.com/MarioCarrion/small-go-docker-skeleton/blob/master/main.go), I'll share with you my minimal Dockerfiles ([build](https://github.com/MarioCarrion/small-go-docker-skeleton/blob/master/Dockerfile.build) and [static](https://github.com/MarioCarrion/small-go-docker-skeleton/blob/master/Dockerfile.static)), [Makefile](https://github.com/MarioCarrion/small-go-docker-skeleton/blob/master/Makefile) and a simple program that uses both the [godotenv](https://github.com/joho/godotenv) and requires SSL certificates, which seem to be the basic two requirements when building new Go Programs, there's a [fancy Github repo](https://github.com/MarioCarrion/small-go-docker-skeleton) that includes the full example.

Full disclaimer: this post is heavily inspired by [Codeship's](https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/) covering the same topic.

## Go Program

It loads the `.env` file from a volume: **/app/.env** where it expects to have defined a variable called **QUERY**, this has to be a properly formatted query string parameter.

## Dockerfile.build

Defines the Dockerfile to be used for building the Go program, internally uses the Makefile to properly calling the right arguments to use to generate the binary.

## Dockerfile.static

Defines the Dockerfile to be used for generating the final small Docker image, this will be final image to be used in production.

## Makefile

It defines the rules for building the Go program running in the container, as well as the commands needed for building and running the actual Docker containers.

## Conclusion

Obviously I'm missing other important things like the CI/CD rules for tests, running `go fmt` and whatever else we need to run, but well, it's easy to add. There's also the [Docker Hub](https://hub.docker.com/r/mariocarrion/small-go-docker-skeleton/) for this repo, feel free to poke around.
