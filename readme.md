# Introduction

**My personal solutions** to the exercises in the [CS3110 textbook](https://cs3110.github.io/textbook/cover.html) **(Fall 2021 Edition)**.

The book is really a good textbook for getting started with either OCaml programming or functional programming. But......

> Solutions to exercises are available to students in Cornell’s CS 3110. Instructors at other institutions are welcome to contact Michael Clarkson for access.

and I could hardly find others' solutions. Huh......

**This project is updating as I'm learning this book and finishing the exercises.**

# Build & Run

```bash
.
├── exercises
│   ├── chapter3
│   │   ├── chapter3.ml
│   │   ├── dune
│   │   ├── dune-project
│   │   └── test_chapter3.ml
│   ├── chapter4
│   │   ├── chapter4.ml
│   │   ├── dune
│   │   ├── dune-project
│   │   ├── readme.md
│   │   └── test_chapter4.ml
│   └── chapter5
│       ├── algebra
│       │   ├── algebra.ml
│       │   ├── algebra_refactored.ml
│       │   └── run_test.sh
│       ├── chapter5.ml
│       ├── dune
│       ├── dune-project
│       ├── readme.md
│       └── test_chapter5.ml
└── readme.md
```

All the solutions are under **exercises/** by chapters. Each chapter will be a dune project. Take chapter4/ as an example,

* **chapter4.ml**: contains answers (mostly a function) to  exercises need codes in Chapter 4, labeled by topic through comments.
* **dune**: dune project file.
* **dune-project**: dune project file.
* **readme.md**: contains answers to exercises need explaining, explaining and explaining.
* **test_chapter4.ml**: contains unit tests for exercises in Chapter 4.

```bash
$ pwd
/path/to/cs3110
$ cd exercises/chapter4
$ dune exec ./test_chapter4.exe
```

will run the tests.

I write some tests for every exercise needs codes in test_chapter4.ml. There are no tests for exercises explaining something or playing with `utop`. You can just delete my codes and paste yours to chapter4.ml and then run the tests.

# Progress

* [ ] Chapter 2
* [X] Chapter 3
* [X] Chapter 4
* [x] Chapter 5
* [x] Chapter 6
* [ ] Chapter 7
* [ ] Chapter 8
* [ ] Chapter 9

# To be discussed

There are doubts about the following exercises, and I suspect there are more elegant solutions, so feel free to discuss.

There are some shothands,

* **WANTED**: A more elegant solution wanted.
* **NOT SURE**: I'm not quite sure what this exercise means.

## Chapter 3

* **WANTED**
  * Exercise: unimodal
  * Exercise: date before
  * Exercise: earliest date
  * Exercise: is_bst
* **NOT SURE**
  * Exercise: matching

## Chapter 4

* **WANTED**
  * The third sub-exercise of **Exercise: more list fun**
  * **Exercise: row vector add & Exercise: matrix add**: They both throw `Invalid_argument "List.map2"` which can be confusing.
  * **Exercise: matrix multiply**: The same thing, I didn't handle the exception quite well.
* NOT SURE
  * Exercise: account balance

## Chapter 5

* **WANTED**
  * Exercise: fraction reduced
  * **Exercise: refactor arith**: I haven't eliminated all duplication of `of_int`.

## Chapter 6

* **WANTED**
  * **Exercise: doubly linked list**: Guess what? I can't figure it out! Help wanted really, please!

# Please......

Since it is just my personal solutions, I can't guarantee the correctness of the answer. If you have any doubt about these codes, any discussions are welcomed.

Writing tests is really a boring job for me. For most of the practice questions these tests are enough, after all they are relatively simple. You can add more tests if you like (and issues and PRs welcomed, thanks).

I' m new to OCaml, so the way I organize the codes and tests might be very dummy. Sorry for that.
