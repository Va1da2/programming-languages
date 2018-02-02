(* Prgramming languages: Section 2 - Tuples as Syntactic Sugar *)

(* Records are like tuples with user-defined field names. 
   However under the hood, tuples are records with names 1, 2, 3, ...
   This record will be kept sorted according these integer names
   and therefore we can access them by position, but it is name also *)

val a_pair = (3+1, 4+2)
val a_record = {second = 4 + 2, first = 3 + 1}

val another_pair = {2 = 5, 1 = 6}
val sum = #1 a_pair + #2 another_pair

val x = {3 = "hi", 1 = true}
val y = {3 = "hi", 2 = 3+2, 1 = true}
