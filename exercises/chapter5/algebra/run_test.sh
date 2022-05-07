ocamlc -i algebra.ml > algebra.txt
ocamlc -i algebra_refactored.ml > algebra_refactored.txt

type "difft" >/dev/null 2>&1
if [ $? -eq 0 ]
then
  difft algebra.txt algebra_refactored.txt
else
  diff algebra.txt algebra_refactored.txt
fi

rm algebra.txt algebra_refactored.txt