(* Programming Langauges: Section 3 - OPTIONAL Closure Idioms Without Closures *)

(* re-implemention of the List library with map, filter, legth *)

datatype 'a mylist = Cons of 'a * ('a mylist) | Empty

fun map f xs = 
    case xs of
        Empty => Empty
        | Cons(x, xs) => Cons (f x, map f xs)
    
fun filter f xs = 
    case xs of
        Empty => Empty
        | Cons(x, xs) => if f x then Cons(x, filter f xs) else filter f xs

fun length xs = 
    case xs of 
        Empty => 0
        | Cons(_, xs) => 1 + length xs

(* One of the way to double all numbers in a list *)
val doubleAll = map (fn x => x * 2)

(* One way to count Ns in a list *)
fun countNs (xs, n : int) = length (filter (fn x => x = n) xs)