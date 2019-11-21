---
date: "2019-11-20"
title: "Go: Secure Configuration with Environment Variables and AWS SSM"
description: "Introducing a working Environment Variables plus AWS Systems Manager"
url: /2019/11/20/golang-aws-ssm-env-vars-package.html
---

About _~1.5 years ago_, I discussed about using [Environment Variables for configuration in Go]({{< relref "2018-01-31-go-env-variables.markdown" >}}), this is a continuation of that post, here I will be covering a paradigm we have been using (**successfully**) since then: getting remote values from a secure remote store via environment variables configuration.

----

Storing and retrieving secrets in a secure way is a fundamental step for any modern software, there are already well known vendors providing this kind service, for example [Hashicorp Vault](https://www.vaultproject.io/) or [AWS Systems Manager](https://aws.amazon.com/systems-manager/).

This paradigm has nothing to do with choosing a concrete vendor but more with how we interact with that said vendor to dynamically get the values we are supposed to get in a secure and easy way.

The way we define configuration values is via environment variables, the simplest example is defining credentials for some sort of data store, database credentials basically, something like the following:

* `DB_HOST="host.somewhere"`
* `DB_USERNAME="user.name"`
* `DB_PASSWORD="pass.word"`

The principal concern with this type of configuration is that those values are literally _open and clear_ to the environment that happens to be running the program that is going to be using those values. That is a security concern.

The paradigm consists, instead of doing that, in defining new environment variables with the same name but postfixed with `_SSM` which will contain a parameter value to be used for retrieving the remote values from the secure store:

* `DB_HOST_SSM="/service1/db/host"`
* `DB_USERNAME_SSM="/service1/db/username/"`
* `DB_PASSWORD_SSM="/service1/db/password`

So when running our program the environment variables will be defined as the ones above, but really the actual values of those variables will not be _open and clear_ but instead will be pulled securely from the remote store when the program requests those values.

All of this is wrapped in a package called [aws-ssm-env](https://github.com/MarioCarrion/aws-ssm-env), however the important thing is not the package itself but more the paradigm itself and how the interaction is defined when retrieving values from the remote store.

See [the example](https://github.com/MarioCarrion/aws-ssm-env/blob/master/examples/main.go) for more information:

{{< highlight go >}}
// Run it as:
// AWS_REGION=us-east1 go run examples/main.go
package main

import (
	"context"
	"fmt"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	awssession "github.com/aws/aws-sdk-go/aws/session"
	awsssm "github.com/aws/aws-sdk-go/service/ssm"

	awsssmenv "github.com/MarioCarrion/aws-ssm-env"
)

func main() {
	// XXX Error validation omitted
	session, _ := awssession.NewSession(&aws.Config{
		Region: aws.String(os.Getenv("AWS_REGION")),
	})

	ssm := awsssm.New(session)

	v := struct {
		Username string `ssm:"USER"`
	}{}

	// If USER_SSM is defined on the system we will contact AWS SSM to get
	// the remote value defined in this variable.
	// For example if USER_SSM is "/remote/user" then AWS SSM will be queried
	// using "/remote/user" and the result will be stored in "v.Username"

	if err := awsssmenv.Get(context.Background(), &v, ssm); err != nil {
		fmt.Println("Error", err)
	}

	fmt.Printf("%+v\n", v)
}
{{< / highlight >}}

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
