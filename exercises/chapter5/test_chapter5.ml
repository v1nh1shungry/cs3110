open OUnit2
open Chapter5

(* Exercise: binary search tree map *)
let bstmap_tests =
  let open BstMap in
  let m = empty |> insert 1 "one" |> insert 3 "three" |> insert 2 "two" |> insert 4 "four" in
  "tests for BstMap" >::: [
    "look up existent element" >:: (fun _ -> assert_equal "two" (lookup 2 m));
    "look up non-existent element" >:: (fun _ -> assert_raises Not_found (fun () -> (lookup 5 m)));
    "bindings" >:: (fun _ -> assert_equal [(1, "one"); (2, "two"); (3, "three"); (4, "four")] (bindings m))
  ]

(* Exercise: fraction *)
(* Exercise: fraction reduced *)
let reduced_fraction_tests = "tests for ReducedFraction" >::: [
  "denominator is zero" >:: (fun _ -> assert_raises Division_by_zero (fun () -> (ReducedFraction.make 2 0)));
  "numerator" >:: (fun _ -> assert_equal 1 (ReducedFraction.numerator (ReducedFraction.make 1 3)));
  "denominator" >:: (fun _ -> assert_equal 2 (ReducedFraction.denominator (ReducedFraction.make 2 4)));
  "to_string" >:: (fun _ -> assert_equal "-1/2" (ReducedFraction.to_string (ReducedFraction.make 2 (-4))));
  "to_float" >:: (fun _ -> assert_equal 3. (ReducedFraction.to_float (ReducedFraction.make 6 2)));
  "add" >:: (fun _ -> assert_equal (ReducedFraction.make 1 2) (ReducedFraction.add (ReducedFraction.make 1 6) (ReducedFraction.make 1 3)));
  "mul" >:: (fun _ -> assert_equal (ReducedFraction.make 1 1) (ReducedFraction.mul (ReducedFraction.make 1 4) (ReducedFraction.make 4 1)))
]

(* Exercise: date order *)
let datemap_tests = "tests for DateMap" >::: [
  "bindings" >:: (fun _ -> assert_equal [({month=5; day=7}, 5.7); ({month=6; day=9}, 6.9)] (DateMap.empty |> DateMap.add {month=5; day=7} 5.7 |> DateMap.add {month=6; day=9} 6.9 |> DateMap.bindings));
]

(* Exercise: calendar *)
(* Exercise: print calendar *)
let calendar_tests = "tests for calendar and print_calendar" >::: [
  "create and print a calendar" >:: (fun _ -> assert_equal () (print_calendar DateMap.(empty |> add {month=3; day=26} "birthday" |> add {month=5; day=7} "Mother's day")));
]

(* Exercise: is for *)
let is_for_tests = "tests for is_for" >::: [
  "empty map" >:: (fun _ -> assert_equal CharMap.empty (is_for CharMap.empty));
  "map with elements" >:: (fun _ -> assert_equal CharMap.(empty |> add 'a' "a is for apple" |> add 'b' "b is for boy" |> add 'c' "c is for cat") (is_for CharMap.(empty |> add 'a' "apple" |> add 'b' "boy" |> add 'c' "cat")));
]

(* Exercise: first after *)
let first_after_tests =
  let c = DateMap.(empty |> add {month=3; day=26} "birthday" |> add {month=5; day=7} "Mother's day") in
  "tests for first_after" >::: [
    "exists" >:: (fun _ -> assert_equal "birthday" (first_after c {month=2; day=2}));
    "not exists" >:: (fun _ -> assert_raises Not_found (fun () -> first_after c {month=8; day=12}));
  ]

(* Exercise: sets *)
let sets_tests =
  let a = CaseInsensitiveStringSet.(empty |> add "grr" |> add "argh") in
  let b = CaseInsensitiveStringSet.(empty |> add "aRgh" |> add "GRR") in
  "tests for CaseInsensitiveStringSet" >::: [
    "textbook example 1" >:: (fun _ -> assert_equal true (CaseInsensitiveStringSet.equal a b));
    "textbook example 2" >:: (fun _ -> assert_equal a (CaseInsensitiveStringSet.add "gRr" a));
    "textbook example 3" >:: (fun _ -> assert_equal b (CaseInsensitiveStringSet.add "gRr" b))
  ]

(* Exercise: ToString *)
(* Exercise: Print *)
(* Exercise: Print Int *)
let print_int_tests = "tests for PrintInt" >::: [
  "no title" >:: (fun _ -> assert_equal () (PrintInt.print 10));
]

(* Exercise: Print String *)
let print_string_tests = "tests for PrintString" >::: [
  "no title" >:: (fun _ -> assert_equal () (PrintString.print "Hello, world!"));
]

(* Exercise: Print String reuse revisited *)
let string_with_print_tests = "tests for StringWithPrint" >::: [
  "print" >:: (fun _ -> assert_equal () (StringWithPrint.print "Hello, world!"));
  "lowercase_ascii" >:: (fun _ -> assert_equal "hello" (StringWithPrint.lowercase_ascii "HELLo"));
]

(* All tests *)
let _ = [
  bstmap_tests;
  reduced_fraction_tests;
  datemap_tests;
  calendar_tests;
  is_for_tests;
  first_after_tests;
  sets_tests;
  print_int_tests;
  print_string_tests;
  string_with_print_tests;
] |> List.iter run_test_tt_main
