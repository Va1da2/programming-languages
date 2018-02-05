(* Programming Languages: Section 2 - Another Expression Example *)

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp;

(* Note: example assumes there is not library function for mac of two ints.
There is: Int.max *)
fun max_constant e =
    let
	fun max_of_two (e1, e2) =
	    let
		val m1 = max_constant e1
		val m2 = max_constant e2
	    in if m1 > m2 then m1 else m2 end
    in
	case e of
	    Constant i => i
	  | Negate e2 => max_constant e2
	  | Add (e1, e2) => max_of_two (e1, e2)
	  | Multiply (e1, e2) => max_of_two (e1, e2)
    end

val test_exp = Add (Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp;

(* Final solution from video *)
fun max_constant_f e =
    case e of
       Constant i => i
     | Negate e2 => max_constant_f e2
     | Add (e1, e2) => Int.max (max_constant e1, max_constant e2)
     | Multiply (e1, e2) => Int.max (max_constant e1, max_constant e2);

val nineteen_f = max_constant_f test_exp;

