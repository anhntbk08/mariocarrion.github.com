---
date: 2016-08-24T00:00:00Z
description: Git branches naming conventions my team and I use successfully.
image: https://c1.staticflickr.com/9/8001/28592303394_426330c95d_o.png
image_facebook: https://c1.staticflickr.com/9/8775/28594378703_a5b839e4fe_o.png
published: true
status: publish
title: 'Git Workflow: Branches naming conventions'
url: /2016/08/24/git-workflow/
---

This blog post kicks off a series related to [Git](https://git-scm.com/), what I consider to be some of the best practices when using git on the daily basis, the tips and tricks I know for sure have impacted my team and our daily workflows when working on new features, fixing bugs and reviewing code. 

Some of the tips and tricks are really simple and nothing more than common sense, some others require a little bit of Git knowledge, in all cases I will be providing examples for a better understanding and the rationale behind the tip or trick.

Please be aware, we follow the [feature branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow), so all the tips are based on that workflow.

Let's get this thing started.

## Branch naming conventions

Naming the branch is the first thing to do when working on any new change. The new branch will follow this pattern:

`[fix|feature|chore]/[author]-[ticket-number]-[short-humanized-description]`

For example:

* `fix/mario-TKT_3333-world-is-falling-apart`
* `chore/mario-TKT_2222-fix-typo`
* `feature/mario-TKT_1111-crud-v2-implementation`

Naming the branches this way give us the following three benefits:

### Humanized names are simpler to understand

Having the *ticket type* in the branch name itself is always useful, because obviously you can tell from a **chore** and a **fix**, specially useful when managers or team leads want to see what new fixes are being implemented, doing a simple as:

`git branch -r | grep "fix/" | wc -l`

### Personalized names

If for whatever reason a ticket in particular has to be divided and there's no way to create multiple subtickets for each specific change, then multiple developers can work on their own personal feature branches and still reference the same ticket number.

Ideally, in the perfect world, no developer should be using the same ticket number, so for example branches like these should never be happening:

* `fix/mario-TKT_3333-crud-not-working`
* `fix/ruby-TKT_3333-missing-fkey`

### Selective builds

When using a CI, like Gitlab-CI, Jenkins or Travis. You can selectively build the branches that match certain patterns, let's say only those beginning with **fix** or **feature**. The idea is to save some precious computing time for all other branches that really require CI.

For example using [Gitlab-CI](http://docs.gitlab.com/ce/ci/yaml/README.html#only-and-except) you can define a regex value to be used **only** building only those branches, [Jenkins' Git plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin) has something similar and so does [Travis](https://docs.travis-ci.com/user/customizing-the-build#Building-Specific-Branches).
