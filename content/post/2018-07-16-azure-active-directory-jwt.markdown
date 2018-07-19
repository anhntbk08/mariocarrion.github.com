---
date: 2018-07-17
title: "Go Tip: Azure Active Directory + JWT"
description: "How to authenticate with Azure Active Directory and authorize with JWT"
url: /2018/07/16/azure-active-directory-jwt.html
---

Let's cover how to use [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/) (for authentication) and [JSON Web Tokens](https://jwt.io/introduction/) (for authorizing) your _enterprise_ users in Go!

By the way this is not your classic _How to use Go with JWT_ (search `golang jwt` on Google, or any other search engine for that) this is more focused on using specifically the actual `Azure Active Directory` service for getting _the_ JSON Web Token and **then** using that to authorize your API.

## Prerequisites

1. You understand what [JSON Web Tokens](https://en.wikipedia.org/wiki/JSON_Web_Token) and [OpenID Connect](https://en.wikipedia.org/wiki/OpenID_Connect) are.
1. If you don't have an Azure account, then [register!](https://portal.azure.com/), next make sure you activate the free account to properly have access to using Active Directory, don't forget to de-active it in 30 days or you will spend _moneys_!
1. [Register your application with your Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-protocols-openid-connect-code#register-your-application-with-your-ad-tenant), for the _Application type_ use _Web app / API_; make sure you read that link completely to understand the rationale behind the final Go example.

If this is your first time using Azure Active Directory, a few **really** important things to know:

* The _Sign-on URL_ is supposed to be the endpoint used for authorization, you can always change it.
* The _Tenant_ is the `xyz.onmicrosoft.com` name, you get that by going to _Azure Active Directory_, it's on the _Overview_  tab.

![Azure Active Directory Tenant](https://farm2.staticflickr.com/850/42594878945_16defbd0e9.jpg "Azure Active Directory Tenant")<a href="https://flic.kr/p/27TXTwz" target="_blank">image full size</a>

* To enable returning Security Groups information in the claims you have to edit the _Manifest_ and replace the value of `groupMembershipClaims` with `SecurityGroup`, basically this:

![Azure Active Directory Manifest](https://farm2.staticflickr.com/1810/41652034390_112470e4d8.jpg "Azure Azure Directory Manifest")<a href="https://flic.kr/p/26sDyFY" target="_blank">image full size</a>

* For testing purposes create a few users and a few groups (use `Security` type), add some users to the groups, make sure you write down those _Object IDs_, those will be used as parameters for our Go program.

## Taking it for a spin

Take a look at [the existing repository](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2018/07/16), the important bits are the following:

* [Getting the OpenID Connect Document from Azure](https://gitlab.com/MarioCarrion/blog-examples/blob/master/2018/07/16/main.go#L254-263), we will be using the result of that document [when decoding the JWT](https://gitlab.com/MarioCarrion/blog-examples/blob/master/2018/07/16/main.go#L275-278).
* [Parsing the JWT using the JSON Web Key Set](https://gitlab.com/MarioCarrion/blog-examples/blob/master/2018/07/16/main.go#L318-347) defined already in OpenID Connect document.
* This parsed JWT will give us the actual groups the user has access to, which then we can use [to authorize the specific endpoint](https://gitlab.com/MarioCarrion/blog-examples/blob/master/2018/07/16/main.go#L217-237).
* _Easy Peasy_!

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
