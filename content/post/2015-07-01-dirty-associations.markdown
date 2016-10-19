---
date: 2015-07-01T00:00:00Z
description: ActiveModel::Dirty is a phenomenal way to detect the changes in a model,
image: ruby.png
image_facebook: ruby-facebook.png
title: 'Tip: Dirty Associations with Active Record'
url: /2015/07/01/dirty-associations.html
---

Depending on your project you may need to know exactly when something changes in your model, to do whatever you have to do, specially important if you need to know what changed **inside** the associations defined in your model.

So, how do we know, when modifying a model, what *changed* inside that model?

The simplest answer would be: [ActiveModel::Dirty](http://api.rubyonrails.org/classes/ActiveModel/Dirty.html), and that works, except it does not consider associations (which is the whole point of this post); so how do we get what changed inside the associations?!

First a little context, in Ruby on Rails I use [Services](https://blog.engineyard.com/2014/keeping-your-rails-controllers-dry-with-services) and [Wisper](https://github.com/krisleech/wisper) to keep  my models slim and the external logic *outside* the model, which although related to the business, is not relevant to the actual models themselves.

That being said, let's assume I have a model and according my to business rules, I have to create/update a file after this model is updated. How can we do this? Hint: **not using callbacks**, like ``after_save``, that for sure!

Again, let's assume I have my controller that uses a service to update the model, inside this service I use Wispper to broadcast the changes after saving a ``valid?`` record. Everything fine and dandy so far.

But... how do I determine what changed inside the associations? How do I know in the service, what to broadcast if one of items in a particular association changed? Because for whatever reason, this model does some crazy stuff regarding a particular association, and honestly I **only** want to make those changes when that association or any item from that association changes.

Well, here's my solution, a little bit of reflection and [concerns](http://api.rubyonrails.org/classes/ActiveSupport/Concern.html).


{{< highlight ruby >}}
module Dirtyable
  extend ActiveSupport::Concern

  WhatChanged = Struct.new(:object, :changes) do
    def changed?
      self != NoChanges
    end
    delegate :has_key?, to: :changes
  end
  NoChanges = WhatChanged.new(nil, nil)

  def what_changed?
    what_changed = nil

    self.previous_changes.delete('updated_at')
    unless self.previous_changes.empty?
      what_changed = WhatChanged.new(self, self.previous_changes)
    end

    associations = self.class.reflections.select { |k, v| v.collection? }.keys

    associations.each do |association_name|
      catch :next_association_name do
        association_collection = self.send(association_name)
        throw :next_association_name unless association_collection
        throw :next_association_name if association_collection.empty?

        association_collection.each do |item|
          throw :next_association_name unless item.respond_to?(:what_changed?)

          association_changes = item.what_changed?
          if association_changes != NoChanges
            what_changed ||= WhatChanged.new(self, {})

            what_changed.changes[association_name] ||= []
            what_changed.changes[association_name] << association_changes
          end
        end
      end
    end

    what_changed || NoChanges
  end
end
{{< / highlight >}}

The module above is pretty straightforward, it uses both ``ActiveModel::Dirty`` and reflection to get the associations that have changes, however the important thing is that in order to make this work all models that you want to keep track of must include this module.

So for example if you have a couple of models like this:

{{< highlight ruby >}}
class FancyModel < ActiveRecord::Base
  include Dirtyable
  
  has_many :things
end

class Thing < ActiveRecord::Base
  include Dirtyable
  
  belongs_to :fancy_model
end
{{< / highlight >}}


You can easily get the changes when updating FancyModel (and having changes in any of the ``things``, in your service for example), of what changed by just executing a call like this:

{{< highlight ruby >}}
what_changed = fancy_model.what_changed?
if what_changed.changed?
  if what_changed.has_key?(:things)
    # I do whatever I have to do... maybe call "broadcast(:on_things_changed)"?
  end
end
{{< / highlight >}}

Pretty cool. With that you can easily broadcast specific events when specific things change, no need to broadcast a global *on_model_changed* if you don't have to.
