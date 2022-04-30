(* Exercise: twice, no arguments *)
(* Ahh, I don't know how to express it, so let's just skip it :) *)

(* Exercise: mystery operator 1 *)
(* Aha, interesting! It works just like the $ in Haskell.
   Because $ has a lower priority than function applications, 
   it makes function applications turns out to be right-associative. 
   For more information about the operator priority of OCaml you can refer to
   https://v2.ocaml.org/api/Ocaml_operators.html *)

(* Exercise: mystery operator 2 *)
(* Cool! It works just like the . in Haskell.
   It combines the functions.
   But just pay attention to its left-associative. *)

(* Exercise: repeat *)
let rec repeat f n x = if n = 0 then x else repeat f (n - 1) (f x)

(* Exercise: product *)
let product_left = List.fold_left (fun acc x -> acc *. x) 1.

let product_right lst = List.fold_right (fun x acc -> x *. acc) lst 1.

(* Exercise: terse product *)
let terse_product_left = ListLabels.fold_left ~f:( *. ) ~init:1.

let terse_product_right = ListLabels.fold_right ~f:( *. ) ~init:1.

(* Exercise: sum_cube_odd *)
(* Exercise: sum_cube_odd pipeline *)
(* Well, I used the pipeline at the beginning... *)
let rec ( -- ) i j = if i > j then [] else i :: i + 1 -- j

let sum_cube_odd n = 0 -- n |> List.filter (fun x -> x mod 2 = 1) |> List.map (fun x -> x * x * x) |> List.fold_left ( + ) 0

(* Exercise: exists *)
let rec exists_rec p = function [] -> false | h :: t -> p h || exists_rec p t

let exists_fold p = List.fold_left (fun acc x -> acc || p x) false

let exists_lib = List.exists

(* Exercise: account balance *)
let rec balance_rec init = function [] -> init | h :: t -> balance_rec (init -. h) t

let balance_left init = List.fold_left (fun acc x -> acc -. x) init

let balance_right init lst = List.fold_right (fun x acc -> acc -. x) lst init

(* Exercise: library uncurried *)
let uncurried_append (lst, x) = List.append lst x

let uncurried_compare (lhs, rhs) = Char.compare lhs rhs

let uncurried_max (lhs, rhs) = Stdlib.max lhs rhs

(* Exercise: map composition *)
let map_once f g = List.map (fun x -> f (g x))

(* Exercise: more list fun *)
let len_gt_three = List.filter (fun x -> String.length x > 3)

let add_one = List.map (( +. ) 1.)

let join strs sep =
  match strs with
  | [] -> ""
  | h :: t -> List.fold_left (fun acc x -> acc ^ sep ^ x) h t

(* Exercise: association list keys *)
let keys asslst = asslst |> List.map (fun (k, _) -> k) |> List.sort_uniq Stdlib.compare

(* Exercise: valid matrix *)
let is_valid_matrix = function
   | [] -> false
   | h :: t -> 0 <> List.fold_left (fun acc x -> if acc = List.length x then acc else 0) (List.length h) t

(* Exercise: row vector add *)
let add_row_vectors = List.map2 ( + )

(* Exercise: matrix add *)
let add_matrices = List.map2 add_row_vectors

(* Exercise: matrix multiply *)
let multiply_matrices lhs rhs =
   (* To be honest, I cheated here http://www.rosettacode.org/wiki/Matrix_transposition#OCaml *)
   let rec transpose_matrix m = if List.mem [] m then [] else List.map List.hd m :: transpose_matrix (List.map List.tl m) in
   let dot_product_row_vector = List.fold_left2 (fun acc x y -> acc + x * y) 0 in
   let transposed_rhs = transpose_matrix rhs in
   List.map (fun x -> List.map (dot_product_row_vector x) transposed_rhs) lhs
