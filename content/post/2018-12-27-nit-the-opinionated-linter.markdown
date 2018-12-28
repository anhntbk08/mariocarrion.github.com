---
date: 2018-12-27
title: "nit: the opinionated Go linter"
description: "I just started to write my Golang own linter"
url: /2018/12/27/nit-the-opinionated-linter.html
---

I've blogged in the past about the importance of having [concrete rules and conventions when developing software]({{< relref "2017-07-12-building-a-healthy-codebase.markdown" >}}), specially when a team is in charge of writing that said software. It becomes more problematic the larger the team is, it is not a big deal with smaller projects (which correlate to not having a lot of team members), but the bigger the team the more difficult it is to make sure everybody follows the same rules.

But, why bother in the first place?

_Standardization_ would be the keyword, having a consensus where the team agrees to do "the same" things makes following and understanding old and new code easier. This process is hard to enforce without having `Continuous Integration` in the first place, `Code Reviews` are also a vital part of this process and adding the linters that enforce those rules and conventions allows the engineers reviewing the code to focus on the actual changes in the code, what is really important to review.

When running those linters automatically the benefits are clear:

* All the code (new and old) follows the same rules all the time, and
* **More importantly**, the _machine_ is already indicating what is not following the conventions or rules, there's no "human" saying something is incorrect.

This _human friction_ that could happen during code reviews is avoided, avoids the _nitpicking_, which in the end keep all the discussions as technical as possible.

The most clear example in Go is `gofmt`, you may (or not) like the final format, but at least you know everybody else's code will look the same, less friction.

I'm aware the Go community already implement some of the great linters out there, that cover most of everybody's needs, see for example either [gometalinter](https://github.com/alecthomas/gometalinter) or [golangci-lint](https://github.com/golangci/golangci-lint), however I wasn't able to find one that actually covers the code organization in each file, basically where to put what and why.

Let me introduce to you: [`nit`](https://github.com/MarioCarrion/nit) our opinionated linter.

---

### What is `nit`?

`nit` is linter (still in its early phases) that _nitpicks_ the code organization in the file. It follows a really opinionated structure our team at Meredith agreed to follow, this may or not may work for you, but at least I believe it's important to share it with the world.

Version [`v0.1.0`](https://github.com/MarioCarrion/nit/releases/tag/v0.1.0) has been released, it includes support for the code structure in the `imports` section. Notice this is a personal project, so it may take a while to have it feature complete.

### Installing and Using

You can download the released binary, however the usual _Go-way_ should work as well:

```
go install github.com/MarioCarrion/nit/cmd/nit
```

Then you can use it like so:

```
nit -pkg github.com/MarioCarrion/nit github.com/MarioCarrion/nit github.com/MarioCarrion/nit/cmd/nit
```

Where `-pkg` indicates the _local base package_, and the next values indicate the packages to nitpick. The files, with their errors, will be printed out if they are not following the opinionated structure.
