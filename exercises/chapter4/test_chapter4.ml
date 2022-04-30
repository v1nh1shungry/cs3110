open OUnit2
open Chapter4

(* Exercise: twice, no arguments *)
(* Exercise: mystery operator 1 *)
(* Exercise: mystery operator 2 *)
(* No, there are no tests for them *)

(* Exercise: repeat *)
let repeat_tests = 
  let f x = x * x in
  let x = 2 in
  "tests for repeat" >::: [
    "zero times" >:: (fun _ -> assert_equal 2 (repeat f 0 x));
    "two times" >:: (fun _ -> assert_equal 16 (repeat f 2 x));
  ]

(* Exercise: product *)
let product_left_tests = "tests for product_left" >::: [
  "empty list" >:: (fun _ -> assert_equal 1. (product_left []));
  "one element" >:: (fun _ -> assert_equal 3. (product_left [3.]));
  "multiple elements" >:: (fun _ -> assert_equal 6. (product_left [1.;2.;3.]))
]

let product_right_tests = "tests for product_right" >::: [
  "empty list" >:: (fun _ -> assert_equal 1. (product_right []));
  "one element" >:: (fun _ -> assert_equal 3. (product_right [3.]));
  "multiple elements" >:: (fun _ -> assert_equal 6. (product_right [1.;2.;3.]))
]

(* Exercise: terse product *)
let terse_product_left_tests = "tests for terse_product_left" >::: [
  "empty list" >:: (fun _ -> assert_equal 1. (terse_product_left []));
  "one element" >:: (fun _ -> assert_equal 3. (terse_product_left [3.]));
  "multiple elements" >:: (fun _ -> assert_equal 6. (terse_product_left [1.;2.;3.]))
]

let terse_product_right_tests = "tests for terse_product_right" >::: [
  "empty list" >:: (fun _ -> assert_equal 1. (terse_product_right []));
  "one element" >:: (fun _ -> assert_equal 3. (terse_product_right [3.]));
  "multiple elements" >:: (fun _ -> assert_equal 6. (terse_product_right [1.;2.;3.]))
]

(* Exercise: sum_cube_odd *)
(* Exercise: sum_cube_odd pipeline *)
let sum_cube_odd_tests = "tests for sum_cube_odd" >::: [
  "0" >:: (fun _ -> assert_equal 0 (sum_cube_odd 0));
  "3" >:: (fun _ -> assert_equal 28 (sum_cube_odd 3));
]

(* Exercise: exists *)
let exists_rec_tests =
  let p = fun x -> x mod 2 = 0 in
  "tests for exists_rec" >::: [
    "empty list" >:: (fun _ -> assert_equal false (exists_rec p []));
    "one element" >:: (fun _ -> assert_equal true (exists_rec p [2]));
    "multiple elements" >:: (fun _ -> assert_equal true (exists_rec p [1; 3; 2; 1]))
  ]

let exists_fold_tests =
  let p = fun x -> x mod 2 = 0 in
  "tests for exists_fold" >::: [
    "empty list" >:: (fun _ -> assert_equal false (exists_fold p []));
    "one element" >:: (fun _ -> assert_equal true (exists_fold p [2]));
    "multiple elements" >:: (fun _ -> assert_equal true (exists_fold p [1; 3; 2; 1]))
  ]

let exists_lib_tests =
  let p = fun x -> x mod 2 = 0 in
  "tests for exists_lib" >::: [
    "empty list" >:: (fun _ -> assert_equal false (exists_lib p []));
    "one element" >:: (fun _ -> assert_equal true (exists_lib p [2]));
    "multiple elements" >:: (fun _ -> assert_equal true (exists_lib p [1; 3; 2; 1]))
  ]

(* Exercise: account balance *)
let balance_rec_tests = "tests for balance_rec" >::: [
  "empty list" >:: (fun _ -> assert_equal 10. (balance_rec 10. []));
  "one element" >:: (fun _ -> assert_equal 5. (balance_rec 10. [5.]));
  "multiple elements" >:: (fun _ -> assert_equal 4. (balance_rec 10. [3.; 2.; 1.]))
]

let balance_left_tests = "tests for balance_left" >::: [
  "empty list" >:: (fun _ -> assert_equal 10. (balance_left 10. []));
  "one element" >:: (fun _ -> assert_equal 5. (balance_left 10. [5.]));
  "multiple elements" >:: (fun _ -> assert_equal 4. (balance_left 10. [3.; 2.; 1.]))
]

let balance_right_tests = "tests for balance_right" >::: [
  "empty list" >:: (fun _ -> assert_equal 10. (balance_right 10. []));
  "one element" >:: (fun _ -> assert_equal 5. (balance_right 10. [5.]));
  "multiple elements" >:: (fun _ -> assert_equal 4. (balance_right 10. [3.; 2.; 1.]))
]

(* Exercise: library uncurried *)
let uncurried_append_tests = "tests for uncurried_append" >::: [
  "mo title" >:: (fun _ -> assert_equal [1;2;3;4] (uncurried_append ([1;2], [3;4])));
]

let uncurried_compare_tests = "tests for uncurried_compare" >::: [
  "equal" >:: (fun _ -> assert_equal 0 (uncurried_compare ('!', '!')));
  "lhs < rhs" >:: (fun _ -> assert_equal (-1) (uncurried_compare ('a', 'b')));
  "lhs > rhs" >:: (fun _ -> assert_equal 32 (uncurried_compare ('a', 'A')))
]

let uncurried_max_tests = "tests for uncurried_max" >::: [
  "no title" >:: (fun _ -> assert_equal 3 (uncurried_max (1, 3)))
]

(* Exercise: map composition *)
let map_once_tests =
  let map_twice f g lst = List.map f (List.map g lst) in
  let f = string_of_int in
  let g = fun x -> x * x in
  "tests for map_once" >::: [
    "empty list" >:: (fun _ -> assert_equal (map_twice f g []) (map_once f g []));
    "one element" >:: (fun _ -> assert_equal (map_twice f g [3]) (map_once f g [3]));
    "multiple elements" >:: (fun _ -> assert_equal (map_twice f g [5;4;3;1]) (map_once f g [5;4;3;1]))
  ]

(* Exercise: more list fun *)
let len_gt_three_tests = "tests for len_gt_three" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (len_gt_three []));
  "one element" >:: (fun _ -> assert_equal [] (len_gt_three ["j"]));
  "multiple elements" >:: (fun _ -> assert_equal ["hello"; "world"] (len_gt_three ["a"; "hello"; "bye"; "world"]))
]

let add_one_tests = "tests for add_one" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (add_one []));
  "one element" >:: (fun _ -> assert_equal [2.] (add_one [1.]));
  "multiple elements" >:: (fun _ -> assert_equal [2.;3.;4.] (add_one [1.;2.;3.]))
]

let join_tests = "tests for join" >::: [
  "empty list" >:: (fun _ -> assert_equal "" (join [] ", "));
  "one element" >:: (fun _ -> assert_equal "Hello" (join ["Hello"] ", "));
  "multiple elements" >:: (fun _ -> assert_equal "Hello, new, world" (join ["Hello";"new";"world"] ", "))
]

(* Exercise: association list keys *)
let keys_tests = "tests for keys" >::: [
  "empty list" >:: (fun _ -> assert_equal [] (keys []));
  "one element" >:: (fun _ -> assert_equal [1] (keys [(1, "one")]));
  "multiple elements" >:: (fun _ -> assert_equal [1;2;3] (keys [
    (1, "one"); (2, "two"); (3, "three"); (2, "to")
  ]))
]

(* Exercise: valid matrix *)
let is_valid_matrix_tests = "tests for is_valid_matrix" >::: [
  "empty list" >:: (fun _ -> assert_equal false (is_valid_matrix []));
  "1 x 1" >:: (fun _ -> assert_equal true (is_valid_matrix [[1]]));
  "3 x 2" >:: (fun _ -> assert_equal true (is_valid_matrix [[1;2;3];[4;5;6]]));
  "invalid" >:: (fun _ -> assert_equal false (is_valid_matrix [[1;2;3];[4]]))
]

(* Exercise: row vector add *)
let add_row_vectors_tests = "tests for add_row_vectors" >::: [
  "same size" >:: (fun _ -> assert_equal [5;7;9] (add_row_vectors [1;2;3] [4;5;6]));
]

(* Exercise: matrix add *)
let add_matrices_tests = "tests for add_matrices" >::: [
  "same size" >:: (fun _ -> assert_equal [[2;3;4];[5;6;7]] (add_matrices [[1;2;3];[4;5;6]] [[1;1;1];[1;1;1]]));
]

(* Exercise: matrix multiply *)
let multiply_matrices_tests = "tests for multiply_matrices" >::: [
  "no title" >:: (fun _ ->
    let lhs = [[1;2;3]; [4;5;6]] in
    let rhs = [[7;8]; [9;10]; [11;12]] in
    let res = [[58;64]; [139;154]] in
    assert_equal res (multiply_matrices lhs rhs))
]

(* All tests for Chapter 4 *)
let tests = [
  repeat_tests;
  product_left_tests;
  product_right_tests;
  terse_product_left_tests;
  terse_product_right_tests;
  sum_cube_odd_tests;
  exists_rec_tests;
  exists_fold_tests;
  exists_lib_tests;
  balance_rec_tests;
  balance_left_tests;
  balance_right_tests;
  uncurried_append_tests;
  uncurried_compare_tests;
  uncurried_max_tests;
  map_once_tests;
  len_gt_three_tests;
  add_one_tests;
  join_tests;
  keys_tests;
  is_valid_matrix_tests;
  add_row_vectors_tests;
  add_matrices_tests;
  multiply_matrices_tests;
]

let _ = List.iter run_test_tt_main tests
