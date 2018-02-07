(* Programming Languages: Section 2 - A Little Type Inference *)

fun sum_triple1 (x, y, z) =
    x + y + z;

fun full_name1 {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z;

(* these versions will not type-check without type annotations because the
 type-checker cannot figure out if there migh be another field *)

fun sum_triple2 (triple: int*int*int) =
    #1 triple + #2 triple + #3 triple;

fun full_name2 (r: {first: string, middle: string, last: string}) =
    #first r ^ " " ^ #middle r ^ " " ^ #last r;

(* these functions are polymorohic: type of y can be anything *)
(* int*'a*int -> int *)
fun sum_partial (x, y, z) =
    x + z;

fun partial_name {first=x, middle=y, last=z} =
    x ^ " " ^ z;

