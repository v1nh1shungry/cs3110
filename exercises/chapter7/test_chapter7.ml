open OUnit2
open Chapter7

(* Exercise: mutable fields *)
let student_tests = "tests for student" >::: [
  "textbook example" >:: (fun _ -> assert_equal 4. (let alice = {name="Alice"; gpa=3.7} in alice.gpa <- 4.; alice.gpa));
]

(* Exercise: inc fun *)
let inc_tests = "tests for inc fun" >::: [
  "answer 0" >:: (fun _ -> assert_equal 3110 inc_fun_res0);
]

(* Exercise: addition assignment *)
let addition_assignment_tests = "tests for +:=" >::: [
  "textbook example" >:: (fun _ -> assert_equal 3110 (let x = ref 0 in x +:= 3110; !x));
]

(* Exercise: norm *)
let norm_tests = "tests for norm" >::: [
  "no title" >:: (fun _ -> assert_equal 5. (norm [|3.; 4.|]));
]

(* Exercise: normalize *)
let normalize_tests = "tests for normalize" >::: [
  "no title" >:: (fun _ -> assert_equal [|0.6; 0.8|] (let v = [|3.; 4.;|] in (normalize v; v)));
]

(* Exercise: norm loop *)
let norm_loop_tests = "tests for norm_loop" >::: [
  "no title" >:: (fun _ -> assert_equal 5. (norm_loop [|3.; 4.|]));
]

(* Exercise: normalize loop *)
let normalize_loop_tests = "tests for normalize_loop" >::: [
  "no title" >:: (fun _ -> assert_equal [|0.6; 0.8|] (let v = [|3.; 4.;|] in (normalize_loop v; v)));
]

(* Exercise: init matrix *)
let init_matrix_tests = "tests for init_matrix" >::: [
  "row = 0 and col = 0" >:: (fun _ -> assert_equal [||] (init_matrix 0 0 ( + )));
  "row = 0 and col != 0" >:: (fun _ -> assert_equal [||] (init_matrix 0 3 ( + )));
  "row != 0 and col = 0" >:: (fun _ -> assert_equal [|[||]; [||]; [||]|] (init_matrix 3 0 ( + )));
  "row = 3 and col = 3" >:: (fun _ -> assert_equal
    [|
      [|0; 1; 2|];
      [|1; 2; 3|];
      [|2; 3; 4|]
    |]
    (init_matrix 3 3 ( + ))
  );
]

let _ = [
  student_tests;
  inc_tests;
  addition_assignment_tests;
  norm_tests;
  normalize_tests;
  norm_loop_tests;
  normalize_loop_tests;
  init_matrix_tests;
] |> List.iter run_test_tt_main
