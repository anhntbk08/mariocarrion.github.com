---
date: 2017-02-06
title: "Ruby Tip: Sharing VCR cassettes in gems"
description: "How can you share a cassette defined in a Gem using VCR?"
url: /2017/01/06/sharing-vcr-cassetts-in-gems.html
---

Last year I posted a tip for [Mocking Web APIs]({{< relref "2016-03-15-mocking-apis.markdown" >}}), this post is slightly similar: **using cassettes coming from a gem you depend on and at the same time use your own cassettes**.

Think of the following:

> You depend on a Web API (implemented in a gem called `fancy-web-api`), this gem uses internally VCR for testing, nd you use the responses from that API to build concrete objects that only apply to your implementation.

How can you reuse those cassettes defined in `fancy-web-api`?

Let's think of the perfect world scenario: we control both `fancy-web-api` and a new application that uses this gem. This is, of course, s the easiest way to explain this solution, however if that's not your case then contribute to the gem you depend on the following solution.

### Exposing the cassettes from fancy-web-api

The key to reuse the cassettes, or actually any other thing being used for testing (like factories or fixtures), is to expose them so then can be loaded from _the outside_. In the case of cassettes you would a file included in your `fancy-web-api` something similar to this:

{{< highlight ruby >}}
# frozen_string_literal: true

# Takeaways
# * This file lives in *your gem* in "web_api/vcr_testing.rb"
# * VCR cassettes are defined in "../../../spec/cassettes" relative to this file
module FancyWebAPI
  class VCRTesting
    CASSETTES_PATH = File.expand_path('../../..', __FILE__).freeze

    class << self
      def configure!(config)
        config.configure_rspec_metadata!
        config.cassette_library_dir = File.join(ROOT_PATH, 'spec', 'cassettes')
        config.hook_into :webmock
      end
    end # << self
  end # class
end
{{< / highlight >}}

So, in both your `fancy-web-api` and your new application, you are requiring your VCR cassettes like this in your `spec_helper.rb` (or similar):

{{< highlight ruby >}}
# frozen_string_literal: true
require 'fancy_web_api/vcr_testing'

VCR.configure do |config|
  FancyWebAPI::VCRTesting.configure!(config)
end
{{< / highlight >}}

### Specs usage

After calling `FancyWebAPI::VCRTesting.configure!` you should be able to use the cassettes like you would using the _normal_ VCR syntax, so assuming the `fancy-web-api` defined a cassette called: `https_create`, this will work:

{{< highlight ruby >}}
require 'spec_helper'

describe ClassUsingHTTPSCreate, type: :model do
  context 'when request is valid', vcr: { cassette_name: 'https_create' } do
    # Stuff happens here...
  end
end
{{< / highlight >}}

### Using your own cassettes while using other cassettes

Now, the tricky part comes when you're planning to use **both** your own cassettes and the ones defined in `fancy-web-api`. The answer is simple, _juggle_ `cassette_library_dir=`. What's the most elegant way to do so?

I personally would use `RSpec.configure` to define what I want to do, for example:

{{< highlight ruby >}}
def use_my_vcr
  VCR.configure do |config|
    # Configure my VCR accordingly
  end
end

def use_fancy_web_api_vcr
  VCR.configure do |config|
    FancyWebAPI::VCRTesting.configure!(config)
  end
end

RSpec.configure do |config|
  config.before(:all, :use_my_vcr) { use_my_vcr }
  config.before(:all, :use_fancy_web_api_vcr) { use_fancy_web_api_vcr }
end
{{< / highlight >}}
