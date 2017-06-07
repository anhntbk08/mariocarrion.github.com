---
date: 2017-06-06
title: "Rails Tip: Dynamic JSON fields"
description: "How save JSON arrays"
url: /2017/06/06/rails-5-json-array-fields.html
---

Recently I had the chance to work on a piece of software that required interacting with JSON Arrays. As you may know using native JSON columns in ActiveRecord it's as simple as using the [`store_accessor`](http://api.rubyonrails.org/classes/ActiveRecord/Store.html). For example, let's say we are defining a new column `json_object` that has to follow this JSON structure:

{{< highlight json >}}
{
  "name": "juan perez",
  "age": 69
}
{{< / highlight >}}

By using `store_accessor` in the following way:

{{< highlight ruby >}}
store_accessor :json_object, :name, :age
{{< / highlight >}}

You will define accessors to those two fields that in the end will save those said fields as a JSON to that specific column. Nothing really fancy.

**But**... what if we need to store and edit something like this:

{{< highlight json >}}
[
  "value1",
  "value2",
  "value3"
]
{{< / highlight >}}

This changes things a bit.

I built a [Rails 5 application that solves this problem](https://github.com/MarioCarrion/json-array-fields-for), feel free to follow the source code, includes specs with a 100% coverage, no smoke and mirrors.

What is the solution then?

### ActiveModel to the rescue 

In this Rails application example, there are two keys to solve this problem, **first one** is [this piece of code](https://github.com/MarioCarrion/json-array-fields-for/blob/master/app/models/tag.rb):

{{< highlight ruby >}}
# frozen_string_literal: true
class Tag
  include ActiveModel::Model

  attr_accessor :name

  validates :name, length: { maximum: 5, allow_blank: true }

  def marked_for_destruction?
    false
  end
end
{{< / highlight >}}

The class above defines the individual element that is stored directly into the JSON column (in our example above any of `"value1"`, `"value2"` or `"value3"`). 

Notice how this is a simple Ruby class that includes [`ActiveModel::Model`](http://api.rubyonrails.org/classes/ActiveModel/Model.html), that way we can add validators and allows us it to use as a part of parent model.

**Second part** of the puzzle is [the following concern](https://github.com/MarioCarrion/json-array-fields-for/blob/master/app/models/concerns/article/tags.rb) (that [is included in the model](https://github.com/MarioCarrion/json-array-fields-for/blob/master/app/models/article.rb#L3) defining the table with this JSON array column). 

The important bits of this concern [are the following](https://github.com/MarioCarrion/json-array-fields-for/blob/master/app/models/concerns/article/tags.rb#L5-L17): 

{{< highlight ruby >}}
validates :tags, associated: true

def tags
  @tags ||= add_missing_values(build_from_column)
end

def tags_attributes=(attributes)
  write_attribute(:json_tags, attributes.values)
end
{{< / highlight >}}

* The `validates` allows us to obviously make sure the nested objects are valid and in case they are not it allows us to properly render the view correctly: ![error validation](/images/rails_5_json_array_fields_for_1.png "Error validation")
* The `tags` method allows us to use [`fields_for`](https://github.com/MarioCarrion/json-array-fields-for/blob/master/app/views/articles/_form.html.erb#L27-L32) 

{{< highlight ruby >}}
  <%= form.fields_for :tags, include_id: false do |form_tags| %>
    <li>
      <%= form_tags.label :name %>
      <%= form_tags.text_field :name %>
    </li>
  <% end %>
{{< / highlight >}}

* And finally the `tags_attributes=` method acts as the setter when submitting the form.

With that you can store an array of values to a JSON column. One nice improvement to this Rails application could be to add [cocoon](https://github.com/nathanvda/cocoon) to allow adding (and removing) any number of dynamic fields instead of the hardcoded we defined currently.

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
