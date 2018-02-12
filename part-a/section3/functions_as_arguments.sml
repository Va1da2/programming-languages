(* Programming Languages: Section 3 - Functions As Arguments *)

(* it should *pain* us to write the next three functions separately
   but we do not have to *)
fun increment_n_times_lame (n, x) = (* silly: this computes (n+x) *)
    if n = 0
    then x
    else increment_n_times_lame (n-1, x+1);

fun double_n_times_lame (n, x) =
    if n = 0
    then x
    else double_n_times_lame (n-1, x*2);

fun nth_tail_lame (n, xs) =
    if n = 0
    then xs
    else nth_tail_lame (n-1, tl (xs));

(* defining higher order function to take care of common bits *)
fun n_times (f, n, x) =
    if n = 0
    then x
    else f (n_times (f, n-1, x));

(* helper functions *)
fun increment x = x + 1;
fun double x = x + x;

val x1 = n_times(double, 4, 7);
val x2 = n_times(increment, 4, 7);
val x3 = n_times(tl, 2, [4,8,12,16]);

fun addition (n, x) = n_times (increment, n, x);
fun double_n_times (n, x) = n_times (double, n, x);
fun nth_tail (n, x) = n_times (tl, n, x);
