(* Exercise: mutable fields *)
type student = {name: string; mutable gpa: float}

(* Exercise: inc fun *)
let inc = ref (fun x -> x + 1)

(* Hey! Write down your onw version here, and remember to add some tests! *)
let inc_fun_res0 = !inc (3110 - 1)

(* Exercise: addition assignment *)
let ( +:= ) x y = x := !x + y

(* Exercise: norm *)
type vector = float array

let norm vec = Array.fold_left (fun acc x -> acc +. x *. x) 0. vec |> sqrt

(* Exercise: normalize *)
let normalize vec = let n = norm vec in Array.iteri (fun i v -> vec.(i) <- v /. n) vec

(* Exercise: norm loop *)
let norm_loop vec = let res = ref 0. in for i = 0 to (Array.length vec) - 1 do res := !res +. vec.(i) *. vec.(i) done; sqrt !res

(* Exercise: normalize loop *)
let normalize_loop vec = let n = norm_loop vec in for i = 0 to (Array.length vec) - 1 do vec.(i) <- vec.(i) /. n done

(* Exercise: init matrix *)
let init_matrix r c f = Array.init r (fun i -> Array.init c (fun j -> f i j))

(* Exercise: doubly linked list *)

(** An ['a node] is a node of a mutable doubly-linked list.
    It contains a value of type ['a] and optionally has
    pointers to previous and/or next nodes. *)
type 'a node = {
  mutable prev : 'a node option;
  mutable next : 'a node option;
  value : 'a
}

(** An ['a dlist] is a mutable doubly-linked list with elements
    of type ['a].  It is possible to access the first and
    last elements in constant time.
    RI: The list does not contain any cycles. *)
type 'a dlist = {
  mutable first : 'a node option;
  mutable last : 'a node option;
}

exception Invalid_doubly_linked_list

let empty () = {first = None; last = None}

let insert_first (lst : 'a dlist) (value : 'a) =
  match lst with
  | {first = None; last = None} -> let n = Some {prev = None; next = None; value} in lst.first <- n; lst.last <- n
  | {first = None; last = Some _} -> raise Invalid_doubly_linked_list
  | {first = Some _; last = None} -> raise Invalid_doubly_linked_list
  | {first = Some _; last = Some _} -> lst.first <- Some {prev = None; next = lst.first; value}

let insert_last (lst : 'a dlist) (value : 'a) =
  match lst with
  | {first = None; last = None} -> let n = Some {prev = None; next = None; value} in lst.first <- n; lst.last <- n
  | {first = None; last = Some _} -> raise Invalid_doubly_linked_list
  | {first = Some _; last = None} -> raise Invalid_doubly_linked_list
  | {first = Some _; last = Some _} -> lst.last <- Some {prev = lst.last; next = None; value}

(* To be continued *)
