---
date: 2017-02-01
title: "Goals: February 2017"
description: "Second month of the year. What am I planning?"
url: /2017/02/01/february-2017-goals.html
---

January this year was a _good_ month, the truth is that coming back to work after taking time off is always difficult. However I still believe January 2017 was productive, both personally and professionally.

### Professionally

I was able to spend a significant amount of time Dockerizing some of our Ruby (and Ruby on Rails) applications. My personal goal was to:

1. Prepare automated Docker images to be built during CI for our QA to verify, I used [templenv](https://github.com/MarioCarrion/templenv) and the [Gitlab API]({{< relref "2017-01-02-upload-file-in-gitlab.markdown" >}}) to connect everything. **It was a success**.
1. Have a [Docker-based development environment]({{< relref "2017-01-09-docker-development-environment.markdown" >}}). It sort of worked, but I will not call it a success.

Sadly having a Docker-based development environment on Mac is currently a painful experience, specially because of the following two bugs:

* [File access in mounted volumes extremely slow](https://github.com/docker/for-mac/issues/77) this is **the** blocker issue to me, because not having shared volumes means not having a clean way to _share_ your changes with your container. There are workarounds like [d4m-nfs](https://github.com/IFSight/d4m-nfs), but still it's annoying:

{{< tweet 817516025990316032 >}}

*  [Docker.qcow2 never shrinks - disk space usage leak in docker for mac](https://github.com/docker/for-mac/issues/371), not a real blocker, unless you forget to remove the file from time to time; also it seems to be sort of fixed in the most recent version, so it's getting better.

Surprisingly, I tried our generated _docker-compose.yml_ files on Windows, and it worked even better! Microsoft Windows did not disappoint this time.

{{< tweet 826628455836033024 >}}

Besides that I was able to research a bit about writing shared libraries in Go for loading them in Ruby (with [FFI](https://github.com/ffi/ffi)), for some our compute-intensive tasks; R&D worked nicely, I just need to actually write the legit version of this, make sure memory is freed accordingly and profit.

### Personally

I was able to finish reading four books:

1. [Ruby Performance Optimization]({{< relref "2017-01-03-ruby-performance-optimizations.markdown" >}})
1. [Monitoring Docker]({{< relref "2017-01-11-monitoring-docker.markdown" >}})
1. [Getting Started with Kubernetes]({{< relref "2017-01-23-getting-started-kubernetes.markdown" >}})
1. [Docker Networking Cookbook]({{< relref "2017-01-30-docker-network-cookbook.markdown" >}})

And I'm currently reading my first _Internet of things_ book called [Building the Web of Things](https://www.manning.com/books/building-the-web-of-things), also I got a haircut:

{{< tweet 826632342097780736 >}}

### What am I planning for February 2017?

Finish reading *Building the Web of Things* and at least 3 more books, I'm planning to finish the other two books I mentioned in [my previous post]({{< relref "2017-01-30-docker-network-cookbook.markdown" >}}): *Go Design Patterns* and *Go Programming Blueprints - Second Edition*, as well as my first AWS Lambda book, surprisingly titled: *AWS Lambda in Action*.

I will be updating [templenv](https://github.com/MarioCarrion/templenv) to add a new function to be used in the templates, and blog more often about technical stuff, I have a few drafts already waiting to be published. Good times.
