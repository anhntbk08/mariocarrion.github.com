---
date: 2016-01-22T00:00:00Z
image: ruby.png
image_facebook: ruby-facebook.png
title: 'Tip: From MySQL to PostgreSQL'
url: /2016/01/22/fixing-mysql-postgresql-upgrades.html
---

Recents projects are involving migrating from MySQL to PostgreSQL for all the databases including those used in Rails and Reporting.

I personally like this change a lot but there a few things I had to remember when changing between MySQL and PostgreSQL, I'll enumerate those.

### MySQL Upgrade Error

Not really related to a *MySQL->PostgreSQL* migration but more a thing I encounter from time to time when upgrading my local MySQL version, specifically after doing the usual ```brew upgrade```.

This is an error when connecting to MySQL, that happens if you use a GUI, for example [MySQL Workbench](https://www.mysql.com/products/workbench/) or [Sequel Pro](http://www.sequelpro.com/). The error says:

`Table 'performance_schema.session_variables' doesn't exist`

This is easy to fix, nothing really crazy, just execute:

`mysql_upgrade -u root -p --force`

### PostgreSQL Upgrade Error

Similar to the MySQL Upgrade Error above, PostgreSQL also complains after upgrading to a major version. For example when I upgraded from 9.4 to 9.5. The error I got was:

> FATAL:  database files are incompatible with server
> DETAIL:  The data directory was initialized by PostgreSQL version 9.4, which is not compatible with this version 9.5.0.

This one requires a little bit more, but is also easy to fix. Obviously the paths I'm using here depend on your actual installation, but if you are also a Homebrew user, then figuring those out shouldn't be that difficult:

{{< highlight ruby >}}
mv /usr/local/var/postgres /usr/local/var/postgres945
initdb /usr/local/var/postgres -E utf8
pg_upgrade -b /usr/local/Cellar/postgresql/9.4.5/bin -B /usr/local/Cellar/postgresql/9.5.0/bin -d /usr/local/var/postgres945 -D /usr/local/var/postgres
{{< / highlight >}}

### MySQL to PostgreSQL Rails Database Migration

Lastly, another common thing I have to deal a lot with while doing this migration is the **actual** database migration, then execute some ALTERS here and here to use the real types and import the data.

There are lot of ways to do this, like you could go all fancy and use something like [AWS' DMS](https://aws.amazon.com/dms/) or you could follow my poor's man way of doing it.

Basically I use [FromMySqlToPostgreSql](https://github.com/AnatolyUss/FromMySqlToPostgreSql), which is a command line script written in PHP, that not only converts the types but also imports the data and honestly is dead easy to use. The only requirement is a recent PHP Cli version. Just follow the instructions for installing PHP in Homebrew from the [official repo](https://github.com/Homebrew/homebrew-php) and then do:

```brew install php54-pdo-pgsql```

Make sure your `.bashrc` includes:

```export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"```

And you're all set regarding the schemas and database content, however one missing thing in this is the conversion of some of the columns to the real PostgreSQL type. Specifically the `tinyint` that ActiveRecord has to use for representing boolean values.

This is easy to do with the following Rake task, obviously using the MySQL database:

{{< highlight ruby >}}
namespace :pg do

  desc 'Creates ALTER statements to convert from mysql:tinyint to pg:boolean'
  task create_alters: :environment do
    filename = Rails.root.join("pg_alter_#{Time.now.to_i}.sql")

    File.open(filename, 'w') do |file|
      ActiveRecord::Base.connection.tables.each do |table|
        ActiveRecord::Base.connection.columns(table).each do |column|
          next unless column.type == :boolean

          file.write "-- Table: #{table}\n"
          file.write build_alter_statements(table, column)
          file.write "\n"
        end
      end
    end

    puts "Output file: #{filename}"
  end

 def build_alter_statements(table, column)
    default_value = (column.default.to_i == 1 ? 'TRUE' : 'FALSE')

    <<-SQL
ALTER TABLE #{table} ALTER COLUMN #{column.name} DROP DEFAULT;
ALTER TABLE #{table} ALTER #{column.name} TYPE bool USING CASE WHEN #{column.name}=1 THEN TRUE ELSE FALSE END;
ALTER TABLE #{table} ALTER COLUMN #{column.name} SET DEFAULT #{default_value};

    SQL
  end
end
{{< / highlight >}}

By executing

```rake pg: create_alters```

You should be able to get a file in your Rails root that contains all the right `ALTER` statements for properly converting the `tinyint`s to `boolean`s.
