---
date: 2018-08-06
title: "Go Tip: Generating JSON Web Key Sets"
description: "How to use generate JSON Web Key Sets"
url: /2018/08/06/go-generating-json-web-key-sets.html
---

Previously I blogged about [using ActiveDirectory and JWT]({{< relref "2018-07-16-azure-active-directory-jwt.markdown" >}}) with Go, well this quick tip is somehow related to that post, it's for generating JSON Web Key Sets that should help for creating a _real_ valid JSON or for testing local-only values.

There's a [full example](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2018/08/06) showing this in action, feel free to explore [the repo](https://gitlab.com/MarioCarrion/blog-examples).

---

This example uses the great [go-jose](https://github.com/square/go-jose/tree/v2.1.7) package by [Square](http://square.github.io/), the final snippet code [looks like this](https://gitlab.com/MarioCarrion/blog-examples/blob/master/2018/08/06/main.go#L39-68):


{{< highlight go >}}
func generateJWTWithKeyID() *jose.JSONWebKeySet {
	rsaKey, _ := rsa.GenerateKey(rand.Reader, 2048)           // XXX Check err
	serialNumber, _ := rand.Int(rand.Reader, big.NewInt(100)) // XXX Check err

	template := x509.Certificate{
		SerialNumber: serialNumber,
		Subject: pkix.Name{
			Organization: []string{"Example Co"},
		},
		NotBefore:             time.Now(),
		NotAfter:              time.Now().Add(2 * time.Hour),
		KeyUsage:              x509.KeyUsageKeyEncipherment | x509.KeyUsageDigitalSignature,
		ExtKeyUsage:           []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth},
		BasicConstraintsValid: true,
	}

	derBytes, _ := x509.CreateCertificate(rand.Reader, &template, &template, &rsaKey.PublicKey, rsaKey) // XXX Check err
	certificate, _ := x509.ParseCertificate(derBytes)                                                   // XXX Check err

	return &jose.JSONWebKeySet{
		Keys: []jose.JSONWebKey{
			{
				Certificates: []*x509.Certificate{certificate},
				Key:          &rsaKey.PublicKey,
				KeyID:        "someKeyID",
				Use:          "sig",
			},
		},
	}
}
{{< / highlight >}}

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
