(* Programming Languages: Section 4 - Signatures and Hiding Things *)

(*
If we leave out signature from definition, it cannot be accessed from the outside.
This helps us to manage code by implicitly having private and public functions.

Example:
if we would leave out `val double : int -> int` signature from the MATHLIB,
we would get a error when using this function bellow in `val twenty_eight = ...`
*)
signature MATHLIB =
sig
    val fact : int -> int
    val half_pi : real
    val double : int -> int
end

structure MyMathLib :> MATHLIB = 
struct 

fun fact x = 
    if x = 0
    then 1
    else x * fact (x-1)

val half_pi = Math.pi / 2.0

fun doubler y = y + y

end

val pi = MyMathLib.half_pi + MyMathLib.half_pi

val twenty_eight = MyMathLib.doubler 14
