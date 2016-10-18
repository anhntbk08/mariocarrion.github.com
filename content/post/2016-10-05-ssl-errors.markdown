---
date: 2016-10-05T00:00:00Z
description: Need something to get done? Do not update your computer
title: SSL issue with Rubygems
url: /2016/10/05/ssl-errors.html
---

I decided to update my working computer, in the morning today, wrong decision. After doing it I started getting the following errors after executing `bundle install`:

<pre>
Fetching source index from https://rubygems.org/
Retrying fetcher due to error (2/4): Bundler::Fetcher::CertificateFailureError Could not verify the SSL certificate for https://rubygems.org/.
There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To connect without using SSL, edit your Gemfile sources and change 'https' to 'http'.
Retrying fetcher due to error (3/4): Bundler::Fetcher::CertificateFailureError Could not verify the SSL certificate for https://rubygems.org/.
There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To connect without using SSL, edit your Gemfile sources and change 'https' to 'http'.
Retrying fetcher due to error (4/4): Bundler::Fetcher::CertificateFailureError Could not verify the SSL certificate for https://rubygems.org/.
There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To connect without using SSL, edit your Gemfile sources and change 'https' to 'http'.
Could not verify the SSL certificate for https://rubygems.org/.
There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA
certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To
connect without using SSL, edit your Gemfile sources and change 'https' to 'http'.
</pre>

Obviously this implied that everything related to rubygem was not working because `gem install bundler` was also throwing:

<pre>
ERROR:  Could not find a valid gem 'bundler' (>= 0), here is why:
Unable to download data from https://rubygems.org/ - SSL_connect returned=1 errno=0 state=error: certificate verify failed (https://api.rubygems.org/specs.4.8.gz)
</pre>

The SSL certificates on my work computer where obviously busted and because remote environments worked fine there was no blaming Rubygems this time. Google helped me find some possible answers:

1. Replace **https** with **http**
1. Manually download [the certificate](https://gist.github.com/luislavena/f064211759ee0f806c88#manual-solution-to-ssl-issue) and apply it
1. Use `rvm osx-ssl-certs update all`

I didn't even consider trying the first suggestion, obvious reasons; the second and third option did not work, so before going all nuclear I decided to try one last thing:

`brew install openssl`

And that fixed the whole thing! It only took me about 40 minutes to fix, what a waste of time. Fixing this issue retaught me two things:

1. Do you have something important to do today? **Do not** think about updating your computer.
1. Dockerize all your world, at least the problems will be reduced to something in the container, not your computer; most of the times.
