(* Programming Languages: Section 2 - More Nested Patterns *)

fun nondecreasing xs = (* int list -> bool *)
    case xs of
	[] => true
      | x::[] => true
      | x::y::tl => x <= y andalso nondecreasing (y::tl);

datatype sgn = P | N | Z

fun mutsign (x1, x2) = (* int*int -> sgn *)
    let fun sign x = if x=0 then Z else if x > 0 then P else N
    in
	case (sign x1, sign x2) of
	    (_, Z) => Z
	  | (Z,_) => Z
	  | (P,N) => N
	  | (N,P) => N
	  | (N,N) => P
	  | (P,P) => P
    end

fun len xs =
    case xs of
	[] => 0
     | _::xs' => 1 + len xs'
