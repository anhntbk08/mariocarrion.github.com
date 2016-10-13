---
date: 2015-07-12T00:00:00Z
description: Amoeba is a gem for duplicating ActiveRecord objects, it does it in a
  cool clean way, however not allowing to properly inherit the associations to be
  included could be extremely frustrating. In this post I share with you a way to
  handle that in a better way.
image: ruby.png
image_facebook: ruby-facebook.png
published: true
status: publish
title: 'Tip: Amoeba with deep cloning'
url: /2015/07/12/amoeba-with-deep-cloning/
---

One of the basic things [we](http://www.selectablemedia.com) always do is duplication, and since we use Rails (and therefore ActiveRecord) duplicating objects clearly is a must. I recall I was in charge of implementing duplication and back at that time I decided to use reflection to duplicate the elements and although it worked, it grew out of control.

In next big iteration of the project, one of our engineers decided to use [deep_cloneable](https://github.com/moiristo/deep_cloneable). Which worked really good in the beginning, until our models started to become more complex and the need of including their associations (and their associations' associations) was a requirement. Adding those associations became extremely painful and specially confusing.

Finally after more research another of our engineers suggested a new gem called [amoeba](https://github.com/amoeba-rb/amoeba), which worked really well because defining what to clone and how to clone it was clear. However there was a caveat: inheritance, specially [Single Table Inheritance](http://api.rubyonrails.org/classes/ActiveRecord/Base.html#class-ActiveRecord::Base-label-Single+table+inheritance).

According to the [README](https://github.com/amoeba-rb/amoeba/blob/master/README.md), STI is supported... sort of, the truth is after testing the different options and reading the source code it became obvious that inheritance wasn't properly supported, and we needed it.

So, after thinking a little bit I decided to write a little [concern](http://api.rubyonrails.org/classes/ActiveSupport/Concern.html) to handle this in a *better way*. The goals of this concern where specifically:

1. To define the ``duplicate`` method
2. To define a block that uses amoeba's DSL
3. Allow inherited blocks to be properly inherited by subclasses
4. Profit

The solution was the following:

{{< highlight ruby >}}
# If you use amoeba (https://github.com/amoeba-rb/amoeba) for cloning your
# ActiveRecord objects this concern should be useful, it allows you properfly inherit
# associations if you use (Single Table) Inheritance.
#
# Just do something like:
# 
# class SomeTable < ActiveRecord::Base
#   has_many :somethings
#
#   duplicate_this do
#     include_association :somethings
#   end
# end

module Duplicable
  extend ActiveSupport::Concern

  included do
    class_attribute :amoeba_blocks
  end

  module ClassMethods
    def inherited(subclass)
      super
      subclass.duplicate_this
    end

    def duplicate_this(&block)
      self.amoeba_blocks ||= begin
        blocks = [ Proc.new { enable } ]

        superclass = nil
        loop do
          superclass = self.superclass
          break if superclass == ActiveRecord::Base

          blocks.unshift(*superclass.amoeba_blocks)
        end

        blocks << block if block_given?

        blocks
      end

      blocks = self.amoeba_blocks

      self.amoeba do |config|
        blocks.each { |db| config.instance_eval(&db) }
      end
    end
  end

  def duplicate
    blocks = self.class.amoeba_blocks || []

    self.class.amoeba do |config|
      blocks.each { |db| config.instance_eval(&db) }
    end

    self.amoeba_dup
  end
end
{{< / highlight >}}


What is important to notice in the gist above is two things:

1. The ``inherited`` method and
2. The methods ``duplicate`` and ``duplicate_this``

First, the [inherited](http://ruby-doc.org/core-2.2.2/Class.html#method-i-inherited) method. This method is callback that is executed immediately whenever a subclass of the current class is created, in other words: if *class A* includes *module Duplicable* and then *class B* subclasses *class A*, ``inherited`` is called. This is specially important in cases where subclasses do not explicitly call the ``duplicate_this`` method but still need to support ``duplicate``... which is the whole point of subclassing a *Duplicable* class.

Second, the methods ``duplicate`` and ``duplicate_this``. If you notice the *magic* behind this concern is basically saving all the blocks (that include amoeba's DSL) in a [class_attribute](http://api.rubyonrails.org/classes/Class.html#method-i-class_attribute) called *amoeba_blocks*, and then invoking them using ``instance_eval``, so in the end amoeba is the one executing all the blocks and therefore properly invoking their methods.

Metaprogramming at its finest if you ask me.

