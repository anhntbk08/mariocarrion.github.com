---
date: 2016-08-30T00:00:00Z
description: Git commit messages conventions my team and I use successfully.
image: https://c1.staticflickr.com/9/8001/28592303394_426330c95d_o.png
image_facebook: https://c1.staticflickr.com/9/8775/28594378703_a5b839e4fe_o.png
title: 'Git Workflow: Commit Message Conventions'
url: /2016/08/30/git-commit-message.html
---

Previous Tip: [Branches naming conventions]({{< relref "2016-08-24-git-workflow.markdown" >}})

Continuing the Git series, in this post I'll cover the most common thing we all do when using git, but some people have a hard time doing it: **Commit Messages**.

### Why is important to write a good commit message?

Simple: we are humans and, even when the code is self-documented and well written, we need a digital trail to the original requirements. Having the _humanized_ reason stored in the git history itself is extremely useful when trying to understand why some code was implemented in a particular way.

### What should not the commit message include?

Nonsense, in other words avoid meaningless commit messages, for example:

> Update

> save

> commitment

By the way, those commit messages above are real, taken from some projects I previously had the honor to work on; all of them have a single thing in common, they do not explain why the change was made, they just indicate something was changed and the message was added because git required it.

### What should the commit message include?

**All** commit messages must include:

1. A bug tracking system reference, in other words a ticket number.
1. When applicable, detailed information regarding the change itself: "This file was moved here because x, y and z", "library was upgraded because of xyz"

Few exceptions to this rule are for example: changes fixing typos or documentation improvements.

It's important to write useful commit messages because one day you will have to deal with the following yourself:

> Why was this changed? Did I change it? Why!!??

> Well, let's `git blame`, take a look at the commit message and the ticket included, that should explain something.

### What format should you use when writing commit messages?

The format my team and I have found useful is the following:

> (Ticket Number) (Commit message)

For example, for a ticket **#1789** with a subject "_Application throws null reference error when input field is empty_", a good commit message would be:

> &#35;1789 Sanitize input field to avoid raising exception

> This commits adds a new method to sanitize the data, the

> method is triggered `before_save` to remove invalid characters.

It's important to keep all lines in the commit message short, specially the first one, because that's the one available from the `git log --pretty=oneline` and commonly used by most web UIs, like Github and Gitlab.

You can configure your editor to automatically break the line when exceeding certain length, vim does that for you for example.

Make your team and yourself a favor, write concise and useful commit messages, I assure you it will help you in the future.
