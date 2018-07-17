---
date: 2018-07-17
title: "Go Tip: Azure Active Directory + JWT"
description: "How to authenticate with Azure Active Directory and authorize with JWT"
url: /2018/07/16/azure-active-directory-jwt.html
---

Let's cover how to use [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/) (for authenticatication) and [JSON Web Tokens](https://jwt.io/introduction/) (for authorizing) your _enterprise_ users with Go!

By the way this is not your classic _How to use Go with JWT_ (search `golang jwt` on Google, or any other search engine for that) this is more focused on using specifically the actual `Azure Active Directory` service for getting _the_ JSON Web Token and **then** use that to authorize your API.

## Prerequisites

1. You understant what [JSON Web Tokens](https://en.wikipedia.org/wiki/JSON_Web_Token) and [OpenID Connect](https://en.wikipedia.org/wiki/OpenID_Connect) are.
1. If you don't have an Azure account, [register!](https://portal.azure.com/) then make sure you activate the free account to properly have access to using Active Directory, don't forget to de-active it in 30 days or you will spend _moneys_!
1. [Register your application with your AD tenant](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-protocols-openid-connect-code#register-your-application-with-your-ad-tenant), for the _Application type_ use _Web app / API_; make sure you read that link completely to understand the final Go example.

If this is your first time using Azure Active Directory, a few **really** important things to know:

* The _Sign-on URL_ is supposed to be the endpoint used for authorization, you can always change it.
* The _Object ID_ is also known as _Tenant_ in the documentation.
* To enable returning Security Groups information in the claims you have to edit the _Manifest_ and replace the value of `groupMembershipClaims` with `SecurityGroup`, basically this:

![Azure Active Directory Manifest](https://farm2.staticflickr.com/1810/41652034390_112470e4d8_b.jpg "Azure Active Directory Manifest")

* For testing purposes create a few users and a few groups (use `Security` type), add some users to the groups, make sure you write down those _Object IDs_, those will be used as parameters for our Go program.

## Taking it for a spin

The 

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
