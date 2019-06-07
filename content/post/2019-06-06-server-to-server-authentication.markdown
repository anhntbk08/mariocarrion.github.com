---
date: 2019-06-06
title: "Go Tip: Server to Server Authentication + Azure Active Directory"
description: "Server to Server calls with Azure Active Directory using client secrets"
url: /2019/06/06/server-to-server-authentication-azure-active-directory.html
---

Last time we used Azure Active Directory for [authenticating real users]({{< relref "2018-07-16-azure-active-directory-jwt.markdown" >}}), this time let's do something similar but instead of doing it for real users let's do it for Server Side authentication, basically allow one service authenticate with another one, server side, thanks to Azure Active Directory.

# Prerequisites

* You have already a working service that uses Azure Active Directory for Authentication, this is the service we are going to connect to, this is **the server**, make sure you have its `Application ID`
* You are familiar with [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/), so you can follow the setup instructions below

# Setting it up

* Similar to the **server**, register a new `Azure Active Directory`, there's no need to input a _Redirect URI_, this is **the client**
* Edit that newly created app, go to the `Certificates & secrets` section (on the left side), and add a _New client secret_ save this value somewhere, this is **the secret**

![Azure Active Directory Secrets](https://live.staticflickr.com/65535/48016699793_bc12325c23.jpg "Azure Active Directory Secret")<a href="https://flic.kr/p/2ga58Yn" target="_blank">image full size</a>

For allowing everything to work we will need three things:

* `resource`: **the server** `Application (client) ID`,
* `client_id`: **the client** `Application (client) ID`, and
* `client_secret`: **the client** secret (value from`Certificates & secret`).

## Taking it for a spin

Take a look at [the existing repository](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2019/06/06), the important bits are the following:

* [The Server](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2019/06/06/server), similar to the [other one](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2018/07/16) except this one does not consider the GUIDs.
* [The Client](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2019/06/06/client), uses the `Service-to-service access token request` workflow to request for posting the request to **the server**
* _Easy Peasy_!

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
