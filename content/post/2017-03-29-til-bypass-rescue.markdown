---
date: 2017-03-29
title: "Today I learned: Bypass rescue"
description: "What is bypass_rescue?"
url: /2017/03/29/til-bypass-rescue.html
---

One of my job goals this sprint is to implement a new controller that internally uses our proprietary ACL and it is available **only** for what we call the _Super Admin Role_. Obviously this new code will have to be backed up by its own specs where we will be covering the two possible cases:

1. When a valid user has enough permissions (super admin) to access the action, and
1. When a valid user does not have enough permissions to access the action.

Depending on what you use for authentication you will do different things to _log in_ your user, but what is important is the actual section in the spec that tests both cases defined above. 

The easiest one to implement is obviously the case where the user is super admin, assuming we were testing the `show` method in the controller it would look something like this:

{{< highlight ruby >}}
describe 'GET show' do
  let(:user) { create(:user, :super_admin) }

  it 'has access' do
    get :show
    expect(response).to have_http_status(:success)
  end
end # GET show
{{< / highlight >}}

Our internal ACL works similar to [cancancan](https://github.com/CanCanCommunity/cancancan) where a [rescue_from](https://github.com/CanCanCommunity/cancancan#3-handle-unauthorized-access) is added to the main `ApplicationController` to render the _Access Denied_ page. Think of the following snippet:

{{< highlight ruby >}}
rescue_from AccessDenied do
  respond_to do |format|
    format.html { render 'access_denied' }
    format.js   { render 'access_denied' }
  end
end
{{< / highlight >}}

The _funny_ thing is that if you only replace the user with one with less permissions and practically copy/paste the spec from above your new test **will still pass** because although the user has no access, the final response still succeeds.

Enter [bypass_rescue](https://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/controller-specs/bypass-rescue), now if you rewrite your spec for testing your user permissions like this:

{{< highlight ruby >}}
describe 'GET show' do
  before { bypass_rescue }

  let(:user) { create(:user, :guest) }

  it 'has NO access' do
    expect { get :show }.to raise_error(AccessDenied)
  end
end # GET show
{{< / highlight >}}

**That** will really confirm your user has no access to the specific action in your controller.

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
