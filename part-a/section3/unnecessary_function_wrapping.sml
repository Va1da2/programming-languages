(* Programming Languages: Section 3 - Unnecessary Function Wrapping *)

fun n_times (f, n, x) =
    if n = 0
    then x
    else f (n_times(f, n-1, x));

(* Poor style to write *)
fun nth_tail1(n,xs) = n_times((fn y => tl y), n, xs);

(* Good style *)
fun nth_tail2(n, nx) = n_times(tl, n, xs);

(* If you want to have a shorter name for a function: *)
val rev = List.rev;

(* instead of *)
fun rev xs = List.rev xs;
