---
date: "2018-01-12"
title: "Rails Tip: Maintenance Mode"
description: "How to put Rails Applications into maintenance mode?"
url: /2018/01/12/2018-rails-maintenance-mode.html
---

Releasing new versions on live systems require sometimes to put the application into maintenance mode; it makes it easier to upgrade the system, it avoids errors as side effects related to data consistency and prevents poor user experience when the system is changing (_user confidence_ is important).

Database migrations (including database schema changes and data restructuring) are usually the most difficult part of the deployment, not to mention recurrent jobs that are in charge of updating data periodically and the usual callbacks triggered after making changes to records.

To say the least it gets a bit complicated:

1. To make sure all new changes satisfy correctly all the existing running systems and,
1. To know in advance what could be wrong when systems interact with each other behind the scenes.

Looking for a solution to this problem I found a cool gem called [**turnout**](https://github.com/biola/turnout), it is really easy to use and it supports Rack so it works for Sinatra and Rails as well. Besides the _global_ maintenance mode, there are other cool features like putting into maintenance mode specific endpoints via paths and restricting some IP address, just to mention a few.

Internally the way it works (in Rails) is [by adding itself as a middleware](https://github.com/biola/turnout/blob/aa4af887d609c93e2b50fd224a94221ecc1c2745/lib/turnout/engine.rb#L10), then it checks the existence of the temporary file to determine if it's enabled or not, [it does this each request](https://github.com/biola/turnout/blob/aa4af887d609c93e2b50fd224a94221ecc1c2745/lib/rack/turnout.rb#L15-L27), finally it renders the maintenance mode page when all the settings apply.

I found that using the [configuration](https://github.com/biola/turnout/tree/aa4af887d609c93e2b50fd224a94221ecc1c2745#configuration) added as an initializer to the Rails application works better, because usually the maintenance mode message does not change, so when you want to enable this mode using the turnout rake tasks with no extra parameters is enough.

**turnout** does what advertises correctly however _putting into maintenance mode_ your application is not something that happens **all** the time during deployment, so instead of adding it directly to the Gemfile I recommend creating a patch that then is applied **specifically** when maintenance mode is required, that way we avoid this extra middleware call that check the existence of the file (for every single request). The con of this extra step during the process is that deployment is more convoluted but then again there's no need to put the Rails Application into maintenance mode every single time, so if I'm planning to put the application into maintenance mode I know for sure I have to _patch it_ first, so this for me works.
