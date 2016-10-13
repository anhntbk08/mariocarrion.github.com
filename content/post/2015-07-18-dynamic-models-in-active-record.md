---
date: 2015-07-18T00:00:00Z
description: There are cases where you need to dynamically access tables, how can
  you define a model in ActiveRecord for doing so?
image: https://c2.staticflickr.com/8/7467/28902969295_d448eeb31b_o.png
image_facebook: https://c2.staticflickr.com/8/7467/28902969295_d448eeb31b_o.png
published: true
status: publish
title: 'Tip: Dynamic Models in ActiveRecord with PostgreSQL'
url: /2015/07/18/dynamic-models-in-active-record/
---

One of the most recent problems I had to face was to dynamically access tables based on a certain pattern. Think of tables with the following format: `table_1`, `table_2` ... `table_n`, or any other format to be honest, just think of a *well known format*.

Another interesting thing about this problem was also the fact we are required to use both PostgreSQL and [Schemas](http://www.postgresql.org/docs/9.1/static/ddl-schemas.html) to somehow organize the data in a better way. So, how to dynamically create class models that also happen to use different schemas in PostgreSQL with ActiveRecord?

The [solution](https://github.com/MarioCarrion/share-activerecord-models/commit/b70fd15fd579a0261d9152889045047a24354960) is pretty simple and really straightforward:

{{< highlight ruby >}}
require 'active_record'

class ModelFactory < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def build_model(params)
      schema = params[:schema]
      table = params[:table]
      full_name = "#{schema}.#{table}"

      create_database_objects(schema, table, full_name)

      model = Class.new(ModelFactory) do
        self.table_name = full_name
      end

      model
    end

    private
    def create_database_objects(schema, table, full_name)
      connection = ModelFactory.connection

      # Create Schema 
      unless connection.schema_exists?(schema)
        begin
          connection.create_schema(schema)
        rescue PG::DuplicateSchema
        end
      end

      # Create Table
      new_table = false
      unless connection.table_exists?(full_name)
        new_table = true
        begin
          connection.create_table(model.table_name) do |table|
            table.column :name, :string, limit: 50, null: false
            table.column :address, :string, limit: 300, null: false
          end
        rescue PG::DuplicateTable
        end
      end

      # What's next? Maybe adding indexes, who knows, sky is the limit
    end
  end

end
{{< / highlight >}}

With that you can easily do something like:

{{< highlight ruby >}}
model = ModelFactory.build_model({schema: 'important_stuff', table: 'some_table'})
model.new(name: 'Mario', address: '742 Evergreen Terrace').save!
{{< / highlight >}}

The explanation of the code above is simple:

1. You need an abstract class because your new dynamic classes have to subclass in order to reference the real table.
2. The method `ModelFactory.build_model` is used for creating new models.
3. Besides creating the model, the actual schema and table is created in case they do not exist, the creation is wrapped in a `begin`/`rescue` section in case multiple `ModelFactory` instances receive the same message for creating the same *schema+table* at the same time.

Clear and specially simple solution.
