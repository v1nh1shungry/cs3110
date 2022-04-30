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
│   └── chapter3
│       ├── chapter3.ml
│       ├── dune
│       ├── dune-project
│       └── test_chapter3.ml
└── readme.md
```

All the solutions are under **exercises/** by chapters. Each chapter will be a dune project. Take chapter3/ as an example,

* **chapter3.ml**: contains answers (mostly a function) to all exercises in Chapter 3, labeled by topic through comments.
* **dune**: dune project file.
* **dune-project**: dune project file.
* **test_chapter3.ml**: contains unit tests for exercises in Chapter 3.

```bash
$ pwd
/path/to/cs3110
$ cd exercises/chapter3
$ dune exec ./test_chapter3.exe
```

will run the tests.

I wrote some tests for every exercise if neccessary in test_chapter3.ml. So you can just delete my codes and paste yours to chapter3.ml and then run the tests.

# Progress

* [ ] Chapter 2
* [X] Chapter 3
* [X] Chapter 4
* [ ] Chapter 5
* [ ] Chapter 6
* [ ] Chapter 7
* [ ] Chapter 8
* [ ] Chapter 9

# To be discussed

There are doubts about the following exercises, and I suspect there are more elegant solutions, so feel free to discuss.

## Chapter 3

* **Exercise: unimodal** (A more elegant solution wanted)
* **Exercise: date before** (A more elegant solution wanted)
* **Exercise: earliest date**
* **Exercise: matching** (I'm not quite sure what this exercise means)
* **Exercise: is_bst** (A more elegant solution wanted)

## Chapter 4

* **Exercise: account balance** (I'm not sure what this exercise means)
* **Exercise: more list fun** (I mean the third sub-exercise. A more elegant solution wanted)
* **Exercise: row vector add** & **Exercise: matrix add** (They both throw `Invalid_argument "List.map2"` which can be confusing)
* **Exercise: matrix multiply** (The same thing, I didn't handle the exception quite well. And I wonder if this can be more elegant)

# Please......

Since it is just my personal solutions, I can't guarantee the correctness of the answer. If you have any doubt about these codes, any discussions are welcomed.

Writing tests is really a boring job for me. For most of the practice questions these tests are enough, after all they are relatively simple. You can add more tests if you like (and issues and PRs welcomed, thanks).

I' m new to OCaml, so the way I organize the codes and tests might be very dummy. Sorry for that.
