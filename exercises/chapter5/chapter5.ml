(* Exercise: complex synonym *)
module type ComplexSig = sig
  type t = float * float
  val zero : t
  val add : t -> t -> t
end

(* Exercise: binary search tree map *)
module type Map = sig
  type ('k, 'v) t
  val empty : ('k, 'v) t
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  val lookup : 'k -> ('k, 'v) t -> 'v
  val bindings : ('k, 'v) t -> ('k * 'v) list
end

module BstMap : Map = struct
  type ('k, 'v) t = Leaf | Node of {key: 'k; value: 'v; left: ('k, 'v) t; right: ('k, 'v) t}
  let empty = Leaf
  let rec insert k v = function
    | Leaf -> Node {key = k; value = v; left = Leaf; right = Leaf}
    | Node {key; value; left; right} ->
        if k = key then Node {key; value = v; left; right}
        else if k < key then Node {key; value; left = insert k v left; right}
        else Node {key; value; left; right = insert k v right}
  let rec lookup k = function
    | Leaf -> raise Not_found
    | Node {key; value; left; right} ->
        if k = key then value
        else if k < key then lookup k left
        else lookup k right
  let bindings m =
    let rec bindings_aux m acc =
      match m with
      | Leaf -> acc
      | Node {key; value; left; right} ->
          let right_acc = bindings_aux right acc in
          let mid_acc = (key, value) :: right_acc in
          bindings_aux left mid_acc
    in bindings_aux m []
end

(* Exercise: fraction *)
module type Fraction = sig
  type t
  val make : int -> int -> t
  val numerator : t -> int
  val denominator : t -> int
  val to_string : t -> string
  val to_float : t -> float
  val add : t -> t -> t
  val mul : t -> t -> t
end

(* Exercise: fraction reduced *)
module ReducedFraction : Fraction = struct
  type t = int * int
  let rec gcd x y =
    if x = 0 then y
    else if (x < y) then gcd (y - x) x
    else gcd y (x - y)
  let reduce n d =
    let nd_gcd = gcd (abs n) (abs d) in
    (n / nd_gcd, d / nd_gcd)
  let make n d = 
    if d = 0 then raise Division_by_zero
    else if d < 0 then reduce (-n) (-d)
    else reduce n d
  let numerator = fst
  let denominator = snd
  let to_string (n, d) = (string_of_int n) ^ "/" ^ (string_of_int d)
  let to_float (n, d) = (float_of_int n) /. (float_of_int d)
  let add (n1, d1) (n2, d2) = reduce (n1 * d2 + n2 * d1) (d1 * d2)
  let mul (n1, d1) (n2, d2) = reduce (n1 * n2) (d1 * d2)
end

(* Exercise: date order *)
type date = {month : int; day : int}

module Date = struct
  type t = date
  let compare {month=m1; day=d1} {month=m2; day=d2} =
    if m1 < m2 then -1
    else if m1 = m2 && d1 < d2 then -1
    else if m1 = m2 && d1 = d2 then 0
    else 1
end

module DateMap = Map.Make(Date)

(* Exercise: calendar *)
type calendar = string DateMap.t

(* Exercise: print calendar *)
let print_calendar = DateMap.iter (fun {month; day} event -> Printf.printf "%d.%d: %s\n" month day event)

(* Exercise: is for *)
module CharMap = Map.Make(Char)

let is_for = CharMap.mapi (fun k v -> Printf.sprintf "%c is for %s" k v)

(* Exercise: first after *)
let first_after c d = DateMap.find_first (fun x -> (Date.compare x d) > 0) c |> snd

(* Exercise: sets *)
module CaseInsensitiveString = struct
  type t = string
  let compare lhs rhs = String.compare (String.lowercase_ascii lhs) (String.lowercase_ascii rhs)
end

module CaseInsensitiveStringSet = Set.Make(CaseInsensitiveString)

(* Exercise: ToString *)
module type ToString = sig
  type t
  val to_string : t -> string
end

(* Exercise: Print *)
module Print (M: ToString) = struct
  let print = fun x -> print_string (M.to_string x)
end

(* Exercise: Print Int *)
module Int = struct
  type t = int
  let to_string = string_of_int
end

module PrintInt = Print(Int)

(* Exercise: Print String *)
module MyString = struct
  type t = string
  let to_string = Fun.id
end

module PrintString = Print(MyString)

(* Exercise: Print String reuse revisited *)
module StringWithPrint = struct
  include String
  include PrintString
end
