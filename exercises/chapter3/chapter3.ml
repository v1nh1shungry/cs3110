(* Exercise: product *)
let rec product = function [] -> 1 | h :: t -> h * product t

(* Exercise: concat *)
let rec concat = function [] -> "" | h :: t -> h ^ concat t

(* Exercise: patterns *)
let pattern1 = function "bigred" :: _ -> true | _ -> false

let pattern2 = function
  | [_; _] -> true
  | [_; _; _; _] -> true
  | _ -> false

let pattern3 = function [first; second; _] when first = second -> true | _ -> false

(* Exercise: library *)
let fifth l = if List.length l < 5 then 0 else List.nth l 4

let sort l = l |> List.sort Stdlib.compare |> List.rev

(* Exercise: library puzzle *)
let last l = l |> List.rev |> List.hd

let any_zero l = List.exists (fun x -> x = 0) l

(* Exercise: take drop *)
let rec take n = function
  | [] -> []
  | _ when n = 0 -> []
  | h :: t -> h :: take (n - 1) t

let rec drop n = function
  | [] -> []
  | l when n = 0 -> l
  | _ :: t -> drop (n - 1) t

(* Exercise: take drop tail *)
let take_tr n l =
  let rec take_aux n l acc =
    match l with
    | [] -> acc
    | _ when n = 0 -> acc
    | h :: t -> take_aux (n - 1) t (h :: acc)
  in List.rev (take_aux n l [])

(* Exercise: unimodal *)
let is_unimodal l =
  let rec is_unimodal_aux prev is_inc l =
    match l with
    | [] -> true
    | h :: t ->
        if (is_inc && prev <= h) || ((not is_inc) && h <= prev) then is_unimodal_aux h is_inc t
        else if (h < prev && is_inc) then is_unimodal_aux h false t
        else false
  in match l with
    | [] -> true
    | h :: t -> is_unimodal_aux h true t

(* Exercise: powerset *)
let rec powerset = function
  | [] -> [[]]
  | h :: t -> (powerset t) @ (List.map (fun l -> h :: l) (powerset t))

(* Exercise: print int list rec *)
let rec print_int_list = function
  | [] -> ();
  | h :: t ->
      print_int h;
      print_newline ();
      print_int_list t

(* Exercise: print int list iter *)
let print_int_list' l = List.iter (fun x -> print_int x; print_newline ()) l

(* Exercise: student *)
type student = {first_name : string; last_name : string; gpa : float}

let vinh = {first_name="Vincent"; last_name="Hong"; gpa=0.}

let extract_name {first_name=f; last_name=l; gpa=_} = (f, l)

let create_student f l g = {first_name=f; last_name=l; gpa=g}

(* Exercise: pokerecord *)
(* Ahh the author must be a fan of Pokemon :) *)
type poketype = Normal | Fire | Water

type pokemon = {name: string; hp: int; ptype: poketype}

let charizard = {name="charizard"; hp=78; ptype=Fire}

let squirtle = {name="squirtle"; hp=44; ptype=Water}

(* Exercise: safe hd and tl *)
let safe_hd l = if List.length l = 0 then None else Some (List.hd l)

let safe_tl l = if List.length l = 0 then None else Some (List.tl l)

(* Exercise: pokefun *)
let rec pokefun = function
  | [] -> None
  | h :: t -> begin
      match pokefun t with
      | None -> Some h
      | Some m -> if h.hp < m.hp then Some m else Some h
  end

(* Exercise: date before *)
let is_before (y1, m1, d1) (y2, m2, d2) =
  if y2 > y1 then true
  else if y1 = y2 && m2 > m1 then true
  else if y1 = y2 && m1 = m2 && d2 > d1 then true
  else false

(* Exercise: earliest date *)
let rec earliest = function
  | [] -> None
  | h :: t -> begin
      match earliest t with
      | None -> Some h
      | Some m -> if is_before m h then Some m else Some h
  end

(* Exercise: assoc list *)
let insert k v l = (k, v) :: l

let rec lookup k = function [] -> None | (k', v) :: t -> if k = k' then Some v else lookup k t

let assoc_list = insert 1 "one" (insert 2 "two" (insert 3 "three" []))

let two = lookup 2 assoc_list (* Supposed to be `Some "two"` *)

let four = lookup 4 assoc_list (* Supposed to be `None` *)

(* Exercise: cards *)
type suit = Club | Heart | Diamond | Spade
type rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten |
  Jack | Queen | King | Ace
type card = {suit: suit; rank: rank}

let ace_club = {suit=Club; rank=Ace}
let queen_heart = {suit=Heart; rank=Queen}
let two_diamond = {suit=Diamond; rank=Two}
let seven_spade = {suit=Spade; rank=Seven}

(* Exercise: matching *)
(* To be honest, I'm confused about what this exercise means *)
let answer = [None]

(* Exercise: quadrant *)
type quad = I | II | III | IV
type sign = Neg | Zero | Pos

let sign x =
  if x > 0 then Pos
  else if x = 0 then Zero
  else Neg

let quadrant (x, y) =
  match (sign x, sign y) with
  | (Pos, Pos) -> Some I
  | (Neg, Pos) -> Some II
  | (Neg, Neg) -> Some III
  | (Pos, Neg) -> Some IV
  | _ -> None

(* Exercise: quadrant when *)
let quadrant_when = function
  | (x, y) when x > 0 && y > 0 -> Some I
  | (x, y) when x < 0 && y > 0 -> Some II
  | (x, y) when x < 0 && y < 0 -> Some III
  | (x, y) when x > 0 && y < 0 -> Some IV
  | _ -> None

(* Exercise: depth *)
type 'a tree = Leaf | Node of 'a node
and 'a node = {value: 'a; left: 'a tree; right: 'a tree}

let rec depth = function
  | Leaf -> 0
  | Node {value=_; left=l; right=r} -> 1 + max (depth l) (depth r)

(* Exercise: shape *)
let rec shape a b =
  match (a, b) with
  | (Leaf, Leaf) -> true
  | (Leaf, _) -> false
  | (_, Leaf) -> false
  | (Node {value=_; left=l1; right=r1}, Node {value=_; left=l2; right=r2}) -> (shape l1 l2) && (shape r1 r2)

(* Exercise: list max exn *)
let rec list_max = function
  | [] -> failwith "list_max"
  | [x] -> x
  | x :: xs -> max x (list_max xs)

(* Exercise: list max exn string *)
let list_max_string = function [] -> "empty" | l -> string_of_int (list_max l)

(* Exercise: is_bst *)
let is_bst t =
  let less_than (k1, _) (k2, _) = if k1 < k2 then true else false in
  let rec is_bst_aux = function
    | Leaf -> `Empty
    | Node {value=v; left=l; right=r} ->
        match (is_bst_aux l, is_bst_aux r) with
        | (`No, _) -> `No
        | (_, `No) -> `No
        | (`Empty, `Empty) -> `Yes (v, v)
        | (`Yes (min, max), `Empty) -> if (less_than max v) then `Yes (min, v) else `No
        | (`Empty, `Yes (min, max)) -> if (less_than v min) then `Yes (v, max) else `No
        | (`Yes (lmin, lmax), `Yes (rmin, rmax)) ->
            if (less_than lmax v) && (less_than v rmin) then `Yes (lmin, rmax) else `No in 
  match is_bst_aux t with
  | `No -> false
  | _ -> true

(* Exercise: quadrant poly *)
let sign_poly x =
  if x > 0 then `Pos
  else if x = 0 then `Zero
  else `Neg

let quadrant_poly (x, y) =
  match (sign_poly x, sign_poly y) with
  | (`Pos, `Pos) -> Some `I
  | (`Neg, `Pos) -> Some `II
  | (`Neg, `Neg) -> Some `III
  | (`Pos, `Neg) -> Some `IV
  | _ -> None
