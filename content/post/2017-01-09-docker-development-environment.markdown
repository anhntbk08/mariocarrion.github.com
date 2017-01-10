---
date: 2017-01-09T00:00:00Z
title: "Tip: Docker Development Environment"
description: "Using Docker as your development environment"
url: /2017/01/09/docker-development-environment.html
---

One of my resolutions this year is to use Docker as the [single source of truth](https://en.wikipedia.org/wiki/Single_source_of_truth) for all my development environments. So instead of installing the required software, like databases or development libraries, directly into my path I will be leveraging Docker and Docker Compose to have everything always working locally.

The main problem I currently face is my development setup. I ditched Linux about 7 years ago and migrated completely to macOS, and since Docker Mac is still a work in progress having a development environment based on Docker is a challenge.

The biggest issue is shared volumes, [the performance is not the same](https://docs.docker.com/docker-for-mac/osxfs/#performance-issues-solutions-and-roadmap) compared to the Linux version. I spent some time researching about how to get the best performance with the current available tools, and after testing several tools I settle with [d4m-nfs](https://github.com/IFSight/d4m-nfs) that internally uses NFS for sharing the volumes.

The keys to remember when using Docker and D4M are:

* When using D4M for the first time make sure the Shared Volumes are removed from Docker, leave `/tmp/` only. See the [README](https://github.com/IFSight/d4m-nfs/blob/master/README.md).
* After cloning **d4m-nfs**, create the file `etc/d4m-nfs-mounts.txt`, make sure its contents are something like: 

```
/Users/<username>:/Users/<username>
```
* When sharing volumes make sure the folder exists locally, recall the volume is being shared using NFS, the folder must exist in advance otherwise errors will be thrown. There's an option though, apparently you can use `root:wwheel` to [automatically make the folders](https://github.com/IFSight/d4m-nfs/issues/25), I tried it but did not work for me.
* If you experience issues related to [Mounts denied](https://github.com/IFSight/d4m-nfs/issues/6), try to:
   1. Quit Docker, start it again and wait a bit.
   1. Run the `d4m-nfs.sh` again.

## Dockerizing share-activerecord-models Gem

Part of this exercise for me was to update my [share-activerecord-models](https://github.com/mariocarrion/share-activerecord-models) gem, the one I introduced in the post [Sharing ActiveRecord models between projects]({{< relref "2016-02-26-sharing-models-between-projects.markdown" >}}). The idea is simple, to use `docker-compose` for building the gem without installing anything else but `docker`.

Consider taking a look at the [change that introduced the Dockerization](https://github.com/MarioCarrion/share-activerecord-models/commit/f56379b9e1f26e41659238808b36f44ff38174bd), important bits are:

* New folder [.gems/](https://github.com/MarioCarrion/share-activerecord-models/commit/f56379b9e1f26e41659238808b36f44ff38174bd#diff-255bc4c176643aa7b3a8bcc6f88d53aa), which is shared volume, the idea is to have the gems _installed_ locally not inside the image, similar to a [gemset](https://rvm.io/gemsets/basics), to speed-up building the image.
* [Database configuration change](https://github.com/MarioCarrion/share-activerecord-models/commit/f56379b9e1f26e41659238808b36f44ff38174bd#diff-e31bdf70b15c8f84344c332efe06900d), to use the linked container instead of the hardcoded localhost.

With that I can easily interact with the gem by doing something like:

```
docker-compose up
docker-compose run gem bundle exec rails generate migration create_my_table
docker-compose run gem bundle exec rails generate scenic:view my_materialized_table --materialized
docker-compose down
```
