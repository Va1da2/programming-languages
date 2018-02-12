(* Programming Languages: Section 3 - Anonymous Functions *)

fun n_times (f, n, x) =
    if n = 0
    then x
    else f (n_times (f, n-1, x));

fun triple x = 3 * x;

fun triple_n_times (n, x) = n_times (triple, n, x);

(* second version of triple_n_times that is better stile *)
fun triple_n_times2 (n, x) =
    let
	fun triple x = 3*x
    in
	n_times(triple, n, x)
    end;

(* third version of triple_n_times NOT GOOD STYLE *)
fun triple_n_times3 (n, x) =
    n_times(let fun triple x = 3*x in triplle end, n, x);

(* fourht version with anonymous function *)
fun triple_n_times4 (n, x) =
    n_times((fn x => 3*x), n, x)
