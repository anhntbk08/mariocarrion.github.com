---
date: 2016-02-26T00:00:00Z
description: Share your ActiveRecord models, keep your migration commands and use
image: ruby.png
image_facebook: ruby-facebook.png
title: 'Tip: Sharing ActiveRecord models between projects'
url: /2016/02/26/sharing-models-between-projects.html
---

How can we share all our ActiveRecord models between different projects? More importantly, how can we share those models **cleanly** while keeping all the familiar commands for migrating databases as well as the support for custom generators.

Now, the part about generators is extremely important, because we are currently using PostgreSQL's [Materialized Views](http://www.postgresql.org/docs/9.3/static/sql-creatematerializedview.html) and therefore [scenic](https://github.com/thoughtbot/scenic), so keeping that intact is a must.

So to recapitulate, we need: **Active Record Models**, **Rails Migrations** and **Rails Generators**.

### ActiveRecord Models and Migrations

Migrations and Models go hand in hand. Yes, you don't really need migrations for your models, but they are extremely useful for making changes to your [Database Model](https://en.wikipedia.org/wiki/Database_model). The truth is that unless you have your schema already set on stone (which is not going to be the case) you won't need migrations, but if not and you're planning to add, remove or change your database model while working on your project you will need some sort of migrations mechanism. Period.

Having migrations without Rails is not something new, there are multiple gems already providing this functionality, my favorite being: [active\_record\_migrations](https://github.com/rosenfeld/active_record_migrations).

But, having this gem alone is not enough... what about the next thing?

### Generators

How can we use generators outside Rails? Actually, using generators outside Rails does not make too much sense, does it? It does if you, like us, depend on a gem like scenic, that uses generators for creating migrations.

With that dependency, it's not possible to use **scenic** with **active\_record\_migrations**, so what can we do then?

### Solution: Use Rails

Now at this time is obvious to say that in order to make this mini project work, you need to bundle all your ActiveRecord models into a gem, this gem besides supporting all the usual **rake db:related** commands, you have to support **generate** for generating migrations and  views.

So how then? Surprisingly, all of this is not really that difficult, it is quite simple honestly.

Take a look the [repo](https://github.com/mariocarrion/share-activerecord-models) I created, it's really easy to follow, clone it and play with it.
