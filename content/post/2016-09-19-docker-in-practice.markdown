---
date: 2016-09-19T00:00:00Z
description: Second book of the month and 23nd of the year. What are my thoughts about
image: https://c1.staticflickr.com/9/8279/29287312352_795a8f361c_o.png
image_facebook: https://c1.staticflickr.com/9/8394/28771369964_29174cf13f_o.png
title: 'Finished Reading: Docker in Practice'
url: /2016/09/19/docker-in-practice.html
---

Another Docker book from Manning has been completed, this time my first ever *In Practice* book, which is basically a collection of tip, tricks, best practices and common solutions to be used on a daily basis. The *In Practice* series are similar to O'Reilly's *Cookbook* ones, both follow the same pattern: present a problem, show the solution, group those problems and solutions by a similar theme, profit.

{{< tweet 777838798826799104 >}}

I personally found this book really useful, it complements all other Docker books I've read so far, it includes examples that really distinguish the author from other ones, because those examples are _battle tested_ and in some cases it introduces some new Docker-related projects that complemented the ecosystem.

I take a lot from this book, from basic knowledge:

* *docker commit*, *docker exec*
* Signals sent from docker to the (*kill* uses *KILL*, *stop* uses *SIGTERM*, for example)

to tips for building proper images:

* Specifying package versions
* Flattening images
* Package Caching

and tips for production

* Zero downtime switchover
* Monitoring
* Debugging

In the end I really believe this book together with [Docker in Action]({{< relref "2016-09-01-docker-in-action.markdown" >}}) are a must and they **should** be read one after the other to get better results. The only concern I can see with this book is that it will become obsolete really fast (recall Docker keeps changing and new projects keeps popping up), so right now (**2016**) is still a good time to read it, later? who knows.
