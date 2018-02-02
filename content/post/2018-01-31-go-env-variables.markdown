---
date: 2018-01-31
title: "Go Tip: Environment Variables"
description: "Packages for using environment variables in Go"
url: /2018/01/31/go-environment-variables.html
---

In Go it is really easy to access environment variables, you literally import the **os** package and use the **Gentenv** function, kind of like this:

{{< highlight go >}}
package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Printf("I'm %s\n", os.Getenv("USER"))
}
{{< / highlight >}}

That definetly works, however if you are planning to build a [Twelve Factor App](https://12factor.net/config) you will need a little bit more than that. Not surprisingly there are already two cool packages (which I personally use) for accomplishing that: [github.com/kelseyhightower/envconfig](https://github.com/kelseyhightower/envconfig) and [github.com/joho/godotenv](https://github.com/joho/godotenv).

Shouldn't one of them suffice for what we are trying to achieve? Why using both you may be wondering?

So here's the thing, and this is from personal experience, if you're really picky you can say you don't need either of them because using the standard packages is enough, and I could agree with that, **however**, because of the way I currently build and deploy systems in Go I prefer injecting environment configuration from files (using _godotenv_) and wrap all of them as nice and clean struct for easily access (using _envconfig_).

To my specific workflow both complement each other because you could easily load default variables from a file, override them if needed and then in the end use them in your Go code as a struct.

I created a [Github repository](https://github.com/MarioCarrion/env-vars-example) explaining this concept, simple yet so powerful!

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
