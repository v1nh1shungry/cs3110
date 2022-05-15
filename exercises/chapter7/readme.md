# Exercise: refs

* **bool ref**
  ```ocaml
  ref true
  ```
* **int list ref**
  ```ocaml
  ref [1; 2; 3]
  ```
* **int ref list**
  ```ocaml
  [ref 1; ref 2; ref 3]
  ```

# Exercise: physical equality

```ocaml
let x = ref 0
let y = x
let z = ref 0

# x == y;;
- : bool = true
# x == z;;
- : bool = false
# x = y;;
- : bool = true
# x = z;;
- : bool = true
# x := 1;;
val x : int ref = {contents = 1}
# x = y;;
- : bool = true
# x = z;;
- : bool = false
```