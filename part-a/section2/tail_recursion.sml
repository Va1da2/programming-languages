(* Programming Languages: Section 2 - Tail Recursion *)

(*simple factorial function *)
fun fact n =
    if n = 0
    then 1
    else n * fact (n-1);

(* tail recursive factorial function *)
fun fact_tail n =
    let fun aux (n, acc) =
	    if n = 0
	    then acc
	    else aux (n-1, acc*n)
    in
	aux(n,1)
    end;

(* Summing elements of the list - simple *)
fun sum xs =
    case xs of
	[] => 0
      | x::xs' => x + sum xs'

(* summing elements of the list - tail recursive *)
fun sum_tail xs =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
	      | x::xs' => aux(xs', acc+x)
    in
	aux(xs, 0)
    end;

(* Reverse elements of list - normal *)
fun rev xs =
    case xs of
	[] => []
      | x::xs' => (rev xs') @ [x]

(* Reverse elements of the list - tail recursive *)
fun rev_tail xs =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
	      | x::xs' => aux(xs', x::acc)
    in
	aux(xs, [])
    end;


				  
