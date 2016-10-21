---
date: 2016-10-19T00:00:00Z
title: "Migrated: From Jekyll to Hugo"
description: "How difficult, or easy, was it?"
url: /2016/10/19/hugo-migration.html
---

If I recall correctly this is the fourth time migrating my blog to a different service or engine, I started using [Blogger](https://en.wikipedia.org/wiki/Blogger_(service)), migrated to [Wordpress](https://en.wikipedia.org/wiki/WordPress), then [Jekyll](https://jekyllrb.com/) and now [Hugo](https://gohugo.io/).

The truth is that after migrating and building my blog for the first time with Hugo I was extremely surprised: **it took les than 400ms**, with Jekyll? It takes more than 5 minutes! Sometimes even more specially when you start getting errors that prevent the build, not to mention that the automatic rebuild after resaving does not seem to work properly.

{{< tweet 778790542452883456 >}}

## How was it?

Migrating to Hugo was pretty straightforward, I followed the official [Migrate to Hugo from Jekyll](https://gohugo.io/tutorials/migrate-from-jekyll/) guide, then I reworked my [Lagom theme](https://github.com/swanson/lagom) to implement it using [Go's template system](http://gohugo.io/templates/go-templates/). It took me about 3 weeknights to complete the whole migration. From that I learned the following:

### Embedded tweets

In Jekyll I used the [jekyll-twitter-plugin](https://github.com/rob-murray/jekyll-twitter-plugin) to embed tweets, Hugo includes a [shortcode](https://gohugo.io/extras/shortcodes/) called, surprisingly, **tweet**. So stuff like this:

<pre class="black-pre">
{% twitter oembed https://twitter.com/mariocarrion/status/771469295431868416 %}
</pre>

becomes:

<pre class="black-pre">
{{&lt; tweet 779294387348135936 &gt;}}
</pre>

### Permalinks

Permalinks are built by default using the following format:

<pre class="black-pre">
/2016/10/06/go-web-programming/index.html
</pre>

That does not work for me, because of the SEO, so I had to rename all the posts to the **date+article-name.html** format, so those became:

<pre class="black-pre">
/2016/10/06/go-web-programming.html
</pre>

### Post references

In Jekyll links to your own posts on your blog use the following format:

<pre class="black-pre">
{% post_url 2016-09-16-first-sprint-with-go-and-docker %}) 
</pre>

In Hugo there are two shortcodes for generating links like that, either relative or absolute, so previous Jekyll links became something like the following:

<pre class="black-pre">
{{&lt; relref "2016-09-16-first-sprint-with-go-and-docker.markdown" &gt;}}
</pre>

### Syntax Highlighting

Jekyll uses something like:

<pre class="black-pre">
{% highlight ruby %}
puts 'foo'
{% endhighlight %}
</pre>

The migration script correctly migrated those tags above to the Hugo format, so everything became:

<pre class="black-pre">
{{&lt; highlight ruby &gt;}}
puts 'foo'
{{&lt; / highlight &gt;}}
</pre>

However I didn't have any syntax highlighting, fixing this issue was easy after reading [the official guide](https://gohugo.io/extras/highlighting/); I was missing the **pygmentize** command, installing [Pygments](http://pygments.org/) fixed the issue:

<pre class="black-pre">
easy_install Pygments
</pre>

## Archive page

In Jekyll I built the [Archive page](/archive.html) using Liquid, in Hugo I had to rewrite everything [using a shortcode](https://github.com/MarioCarrion/mariocarrion.github.com/blob/master/themes/lagom/layouts/shortcodes/archive_list.html), and then reference this shortcode from [the page itself](https://github.com/MarioCarrion/mariocarrion.github.com/blob/master/content/pages/archive.markdown).

## HTML and CSS minification 

Minification in Jekyll was handled through the [jekyll-press](https://github.com/stereobooster/jekyll-press); Hugo does not support anything similar out of box, instead what is suggested is to use a external tool for doing so, one of the recommended options is [Minify](https://github.com/tdewolff/minify/tree/master/cmd/minify). In the end I made a [Makefile](https://github.com/MarioCarrion/mariocarrion.github.com/blob/master/Makefile) that calls Hugo and minify to generate the final site, all working really good.

## Cleanup program

In order to save myself some time and make sure there were no errors while replacing the old tags to the new tags (tweet tags, renaming the permalinks and cleaning up old fronmatter tags) I wrote a [Go program](https://github.com/MarioCarrion/jekyll-to-hugo).

I'm missing the Open Graph and Twitter meta tags for properly displaying the content when sharing, I'll be working on that next, for now everything builds faster and I could not be any happier.
