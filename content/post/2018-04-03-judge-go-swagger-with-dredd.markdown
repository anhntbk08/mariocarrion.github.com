---
date: 2018-04-03
title: "Go Tip: Judging go-swagger with dredd"
description: "Using Dredd together with go-swagger"
url: /2018/04/03/judge-go-swagger-with-dredd.html
---


Using [go-swagger](https://github.com/go-swagger/go-swagger) it's great for automatically generating Swagger 2.0 documentation for your API from annotations in your code. It even includes a validator to make sure the generated `swagger.json` is valid:

```
swagger validate swagger.json
```

However there's a tiny thing about this generated file, even if the `swagger.json` (or [Blueprint](https://apiblueprint.org/)) file is 100% valid it may not represent your real implementation, think of typos, [broken responses](https://swagger.io/docs/specification/describing-responses/), [missing parameters](https://swagger.io/docs/specification/describing-parameters/) or incorrect status codes.

Shocking right?!

Enter [dredd](https://github.com/apiaryio/dredd):

> Language-agnostic command-line tool for validating API description document against backend implementation of the API.

**Dredd** supports both Swagger and Blueprint as API Description formats, it has a plethora of supported hook languages, installation and usage is pretty straight-forward. To install it you will need NodeJS and a recent Python (3.0+), however you can always use Docker instead:

{{< gist MarioCarrion 1421c00bc80694ff8c127ccdc1b2b867 >}}

Using it is as simple as:

```
dredd <path-to-swagger.json> <backend-handlind-the-requests>
```

Word of advice when interacting with Swagger's _in-path parameters_:

1. You will need to add the `x-default` [vendor extension](https://swagger.io/docs/specification/2-0/swagger-extensions/) so the requests made by *dredd* work.
2. **Do not** add the `default` annotation for the in-path parameters because that will make the generated document invalid when calling `swagger validate`.

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
