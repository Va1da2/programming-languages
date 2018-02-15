(* Programming Languages: Section 3 - Another Closure Idiom - Currying *)

(* old way to get the effect of multiple arguments *)
fun sorted3_tuple (x,y,z) = z >= y andalso y >= x;

val t1 = sorted3_tuple (7, 9, 11);

(* new way: currying *)
val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x;
(* the same as fun sorted3 x = fn y => fn z => ...*)

val t2 = ((sorted3 7) 9) 11;
(* syntactic sugar *)
val t3 = sorted3 7 9 11;

(* better syntactic sugar - writing fun *)
fun sorted3_nicer x y z = z >= y andalso y >= x;

val t4 = sorted3_nicer 7 9 11;

(* a more useful example *)
fun fold f acc xs = (* means fun fold f = fn acc => f xs => ... *)
		case xs of
		    [] => acc
		  | x::xs' => fold f (f(acc, x)) xs';

(* a call to curried fold *)
fun sum xs = fold (fn (x,y) => x + y) 0 xs
