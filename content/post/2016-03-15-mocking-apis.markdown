---
date: 2016-03-15T00:00:00Z
description: null
image: ruby.png
image_facebook: ruby-facebook.png
published: true
status: publish
title: 'Tip: Mocking Web APIs'
url: /2016/03/15/mocking-apis/
---

If you interact with any web-based service you need to mock your requests to properly test you program. In reality there are two ways of mocking your external requests:

1. You *save* the response, for example using something like [VCR](https://github.com/vcr/vcr), or
1. You *mock* the request using something like [Webmock API](https://github.com/bblimke/webmock).

## Save response using VCR

VCR is a really cool gem, it allows you to *replay* whatever HTTP interactions you had the first time you invoked it, the idea is to always have the same response no matter what, because you actually save the resulting response into a file, a *cassette*.

The configuration, in this case using webmock as the stubbing facility, is something like this, 

{{< highlight ruby >}}
VCR.configure do |config|
  config.configure_rspec_metadata!
  config.cassette_library_dir = File.expand_path(File.join('..', 'cassettes'),
                                                 __FILE__)
  config.hook_into :webmock
end
{{< / highlight >}}

Obviously your specific `cassette_library_dir` depends on your context, but you get the idea.

In Rspec, to use it, you would do something like this:

{{< highlight ruby >}}
describe '#some_method', vcr: { cassette_name: 'my_request' } do
  it 'here I request whatever url I need to' do
    # fun stuff
  end
end
{{< / highlight >}}

This spec will create a file `my_request.yml` that will contain all the HTTP information requested the time it was executed, including the actual response, and it will use this same file to mock the HTTP objects required to run your tests, so it will always give you the same response.

## Mock response using Webmock

In cases where you actually don't have a predefined URL to request, because maybe your program handles responses differently depending on the response code, you would need to explicitly mock this request. For that you need to use webmock directly.

Enabling webmock in this case is a little bit more elaborated than using VCR, but still not that complicated. You would need to do three things:

### 1. Implement a Sinatra Application that handles the actual request

{{< highlight ruby >}}
require 'sinatra/base'

class DummyApp < Sinatra::Base
  get '/' do
    'hello'
  end
end
{{< / highlight >}}

### 2. Configure RSpec to stub specific domains with that Sinatra application

{{< highlight ruby >}}
RSpec.configure do |config|
  config.include WebMock::API

  config.before(:each) do
    stub_request(:any, /mocked-domain.com/).to_rack(DummyApp)
  end
end
{{< / highlight >}}

### 3. Use that in your spec

{{< highlight ruby >}}
describe '#some_method' do
  it 'here I request mocked-domain.com/hello' do
    # fun stuff
  end
end
{{< / highlight >}}

## Final thoughts

Knowing both ways to handle (and mock) external web services is extremely useful because it allows you to have deterministic results. Super useful when building programs around external web services.
