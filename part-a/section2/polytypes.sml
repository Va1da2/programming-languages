(* Programming Languages: Section 2 - Plymorphic Types and Equality Types *)

fun append (xs, ys) =
    case xs of
	[] => ys
      | x::xs' => x :: append(xs', ys);

val ok1 = append(["hi", "bye"], ["programming", "languages"]);
val ok2 = append([1, 2], [4, 5]);

(*
val not_ok = append([1, 2], ["programming", "langauges"])
*)

(* polyEqual function *)
fun same_thing (a, b) =
    if a = b then "yes" else "no";

(* not polyEqual *)
fun is_three x =
    if x = 3 then "yes" else "no";
