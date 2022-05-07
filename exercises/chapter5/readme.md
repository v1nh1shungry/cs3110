# Exercise: complex encapsulation

* **remove zero from the structure**: The value `zero` is required but not provided.
* **remove add from the signature**: The value `add` is required but not provided.
* **change zero in the structure to let zero = 0, 0**: val zero : int * int is not included in val zero : t

# Exercise: big list queue

Obviously, there are no standard answers for this exercise

# Exercise: big batched queue

Sure, there are no standard answers too. However, one thing is for sure, it must be faster than `ListQueue`. Since `fill_*queue` mainly use `enqueue`, and `BatchedQueue` makes this better than `ListQueue`.

# Exercise: queue efficiency

* **ListQueue**: `enqueue` is implemented by `@`, which will traverse the whole first list. So `@` is O(n). Then `enqueue` is O(n) too. So adding n elements to the queue takes time that is O(n^2).
* **BatchedQueue**: Whether `o` is empty or not, `enqueue` just cons the element to a list, which is O(1). So adding n elements to the queue takes time that is linear in n.

# Exercise: make char map

The following is picked from the `utop` output.

```ocaml
type key = char
type 'a t = 'a Map.Make(Char).t
val empty : 'a t
val add : key -> 'a -> 'a t -> 'a t
val remove : key -> 'a t -> 'a t
```

* **empty**: `'a` means the type of the value. `CharMap` maps `char` to `'a`.
* **add**: takes a value whose type is `key` aka `char`, a value whose type is `'a`, and a `CharMap` maps `char` to `'a`, and returns a `CharMap` maps `char` to `'a`.
* **remove**: takes a value whose type is `key` aka `char` and a `CharMap` maps `char` to `'a`, and returns a `CharMap` maps `char` to `'a`.

# Exercise: char ordered

The signature of `Map.OrderedType` (unofficial):

```ocaml
module type OrderedType = sig
  type t
  val compare : t -> t -> int
end
```

The following is part of the signature of `Char` (unofficial).

```ocaml
type t = char
val compare : t -> t -> int
```

Sorry, I think the [document](https://v2.ocaml.org/api/Char.html) is better than my words.

> Along with the type t, this function compare allows the module Char to be passed as argument to the functors Set.Make and Map.Make.

# Exercise: use char map

Try yourself :)

# Exercise: bindings

The following is picked from the [document](https://v2.ocaml.org/api/Map.S.html).

> Return the list of all bindings of the given map. The returned list is sorted in increasing order of keys with respect to the ordering Ord.compare, where Ord is the argument given to Stdlib.Map.Make.

So they all returns the same association list.

```ocaml
- : (char * int) list = [('x', 0); ('y', 1)]
- : (char * int) list = [('x', 0); ('y', 1)]
- : (char * int) list = [('x', 0); ('y', 1)]
```

# Exercise: Print Reuse

Well, with the functor `Print`, we can implement only the `to_string` for each type instead of writing `print` again and again. If `print` is much more complicated, more codes can be reused. That's it.

# Exercise: implementation without interface

```ocaml
# let d = make_date 3 26;;
val d : date = {month = 3; day = 26}
# string_of_int d.day;;
- : string = "26"
```

# Exercise: implementation with interface

Id.

# Exercise: implementation with abstracted interface

```ocaml
# let d = make_date 3 26;;
val d : date = <abstr>
# string_of_int d.day;;
Error: Unbound record field day
```

There are two differences.
* `utop` can't print the date any more. For `date` in the signature of `Date` is abstract, the inside of `date` is unknown to the outside world.
* We can't access the member of `Date` any more. For the same reason.

# Exercise: printer for dat

The following is the implementaton of `format`.

```ocaml
let format fmt d = Format.fprintf fmt "%s" (to_string d)
```

And you can see `utop` can print `Date` again, for we "tell" it how to.

```ocaml
# #install_printer format;;
# let d = make_date 3 26;;
val d : date = 3/26
```

# Exercise: refactor arith

The solution is [algebra_refactored.ml](algebra/algebra_refactored.ml). You can run [run_test.sh](algebra/run_test.sh) to see the differences between the origin and yours.