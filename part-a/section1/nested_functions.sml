(* The old way of defining everything in global scope *)
fun count(from: int, to: int) =
    if from=to
    then to :: []
    else from :: count(from+1, to);

fun countup_from1(x: int) =
    count(1, x);

(* Define helper function in other functions scope only *)
fun countup_from1D(x: int) =
    let
	fun count(from: int, to: int) =
	    if from=to
	    then to :: []
	    else from :: count(from+1, to)
    in
	count(1, x)
    end;

(* This is improved version where we acknowledge that we already have 'to' 
argument in scope (as 'x') and therefore can use it from the start.*)
fun countup_from1DD(x: int) =
    let
	fun count(from: int) =
	    if from = x
	    then x :: []
	    else from :: count(from+1)
    in
	count(1)
    end;



