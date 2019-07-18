---
date: "2019-07-17"
title: "Go Tool: ifacecodegen"
description: "ifacecodegen a tool generating middleware from interfaces."
url: /2019/07/17/golang-tools-ifacecodegen.html
---

Similar to [`counterfeiter`]({{< relref "2019-06-24-golang-counterfeiter.markdown" >}}) we use another tool called [**ifacecodegen**](https://github.com/fredipevcin/ifacecodegen) that allows us to automatically generate code from interface definitions using a Go template.

`ifacecodegen` is used to generate code that satisfies an interface type and wraps the existing type implementing said interface, think of middleware code that will be used for logging purposes (using [logurs](https://github.com/sirupsen/logrus)) or collecting metrics (using [NewRelic](https://github.com/newrelic/go-agent/releases)).

For example, assuming you have code that follows the DDD paradigm (where there's a _Repository/Data Store_ and some sort of _Service/Use Case_):

{{< highlight go >}}
// User ...
type User struct {
	Role string
}

// UserFinder finds an existing User from a remote data store.
type UserFinder interface {
	Find(id int64) (User, error)
}

// UserValidator determines if the requested user has specific roles.
type UserValidator struct {
	f UserFinder
}

// NewUserValidator ...
func NewUserValidator(f UserFinder) UserValidator {
	return UserValidator{f}
}

// IsAdmin determines if the user with the specified id is an admin.
func (v *UserValidator) IsAdmin(id int64) (bool, error) {
	u, _ := v.f.Find(id) // XXX error validation omitted
	if u.Role == "admin" {
		return true, nil
	}
	return false, nil
}

// IsGuest determines if the user with the specified id is a guest.
func (v *UserValidator) IsGuest(id int64) (bool, error) {
	u, _ := v.f.Find(id) // XXX error validation omitted
	if u.Role == "guest" {
		return true, nil
	}
	return false, nil
}
{{< / highlight >}}

And you're planning to add logging support to determine how long each method takes when calling the remote data store method, you would need to do two things:

1. Implement a template that does what your trying to achieve, and
1. Add a [`generate`](https://blog.golang.org/generate) directive for generating that file.

For the first thing, the template, the content of that one will look like:

{{< highlight go >}}
type logger{{ .Name }} struct {
  s {{ .Name }}
}

func NewLogger{{ .Name }}(s {{ .Name }}) {{ .Name }} {
  return &logger{{ .Name }}{
    s: s,
  }
}

{{ $ifaceRef := . }}
{{ range .Methods }}
  func (m *logger{{ $ifaceRef.Name }}) {{ .Name }}({{ input_parameters . }}) {{ $methodRef := . }}{{ output_parameters . }} {
    now := time.Now()
    defer func() {
      log.Printf("%s took %s", "{{ .Name }}", time.Since(now))
    }()

    {{ return . }} m.s.{{ .Name }}({{ input_calls . }})
  }
{{ end }}
{{< / highlight >}}

Last, Adding the following directive:

{{< highlight go >}}
//go:generate ifacecodegen -source main.go -template logger.tmpl -destination logger.gen.go -package main
{{< / highlight >}}

With the generated code we should be able to still satisfy the contract defined by `UserFinder` and add logging support!

```
$ ./ifacecodegen-example
2019/07/17 23:28:09 Find took 100.109011ms
2019/07/17 23:28:10 Find took 200.418756ms
```

Obviously this example is extremely simple but imagine the real human time you will save when you have hundreds of data store methods and you need to collect metrics for all them!

Feel free to browse the [complete program](https://gitlab.com/MarioCarrion/blog-examples/tree/master/2019/07/17) and play with it!

`ifacecodegen` is a simple yet powerful tool, highly recommended.

---

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
