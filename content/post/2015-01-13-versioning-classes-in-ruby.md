---
date: 2015-01-13T00:00:00Z
description: How do you implementing versioning classes in Ruby? I will tell you how.
image: ruby.png
image_facebook: ruby-facebook.png
published: true
status: publish
title: 'Tip: Versioning classes in Ruby'
url: /2015/01/13/versioning-classes-in-ruby/
---

**Versioning classes** is not difficult at, specially if you're using a modern programing language. Use [Reflection](http://en.wikipedia.org/wiki/Reflection_(computer_programming)) together with a concrete implementation of the [Builder Pattern](http://en.wikipedia.org/wiki/Builder_pattern) a you're good to go.

But why versioning classes? The reason behind class versioning is always about *Backwards compatibility*, where most of the times, the instance of the class actually represents data in some sort of a *strict format*, meaning the outputed data has to be formatted in a certain way if you want it to make sense, for example a CSV file that represents a backup of a table in a relational database.

In Ruby versioning classes is relativily simple, see the following class for example, in this case we assume we want the instances of this class to generate a CSV file (I'm ommiting proper quouting and whatnot, so this is basically to give you an idea of a real life example).

{% gist mariocarrion/fd1ec472a859528615d3 %}

The class defines methods that allows us to indicate the class version and includes a new class method to explicitly indicate the type of the element, the length and if the value is required, similar to the well-known [attr_accessor](http://ruby-doc.org/core-2.0/Module.html#method-i-attr_accessor).

Subclassing that class like this:

{% gist mariocarrion/6edc06bbacaddf21ffec %}

Will allows to get an output similar to the next one:

{% gist mariocarrion/5eacfc19d503fd9ce6c8 %}

The cool thing about this implementation is that you can keep on subclassing the most recent version and still the order of the columns will make sense. Let's say you forgot about age, and you need a new class, you would do something like this:

{% gist mariocarrion/72ceb73908bece57448a %}

And similar to the previous example, the output will be this:

{% gist mariocarrion/d922c38096f505a0a059 %}

Obviously I'm missing the Builder, so for example this:

{% gist mariocarrion/19203d195e106deee8d8 %}

Will make more sense:

{% gist mariocarrion/b0fbfbda5295ff24c82d %}

In the end, all of this is useful if you have to have data in a format that is explicit, if you use a NoSQL database all of this doesn't make sense, but still is good to know.
