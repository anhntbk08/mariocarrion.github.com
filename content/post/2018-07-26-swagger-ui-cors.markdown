---
date: 2018-07-26
title: "Go Tip: Swagger UI + CORS"
description: "How to use CORS with Swagger UI"
url: /2018/07/26/go-swagger-ui-cors.html
---

Previously I blogged about [using Dredd]({{< relref "2018-04-03-judge-go-swagger-with-dredd.markdown" >}}) for verifying that the generated `swagger.json` is correct, from the Swagger 2.0 specification perspective, now let's take a look at another tip for making sure the final API works correctly when using [Swagger UI](https://github.com/swagger-api/swagger-ui) for manual inspection.

There's a [full example](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2018/07/26) showing this in action, feel free to explore [the repo](https://gitlab.com/MarioCarrion/blog-examples).

---

It is most likely you already enabled CORS on your web API. One way to do it, if you happen to use [`gorilla/mux`](https://github.com/gorilla/mux), is to use [`gorilla/handlers`](https://github.com/gorilla/handlers), basically the [following code](https://gitlab.com/MarioCarrion/blog-examples/blob/master/2018/07/26/main.go#L47-51):

{{< highlight go >}}
headersOk := handlers.AllowedHeaders([]string{"X-Requested-With", "Authorization", "Content-Type"})
originsOk := handlers.AllowedOrigins([]string{"*"})
methodsOk := handlers.AllowedMethods([]string{http.MethodGet, http.MethodPost, http.MethodPut, http.MethodDelete, http.MethodOptions})

http.ListenAndServe(":8000", handlers.CORS(originsOk, headersOk, methodsOk)(r))
{{< / highlight >}}

Obviously more concrete values depend on your actual needs, specially for `AllowedOrigins`, but for testing purposes this works.

Notice that the headers in `AllowedHeaders` (`Authorization` and `Content-Type` (and `api_key`)) are the only [allowed headers to be sent by Swagger UI in your requests](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/cors.md#cors-and-header-parameters), without them **you won't be able** to test Authentication or make request from the UI, you will either be missing those headers or you will be getting the infamous error:

`Failed to load http://localhost:8000/users: No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:8080' is therefore not allowed access. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.`

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
