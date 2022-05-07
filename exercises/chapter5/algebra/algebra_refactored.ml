module type Ring = sig
  type t
  val zero : t
  val one : t
  val ( + ) : t -> t -> t
  val ( ~- ) : t -> t
  val ( * ) : t -> t -> t
  val to_string : t -> string
  val of_int : int -> t
end

module type Field = sig
  include Ring
  val ( / ) : t -> t -> t
end

module Int = struct
  type t = int
  let zero = 0
  let one = 1
  let ( + ) = ( + )
  let ( ~- ) = ( ~- )
  let ( * ) = ( * )
  let ( / ) = ( / )
  let to_string = string_of_int
  let of_int n = n
end

module Float = struct
  type t = float
  let zero = 0.
  let one = 1.
  let ( + ) = ( +. )
  let ( ~- ) = ( ~-. )
  let ( * ) = ( *. )
  let ( / ) = ( /. )
  let to_string = string_of_float
  let of_int n = float_of_int n
end

module RingFunctor (M: Ring) = struct include M end
module FieldFunctor (M: Field) = struct include M end

module IntRing : Ring = RingFunctor(Int)
module IntField : Field = FieldFunctor(Int)

module FloatRing : Ring = RingFunctor(Float)
module FloatField : Field = FieldFunctor(Float)

module Rational (M: Field) = struct
  type t = M.t * M.t
  let zero = (M.zero, M.zero)
  let one = (M.one, M.one)
  let ( + ) (a, b) (c, d) = M.(((a * d) + (c * b), b * d))
  let ( ~- ) (a, b) = M.((-a, b))
  let ( / ) (a, b) (c, d) = M.((a * d, b * c))
  let ( * ) (a, b) (c, d) = M.((a * c, b * d))
  let to_string (a, b) = (M.to_string a) ^ "/" ^ (M.to_string b)
  let of_int n = (M.of_int n, M.one)
end

module IntRational : Field = Rational(IntField)
module FloatRational : Field = Rational(FloatField)
