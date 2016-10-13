---
date: 2015-05-12T00:00:00Z
description: Are you wondering how to test that a particular method invokes something
  as a requirement?
image: ruby.png
image_facebook: ruby-facebook.png
published: true
status: publish
title: 'Tip: RSpec spies'
url: /2015/05/12/rspec-spies/
---

[RSpec's spies](https://relishapp.com/rspec/rspec-mocks/docs/basics/spies) are a cool thing for testing a message was received after invoking certain method. Like for example to make sure our [Service](https://netguru.co/blog/service-objects-in-rails-will-help) that implements [Wisper](https://github.com/krisleech/wisper) is always subscribing to certain listener.

Also, if you're not familiar with Wisper, make sure to check it out, is a cool way to implement Publish-Subscribe capabilities, really awesome.

Anyways, let's assume we want to test the create method in our controller, and its implementation is something like this:

{{< highlight ruby >}}
def create
  service = MyCustomService.new(params)
  service.subscribe(MySubscriber.new)
  
  # I do whatever I have to do in after this
end
{{< / highlight >}}

In create we want to make sure our service always subscribes to ```MySubscriber```. How do we test this?

{{< highlight ruby >}}
describe 'Service is subscribing to' do
  context 'MySubscriber' do
    let!(:service_double) {
      service_double = double('service')
      allow(service_double).to receive(:subscribe)
      allow(MyCustomService.new).to receive(:new).and_return(service_double)
      service_double
    }

    let!(:subscriber_double) {
      subscriber_double = instance_double(MySubscriber)
      allow(MySubscriber).to receive(:new).and_return(subscriber_double)
      subscriber_double
    }

    it 'on create' do
      my_model = FactoryGirl.build(:my_model)

      post :create, model: my_model.attributes

      expect(service_double).to have_received(:subscribe).with(subscriber_double)
    end
  end
end
{{< / highlight >}}

What the above spec means is the following:

1. ```let!(service_double)```: We create a [double](https://www.relishapp.com/rspec/rspec-mocks/docs) of ```MyCustomService```, we mock ```subscribe``` to allow spying on it and we make sure the ```new``` method in our service class always returns this double.
2. ```let!(:subscriber_double)```: We create in [instance double](https://www.relishapp.com/rspec/rspec-mocks/v/3-2/docs/verifying-doubles/using-an-instance-double) and similar to our ```MyCustomService``` mocking, we mock ```MySubscriber#new``` to return this double. The idea is that we can confirm the subscribe was called with this particular instance.
3. Finally ```expect(service_double).to have_received(:subscribe).with(subscriber_double)```: This is what closes the deal in our test, we are basically saying: *my mocked service called subscribe and it actually included my mocked subscriber* AKA **my create is subscribing to my listener**.

Pretty cool stuff to enforce certain requirements in specific methods.
