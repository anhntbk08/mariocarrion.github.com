---
date: 2017-02-09
title: "KnockoutJS/Jquery Tip: Custom Bindings"
description: "Initializing jQuery elements from within KnockoutJS"
url: /2017/02/09/knockoutjs-jquery-custom-bindings.html
---

I faced the following problem today: _How can I initialize jQuery components after being loaded by KnockoutJS?_ Specifically I was trying to initialize a [select2 component](https://select2.github.io/).

The first _naive_ solution was to try using something like:

{{< highlight js >}}
<script type="text/javascript">
  $(document).ready(function() {
    $("select.select2").select2();
  });
</script>
{{< / highlight >}}

That **did not work**. After I quick googling I found this [Stackoverflow solution](http://stackoverflow.com/questions/28955862/how-to-use-jquery-in-a-knockout-js-template), _How to use jQuery in a Knockout.js Template?_; sadly for whatever reason none of the current answers are marked as solution although is clear the one with the most upvotes answers it: You have to use [custom bindings](http://knockoutjs.com/documentation/custom-bindings.html).

I created [a jsFiddle](https://jsfiddle.net/MarioCarrion/aekakyhm/) demonstrating this solution, really cool stuff:

<script async src="//jsfiddle.net/MarioCarrion/aekakyhm/embed/js,html/dark/"></script>
