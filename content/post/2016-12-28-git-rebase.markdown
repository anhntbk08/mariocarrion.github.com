---
date: 2016-12-28T00:00:00Z
description: Git rebase and merge conventions my team and I use successfully.
image: https://c1.staticflickr.com/9/8001/28592303394_426330c95d_o.png
image_facebook: https://c1.staticflickr.com/9/8775/28594378703_a5b839e4fe_o.png
title: 'Git Workflow: Rebase and Merge'
url: /2016/12/28/git-rebase-merge.html
---

Previous Tip: [Commit Message Conventions]({{< relref "2016-08-30-git-commit-message.markdown" >}})

Continuing the Git series, in this post I'll cover why rebasing over merging can make a huge difference, and why is our preferred way.

### What is the difference between merge and rebase?

Being extremely succinct, [Merge](https://git-scm.com/docs/git-merge) and [Rebase](https://git-scm.com/docs/git-rebase) are two different ways of adding code from one branch to another, the main difference is how the history will be written after the code is integrated in the target branch as well as how much control you have when joining two branches. Please consider reading the [Atlassian tutorial](https://www.atlassian.com/git/tutorials/merging-vs-rebasing/) it explains both methods with clear graphics.

### Workflow

`git rebase` is used when working on feature branches to always be _on top_ of the all changes that the original branch currently has and any future changes to be pushed by other team members.

The following will be a common workflow:

{{< highlight ruby >}}
git checkout master
git checkout -b fix/TKT-100-fix-things
# ... stuff happens and we use the well knonwn "commit" "push" 
git rebase master # we always keep our branch up to date
{{< / highlight >}}

Then after our feature branch is reviewed and ready to be joined into master, we do something like this:

{{< highlight ruby >}}
git checkout master
git rebase fix/TKT-100-fix-things
{{< / highlight >}}

In cases where we are _deploying_ something into a release branch, we use `merge` instead:

{{< highlight ruby >}}
git checkout production
git merge master
{{< / highlight >}}

That way we can a commit message to indicate some possible changes that indicate what happened during this release.

The idea of using `rebase` instead of `merge` when joining branches allows us to have a clean an concise Git history, and to avoid messes like this:

[![git rebase VS git merge](https://c1.staticflickr.com/1/256/31876330261_8e356a1149_o.png "git merge VS git rebase")](https://www.flickr.com/photos/mariocarrion/31876330261/in/dateposted-public/)
