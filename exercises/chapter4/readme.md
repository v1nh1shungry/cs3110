# Exercise: twice, no arguments

Ahh, I have no idea how to express it, so let's just skip it :)

# Exercise: mystery operator 1

Aha, interesting! It works just like the `$` in Haskell. Because `$` has a lower priority than function application, it makes function application turns out to be right-associative. Suppose we have these functions,

```ocaml
let foo x = x + 1
let bar x = x * 2
```

We want to apply 10 to `bar` first then apply the result  to `foo`. What happens if we implement it this way?

```ocaml
foo bar 10
```

Obviously, for function application is left-associative, things go against our wishes. `bar` will be applied to `foo` first. Boom!

```
Error: This function has type int -> int
       It is applied to too many arguments; maybe you forgot a `;'.
```

However, if we use `$` above,

```ocaml
foo $ bar 10
```

Everything is okay. Why? Let's make it more clear. There're two points.

* `$` is a infix operator.
* `$` owns a lower priority than function application.

As a result, things will work out like this

```ocaml
( $ ) foo (bar 10)
```

instead of

```ocaml
( $ ) (foo bar) 10
```

For more information about the operator priority of OCaml you can refer to https://v2.ocaml.org/api/Ocaml_operators.html.

# Exercise: mystery operator 2

Cool! It works just like the `.` in Haskell. It composes functions. Just pay attention to its right-associative, which guarantees the right-most function will be executed first.