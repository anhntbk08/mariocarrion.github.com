---
date: "2019-08-04"
title: "Gitlab Tip: Generating documentation with mermaid"
description: "Using Gitlab pages, mkdocs, mermaid and readthedocs to generate cool documentation"
url: /2019/08/04/gitlab-mkdocs-mermaid-pages.html
---

One best practice we follow regarding documentation is to _keep it close to what it describes_, we prefer including those files together with the actual code, in a different `docs/` folder. We write them in [Markdown](https://daringfireball.net/projects/markdown/) because it is a simple and easy to understand format that is automatically rendered correctly when browsing those files in [Gitlab]({{< relref "2016-08-24-git-workflow.markdown" >}}).

And because we are Gitlab users, we are also able to use other features like [Gitlab pages](https://about.gitlab.com/product/pages/) and the [`mermaid`](https://github.com/knsv/mermaid) support in markdown to generate even better and useful documentation.

### Using mkdocs for generating public documentation

There is [Gitlab repository](https://gitlab.com/MarioCarrion/mkdocs-example) that demonstrates this process, important bits about this specific repository are:

* [`.gitlab-ci.yml` configuration](https://gitlab.com/MarioCarrion/mkdocs-example/blob/1a81c1bc03be4d1cd31d39e7b1e042a6fbb5654b/.gitlab-ci.yml#L6) explicitly using the [forked image](https://cloud.docker.com/repository/docker/mariocarrion/mkdocs-mermaid-plugin) and copying the CSS fixes before the build, and
* [mkdocs-mermaid forked plugin](https://github.com/MarioCarrion/mkdocs-mermaid-plugin) that includes specific fixes for the bundle `readthedocs` theme and docker support.

The final result:

* [mkdoc documentation using readthedocs](https://mariocarrion.gitlab.io/mkdocs-example/) and, the equivalent
* [Gitlab markdown rendered](https://gitlab.com/MarioCarrion/mkdocs-example/tree/1a81c1bc03be4d1cd31d39e7b1e042a6fbb5654b/docs)

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
