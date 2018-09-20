---
date: 2018-09-12
title: "Go Tip: Refactoring"
description: "Using the go tools for refactoring!"
url: /2018/09/12/go-tip-refactoring.html
---

Refactoring is one of those things you **must** continue doing regularly to maintain a clean codebase. It's one of those unwritten _Software Development rules_.

---

Recently one of our projects required a little bit of refactoring, the goals we had in mind were not mind-blowing, they were a bit simple (yet complicated): rename some things. Basically move some packages, update the imports accordingly and rename some other types to different packages.

Our ultimate goal with this was to make things clearer, from a domain perspective, and to follow some Go conventions other _big projects_, and the community in general, follow. Specifically our plans were to rename our packages to follow the [Project Layout](https://github.com/golang-standards/project-layout) conventions, which you may or may not like or agree with, in the end we evaluated the changes and we did not see any concerns with this change.

The cool thing about this refactoring situation was the fact that Go Project already includes the tools for helping you doing so.

### Installing

To install you run the usual:

```
go get -u golang.org/x/tools/...
```

This will bring all the Go tools, however for this particular exercise we only required a new one [`gomvpkg`](https://godoc.org/golang.org/x/tools/cmd/gomvpkg), and the well known `gofmt`.

## gomvpkg

The way this tool works is by taking parameters to indicate `from`, `to` and, the VCS command to use for moving the files, called  `vcs_mv_cmd`. The tool is pretty straightforward and really efficient. So assuming you're using Git and your goal is to move your package `gitlab.com/MarioCarrion/fancy-package/oldname` to `gitlab.com/MarioCarrion/fancy-package/newname`, you would execute:

{{< highlight go >}}
gomvpkg -from gitlab.com/MarioCarrion/fancy-package/oldname \
  -to gitlab.com/MarioCarrion/fancy-package/newname \
  -vcs_mv_cmd "git mv {{.Src}} {{.Dst}}"
{{< / highlight >}}

This will update all the Go files using your `oldname` package to use `newname` (with the full import address, of course) and will use `git mv` to move the actual files, so you can _commit_ everything afterwards.

## gofmt

This tools is super powerful, it came into place because we had a few situations were the packages did not rename correctly, this happened due to the fact we were _aliasing_ the original packages, basically this:

{{< highlight go >}}
import (
  oname "gitlab.com/MarioCarrion/fancy-package/oldname"
)
{{< / highlight >}}

So all the files using `oname` were not updated, thankfully `gofmt` helped us make this change, basically it worked like this:

{{< highlight go >}}
gofmt \
  -r '"gitlab.com/MarioCarrion/fancy-package/oldname" -> "gitlab.com/MarioCarrion/fancy-package/newname"'
  -w .
{{< / highlight >}}

### Conclusion

In all fairness this process was really smooth, and the fact this was accomplished so easily only confirms my position (**one more time**) of really liking Go, not only because of the language itself, but because of all the available tools that were written thinking of real Software Development necessities.

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
