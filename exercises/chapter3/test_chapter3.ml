open OUnit2
open Chapter3

(* Exercise: product test *)
let product_tests = "tests for product" >::: [
  "empty list" >:: (fun _ -> assert_equal 1 (product []));
  "one element" >:: (fun _ -> assert_equal 3 (product [3]));
  "multiple elements" >:: (fun _ -> assert_equal 6 (product [1;2;3]));
]

(* Exercise: concat *)
let concat_tests = "tests for concat" >::: [
  "empty list" >:: (fun _ -> assert_equal "" (concat []));
  "one element" >:: (fun _ -> assert_equal "Hello" (concat ["Hello"]));
  "multiple elemetns" >:: (fun _ -> assert_equal "Hello, world!" (concat ["Hello"; ", "; "world"; "!"]));
]

(* Exercise: patterns *)
let pattern1_tests = "tests for pattern1" >::: [
  "empty list" >:: (fun _ -> assert_equal false (pattern1 []));
  "exactly" >:: (fun _ -> assert_equal true (pattern1 ["bigred"]));
  "have more" >:: (fun _ -> assert_equal true (pattern1 ["bigred"; "bluebird"]));
  "not exactly" >:: (fun _ -> assert_equal false (pattern1 ["big"; "red"; "bigred"]))
]

let pattern2_tests = "tests for pattern2" >::: [
  "empty list" >:: (fun _ -> assert_equal false (pattern2 []));
  "two" >:: (fun _ -> assert_equal true (pattern2 [1;2]));
  "four" >:: (fun _ -> assert_equal true (pattern2 [1;2;3;4]))
]

let pattern3_tests = "tests for pattern3" >::: [
  "empty list" >:: (fun _ -> assert_equal false (pattern3 []));
  "exactly" >:: (fun _ -> assert_equal true (pattern3 [1;1;2]));
  "not exactly" >:: (fun _ -> assert_equal false (pattern3 [1])); 
]

(* Exercise: library *)
let fifth_tests = "tests for fifth" >::: [
  "enough" >:: (fun _ -> assert_equal 5 (fifth [1;2;3;4;5;6]));
  "not enough" >:: (fun _ -> assert_equal 0 (fifth [1;2;3]));
]

let sort_tests = "tests for sort" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (sort []));
  "one element" >:: (fun _ -> assert_equal [1] (sort [1]));
  "multiple elements" >:: (fun _ -> assert_equal [4;3;2;1] (sort [2;4;1;3]));
]

(* Exercise: library puzzle *)
let last_tests = "tests for last" >::: [
  "one element" >:: (fun _ -> assert_equal 1 (last [1]));
  "multiple elements" >:: (fun _ -> assert_equal 3 (last [1;2;3]));
]

let any_zero_tests = "tests for any_zero" >::: [
  "empty list" >:: (fun _ -> assert_equal false (any_zero []));
  "yes" >:: (fun _ -> assert_equal true (any_zero [1;0;2;0]));
  "no" >:: (fun _ -> assert_equal false (any_zero [1;2;3]))
]

(* Exercise: take drop *)
let take_tests = "tests for take" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (take 3 []));
  "enough" >:: (fun _ -> assert_equal [1;2;3] (take 3 [1;2;3;4;5]));
  "not enough" >:: (fun _ -> assert_equal [1;2;3] (take 5 [1;2;3]))
]

let drop_tests = "tests for drop" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (drop 3 []));
  "enough" >:: (fun _ -> assert_equal [4;5] (drop 3 [1;2;3;4;5]));
  "not enough" >:: (fun _ -> assert_equal [] (drop 5 [1;2;3]))
]

(* Exercise: take drop tail *)
let take_tr_tests = "tests for take_tr" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (take_tr 3 []));
  "enough" >:: (fun _ -> assert_equal [1;2;3] (take_tr 3 [1;2;3;4;5]));
  "not enough" >:: (fun _ -> assert_equal [1;2;3] (take_tr 5 [1;2;3]))
]

(* Exercise: unimodal *)
let is_unimodal_tests = "tests for is_unimodal" >::: [
  "empty list" >:: (fun _ -> assert_equal true (is_unimodal []));
  "constant list" >:: (fun _ -> assert_equal true (is_unimodal [1;1;1;1;1]));
  "exactly" >:: (fun _ -> assert_equal true (is_unimodal [1;2;3;2;1;0]));
  "increasing" >:: (fun _ -> assert_equal true (is_unimodal [1;2;3;4;5]));
  "decreasing" >:: (fun _ -> assert_equal true (is_unimodal [5;4;3;2;1]));
  "not exactly" >:: (fun _ -> assert_equal false (is_unimodal [1;3;0;4;5]))
]

(* Exercise: powerset *)
let powerset_tests = "tests for powerset" >::: [
  "empty list" >:: (fun _ -> assert_equal [[]] (powerset []));
  "one element" >:: (fun _ -> assert_equal [[]; [1]] (powerset [1]));
  "multiple elements" >:: (fun _ -> assert_equal [[]; [3]; [2]; [2; 3]; [1]; [1; 3]; [1; 2]; [1; 2; 3]] (powerset [1;2;3]));
]

(* Exercise: print int list rec *)
(* Exercise: print int list iter *)
(* I don't know how to test functions with side effects... *)

(* Exercise: student *)
let extract_name_tests = "tests for extract_name" >::: [
  "vinh" >:: (fun _ -> assert_equal ("Vincent", "Hong") (extract_name vinh))
]

let create_student_tests = "tests for create_student" >::: [
  "sarah" >:: (fun _ -> assert_equal {first_name="Sarah"; last_name="Bae"; gpa=4.} (create_student "Sarah" "Bae" 4.))
]

(* Exercise: pokerecord *)
(* No. Thera are no tests for this exercise *)

(* Exercise: safe hd and tl *)
let safe_hd_tests = "tests for safe_hd" >::: [
  "empty list" >:: (fun _ -> assert_equal None (safe_hd []));
  "multiple elements" >:: (fun _ -> assert_equal (Some 1) (safe_hd [1;2;3]))
]

let safe_tl_tests = "tests for safe_tl" >::: [
  "empty list" >:: (fun _ -> assert_equal None (safe_tl []));
  "multiple elements" >:: (fun _ -> assert_equal (Some [2;3]) (safe_tl [1;2;3]))
]

(* Exercise: pokefun *)
let pokefun_tests = "tests for pokefun" >::: [
  "empty list" >:: (fun _ -> assert_equal None (pokefun []));
  "one element" >:: (fun _ -> assert_equal (Some charizard) (pokefun [charizard]));
  "multiple elements" >:: (fun _ -> assert_equal (Some charizard) (pokefun [charizard; squirtle]))
]

(* Exercise: date before *)
let is_before_tests = "tests for is_before" >::: [
  "yes" >:: (fun _ -> assert_equal true (is_before (2022, 4, 27) (2023, 1, 2)));
  "no" >:: (fun _ -> assert_equal false (is_before (2022, 4, 27) (2022, 4, 1)))
]

(* Exercise: earliest date *)
let earliest_tests = "tests for earliest" >::: [
  "empty list" >:: (fun _ -> assert_equal None (earliest []));
  "one element" >:: (fun _ -> assert_equal (Some (2022, 4, 27)) (earliest [(2022, 4, 27)]));
  "multiple elements" >:: (fun _ -> assert_equal (Some (2022, 4, 27)) (earliest [
    (2023, 1, 1);
    (2022, 4, 27);
    (2022, 5, 2);
  ]))
]

(* Exercise: assoc list *)
(* Exercise: cards *)
(* Exercise: matching *)
(* Can you imagine there are any tests for these exercises? *)

(* Exercise: quadrant *)
let quadrant_tests = "tests for quadrant" >::: [
  "I" >:: (fun _ -> assert_equal (Some I) (quadrant (1, 1)));
  "II" >:: (fun _ -> assert_equal (Some II) (quadrant (-1, 1)));
  "III" >:: (fun _ -> assert_equal (Some III) (quadrant (-1, -1)));
  "IV" >:: (fun _ -> assert_equal (Some IV) (quadrant (1, -1)));
  "None" >:: (fun _ -> assert_equal None (quadrant (1, 0)))
]

(* Exercise: quadrant when *)
let quadrant_when_tests = "tests for quadrant_when" >::: [
  "I" >:: (fun _ -> assert_equal (Some I) (quadrant_when (1, 1)));
  "II" >:: (fun _ -> assert_equal (Some II) (quadrant_when (-1, 1)));
  "III" >:: (fun _ -> assert_equal (Some III) (quadrant_when (-1, -1)));
  "IV" >:: (fun _ -> assert_equal (Some IV) (quadrant_when (1, -1)));
  "None" >:: (fun _ -> assert_equal None (quadrant_when (1, 0)))
]

(* Exercise: depth *)
let depth_tests = "tests for depth" >::: [
  "Leaf" >:: (fun _ -> assert_equal 0 (depth Leaf));
  "Not empty" >:: (fun _ ->
    let t = Node {
      value = 2;
      left = Node {value=1; left=Node {value=3; left=Leaf; right=Leaf}; right=Leaf};
      right = Leaf;
    } in
    assert_equal 3 (depth t)
  );
]

(* Exercise: shape *)
let shape_tests = "tests for shape" >::: [
  "yes" >:: (fun _ ->
    let a = Node {value=1; left=Leaf; right=Leaf} in
    let b = Node {value=2; left=Leaf; right=Leaf} in
    assert_equal true (shape a b)
  );
  "no" >:: (fun _ ->
    let a = Node {value=1; left=Leaf; right=Leaf} in
    let b = Node {
      value = 2;
      left = Node {value=1; left=Node {value=3; left=Leaf; right=Leaf}; right=Leaf};
      right = Leaf;
    }
    in assert_equal false (shape a b))
]

(* Exercise: list max exn *)
(* Exercise: list max exn ounit *)
let list_max_tests = "tests for list_max" >::: [
  "empty list" >:: (fun _ -> assert_raises (Failure "list_max") (fun () -> list_max []));
  "one element" >:: (fun _ -> assert_equal 1 (list_max [1]));
  "multiple elements" >:: (fun _ -> assert_equal 3 (list_max [2; 1; 3; 0]))
]

(* Exercise: list max exn string *)
let list_max_string_tests = "tests for list_max_string" >::: [
  "empty list" >:: (fun _ -> assert_equal "empty" (list_max_string []));
  "one element" >:: (fun _ -> assert_equal "1" (list_max_string [1]));
  "multiple elements" >:: (fun _ -> assert_equal "3" (list_max_string [2; 1; 3; 0]))
]

(* Exercise: is_bst *)
let is_bst_tests = "tests for is_bst" >::: [
  "simply leaf" >:: (fun _ -> assert_equal true (is_bst Leaf));
  "one node" >:: (fun _ -> assert_equal true (is_bst (Node {value=(1,"one"); left=Leaf; right=Leaf})));
  "yes" >:: (fun _ ->
    let t = Node {
      value = (2, "two");
      left = Node {value=(1, "one"); left=Node {value=(0, "zero"); left=Leaf; right=Leaf}; right=Leaf};
      right = Node {value=(3, "three"); left=Leaf; right=Leaf}
    } in
    assert_equal true (is_bst t)
  );
    "no" >:: (fun _ ->
      let t = Node {
        value = (2, "two");
        left = Node {value=(1, "one"); left=Leaf; right=Node {value=(0, "zero"); left=Leaf; right=Leaf}};
        right = Node {value=(2, "two"); left=Leaf; right=Leaf}
      } in
      assert_equal false (is_bst t)
  );
]

(* Exercise: quadrant poly *)
let quadrant_poly_tests = "tests for quadrant_poly" >::: [
  "I" >:: (fun _ -> assert_equal (Some `I) (quadrant_poly (1, 1)));
  "II" >:: (fun _ -> assert_equal (Some `II) (quadrant_poly (-1, 1)));
  "III" >:: (fun _ -> assert_equal (Some `III) (quadrant_poly (-1, -1)));
  "IV" >:: (fun _ -> assert_equal (Some `IV) (quadrant_poly (1, -1)));
  "None" >:: (fun _ -> assert_equal None (quadrant (1, 0)))
]

(* All tests for exercises of chapter 3 *)
let tests = [
  product_tests;
  concat_tests;
  pattern1_tests;
  pattern2_tests;
  pattern3_tests;
  fifth_tests;
  sort_tests;
  last_tests;
  any_zero_tests;
  take_tests;
  drop_tests;
  take_tr_tests;
  is_unimodal_tests;
  powerset_tests;
  extract_name_tests;
  create_student_tests;
  safe_hd_tests;
  safe_tl_tests;
  pokefun_tests;
  is_before_tests;
  earliest_tests;
  quadrant_tests;
  quadrant_when_tests;
  depth_tests;
  shape_tests;
  list_max_tests;
  list_max_string_tests;
  quadrant_poly_tests;
  is_bst_tests;
]

let _ = List.iter run_test_tt_main tests
