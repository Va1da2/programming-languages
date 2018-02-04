(* Programming languages: Section 2 - Useful Datatypes *)

(* Datatypes can be used as enums *)
datatype suit = Club | Diamond | Heart | Spade;
datatype rank = Jack | Queen | King | Ace | Num of int;

(* We can use them to represent real-world things / people *)
(* Students that will identified by their student id OR by name *)
datatype id = StudentNum of int
	    | Name of string * (string option) * string;

(* Expression Trees *)
datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp;

(* Function over recursive datatypes are usually recursive *)
fun eval e =
    case e of
       Constant i => i
     | Negate e2 => ~ (eval e2)
     | Add (e1, e2) => (eval e1) + (eval e2)
     | Multiply (e1, e2) => (eval e1) + (eval e2);

fun number_of_adds e =
    case e of
	Constant i => 0
      | Negate e2 => number_of_adds e2
      | Add (e1, e2) => 1 + number_of_adds e1 + number_of_adds e2
      | Multiply (e1, e2) => number_of_adds e1 + number_of_adds e2;

val example_exp : exp = Add (Constant 19, Negate (Constant 4));

val example_ans : int = eval example_exp;

val example_add_count = number_of_adds (Multiply(example_exp, example_exp));

