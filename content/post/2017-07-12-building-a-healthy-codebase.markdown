---
date: 2017-07-12
title: "Building a Healthy Codebase: Minimum Requirements"
description: "Part 1: Defining the minimum requirements"
url: /2017/07/12/building-a-healthy-codebase.html
---

I've been lucky enough to see a small codebase grow and become a gigantic system able to handle millions of transactions a day while being profitable. Obviously not everything was _fine and dandy_ when we started building this beast; a lot of good (and bad) practices where chosen for different reasons.

Starting with this post, I will be sharing with you the best practices to follow (and the worse practices to avoid) when building complex Computer Systems, all of this based on my more than 12 years of professional experience, which includes Real Time, Automation, Accessibility and Web Services.

We'll start small today and eventually **we will get big**.

## Minimum Requirements

### What is "Minimum Requirements"?

When a new project is planned things like _Concurrent Users_, _Scalability_ and _Security_ are topics of discussion, usually considered **must have**, otherwise the "System will not work".

Those _minimum requirements_ are what in the end _usually_ dictates the _Minimum Viable Product_, if you're lucky enough.

Before starting to work on this new project, as a Computer System Engineer, you must have **your** _Minimum Requirements_; requirements needed for you to do your job the best possible way: **a collection of best practices that must be in place before you even start writing a single line of code**.

This applies to any programming language, framework, cloud solution, selected database and whatever else you need for building this system. All projects, **specially** greenfield projects, **must** honor and follow those best practices. 

That is what I like to call **Minimum Requirements**.

### The (not really) definitive list

#### Version Control System

This may sound like a silly thing for experienced Computer System Engineers, but it is not. What is silly is to build software without having a way to see how the software has evolved over time. This is **a must**, and not only that but **also** using a distributed one, like Git or Mercurial.

I will go beyond this requirement and require a Git Repository Manager as well, like the popular Gitlab and Github, where you can not only _store_ your source code, but have a way to discuss new changes before incorporating them into the final version, via Merge Requests or Pull Requests.

If you decide to use Git, you may be interested in the best practices my team uses as well:

* [Branches naming conventions]({{< relref "2016-08-24-git-workflow.markdown" >}})
* [Commit Message Conventions]({{< relref "2016-08-30-git-commit-message.markdown" >}})
* [Rebase and Merge]({{< relref "2016-12-28-git-rebase.markdown" >}})

#### Code Style Guides

Extremely important because it makes all the code, no matter who wrote it, look and _feel_ the same; and not only that, it also allows Engineers on your team to freely work on everything and anything. There is no mental strain to _adapt_ your coding style to the original code when making changes because that _already-written code_ is **also** following the same rules.

There are hundreds of styling guides available for almost all programming language, however the ideal scenario **will not only** be to follow those guidelines but to find a program that enforces those guidelines automatically as well; think of [`go fmt`](https://golang.org/cmd/gofmt/) for Go or [`rubocop`](https://github.com/bbatsov/rubocop) for Ruby.

#### Continuous Integration / Continuous Deployment Servers

There is already a lot of content regarding CI/CD and their benefits available online, so I won't cover any of that. What is important to understand about CI/CD is the fact that having a way to quickly know how (un)healthy your codebase is a must. 

Incorporating a _Continuous Integration Server_ will allow you to know the status of your code (through Automatic Tests) and how well the code is tested (through Code Coverage), not to mention other important things like allowing you to automatically run linting and code smells detection programs.

Incorporating a _Continuous Deployment Server_ will allow you to release your new features, and fixes, as quickly as you can to your users **only** after the CI Server validates everything looks OK. If you're a bit _afraid_ about this, you may consider incorporating the [Docker Workflow]({{< relref "2017-01-02-upload-file-in-gitlab.markdown" >}}) instead and have you QA Team review the changes before being deployed.

[Gitlab-CI](https://about.gitlab.com/features/gitlab-ci-cd/), [Travis-CI](https://travis-ci.org/) and [Jenkins](https://jenkins.io/) are three of my favorite servers to use.

## Summary

Having a **Version Control System** following **Code Style Guides** and using **Continuous Integration and Continuous Deployment Servers** are the three minimum requirements needed before you even writing code.
