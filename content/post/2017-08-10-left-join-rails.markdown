---
date: 2017-08-10
title: "ActiveRecord Tip: Left Join"
description: "Left Join in ActiveRecord"
url: /2017/08/10/tip-active-record-left-join.html
---

Using SQL INNER JOIN in ActiveRecord is really simple.

Let's assume you have a relationship _User has many Posts_; _User_ has a flag _vip_ and _Post_ have a flag _approved_. If you wanted to know the **VIP Users with active Posts** you would use something like:

{{< highlight ruby >}}
User
  .joins(:posts)
  .where(posts: { approved: true })
  .where(vip: true)
{{< / highlight >}}

Which is _translated_ to the following SQL statement:

{{< highlight ruby >}}
SELECT "users".* FROM "users"
INNER JOIN "posts" ON "posts"."user_id" = "users"."id"
WHERE "posts"."approved" = true AND "users"."vip" = true
{{< / highlight >}}

All fine and dandy, but...

What if we wanted to know **All VIP Users with approved Posts, including those with no approved Posts**?

**That** is a _SQL LEFT JOIN_? Which in human terms means _return everything on the left side and include the right even if there's no right and in that case just nullify the right_.

There's not `leftjoins` or something similar in ActiveRecord (yet); so instead of that we have to use `joins` with a string and explicitly indicate the columns to use for the JOIN.

Our first try would look something like this:

{{< highlight ruby >}}
User
  .joins('LEFT JOIN "posts" ON "posts"."user_id" = "users"."id"')
  .where(posts: { approved: true })
  .where(vip: true)
{{< / highlight >}}

But **that** will not return those _Users_ with zero Posts, recall the `where` statements apply after the JOINS happen, so in other words the query above is trying to apply a filter (**after**) to the nullified results.

What we need is something like this:

{{< highlight ruby >}}
User
  .joins('LEFT JOIN "posts" ON "posts"."user_id" = "users"."id" AND "posts"."approved" = true')
  .where(vip: true)
{{< / highlight >}}

Or if you are using dynamic parameters you could use something like:

{{< highlight ruby >}}
join_conditions = '"posts"."user_id" = "users"."id" AND '"posts"."approved" = ?'
conditions = User.sanitize_sql_array([join_conditions, true])
User
  .joins("LEFT JOIN \"posts\" ON #{conditions}")
  .where(vip: true)
{{< / highlight >}}

**That** will return the records you're expecting to return.

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
