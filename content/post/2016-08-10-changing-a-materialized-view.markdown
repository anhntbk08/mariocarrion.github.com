---
date: 2016-08-10T00:00:00Z
description: What are the best practices when making changes to a column used by a
  Materialized View, the best way to handle the change without affecting your production
  environment.
image: https://c2.staticflickr.com/8/7467/28902969295_d448eeb31b_o.png
image_facebook: https://c2.staticflickr.com/8/7467/28902969295_d448eeb31b_o.png
published: true
status: publish
title: 'Tip: Materialized Views: modifying columns with Scenic'
url: /2016/08/10/changing-a-materialized-view/
---

Back in February I wrote about [Sharing ActiveRecord models between different projects using ActiveRecord]({% post_url 2016-02-26-sharing-models-between-projects %}) by using a combination of Rails and [Scenic](https://github.com/thoughtbot/scenic).

Well, what happens when you need to change the column type of one of the tables used by a Materialized View. How do you do that? Using the [example I already have on github](https://github.com/MarioCarrion/share-activerecord-models), and assuming you want to change **products.name** from `string` to `text`, you would need generate a migration:

{{< highlight bash >}}
rails g migration change_products_name
{{< / highlight >}}

With the following content:

{{< highlight ruby >}}
class ChangeProductsName < ActiveRecord::Migration
  def up
    drop_view :expensive_products, materialized: true

    change_column :products, :name, :text

    create_view :expensive_products, materialized: true

    # If we had more versions for this materialized we would use the latest
    # generated instruction, something like:
    #
    # update_view :expensive_products, version: 2, revert_to_version: 1, materialized: true

    add_index :expensive_products, :id, unique: true
  end

  def down
    drop_view :expensive_products, materialized: true

    change_column :products, :name, :string

    create_view :expensive_products, materialized: true

    # Similar to "#up" we would do the same:
    #
    # update_view :expensive_products, version: 2, revert_to_version: 1, materialized: true

    add_index :expensive_products, :id, unique: true
  end
end
{{< / highlight >}}

What is important to take from the code in this migration is how we make the change to update the table and then, after that, we create or update the materialized view, depending on how many versions we already have.

The important question about all of this is: _Is this the **right way** to do it?_ This is definitely the way to do it if you don't really have live traffic, or you don't mind getting errors while the database is making the changes.

When your system has a lot of traffic you need to be careful and treat your clients with respect, to me the best way to handle a change like this is by doing the following:

1. Create a single migration to add a new column with the right type you want to use to the table.
1. Create a _dumpster_ rake task, to copy the data from the old column to the new one.
1. Update your views, if any, to use this new column.
1. Create a new materialized view, that uses this new column instead of the other one.
1. Update your model and [self.table_name](http://api.rubyonrails.org/classes/ActiveRecord/ModelSchema/ClassMethods.html#method-i-table_name) to this new materialized view.
1. **Make a release**
1. Create a migration similar to the above, making the changes you want.
1. Again, create a _dumpster_ rake task, in this case copy the data from new column to the old one.
1. Again, update your views, if any, to use the old column.
1. Again, update your model to use the old *self.table_name*.
1. **Make a release**

I know all the steps above seem like overkill, but the truth is that if you're trying to keep your system 100% uptime, with practically zero amount of errors and number of user complaints, that's the only way to do it, basically:

1. Create an intermediary
2. Migrate
3. Revert
