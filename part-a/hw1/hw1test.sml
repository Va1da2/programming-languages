(* Homework1 Simple Suite *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw1solution.sml";

val is_older_test1 = is_older ((1,2,3),(2,3,4)) = true
val is_older_test2 = is_older ((1,1,1),(1,1,1)) = false
val is_older_test3 = is_older ((1,1,1),(1,1,2)) = true
val is_older_test4 = is_older ((1,2,1),(1,1,1)) = false
val is_older_test5 = is_older ((2,1,1),(1,1,1)) = false
val is_older_test6 = is_older ((2,1,1),(1,12,31)) = false

val number_in_month_test1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val number_in_month_test2 = number_in_month ([(2012,2,28),(2013,12,1)],1) = 0
val number_in_month_test3 = number_in_month ([(2012,2,28),(2013,12,1)],12) = 1
val number_in_month_test4 = number_in_month ([(2012,3,28),(2013,3,1)],3) = 2

val number_in_months_test1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val number_in_months_test2 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val number_in_months_test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6,7]) = 0
val number_in_months_test4 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12]) = 1

val dates_in_month_test1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val dates_in_month_test2 = dates_in_month ([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)]
val dates_in_month_test3 = dates_in_month ([(2012,2,28),(2013,2,1)],2) = [(2012,2,28),(2013,2,1)]
val dates_in_month_test4 = dates_in_month ([(2012,12,28),(2013,12,1)],2) = []

val dates_in_months_test1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val dates_in_months_test2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4]) = [(2011,3,31),(2011,4,28)]
val dates_in_months_test3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12]) = [(2013,12,1)]
val dates_in_months_test4 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6]) = []

val get_nth_test1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val get_nth_test2 = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"
val get_nth_test3 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"

val date_to_string_test1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val date_to_string_test2 = date_to_string (2013, 1, 1) = "January 1, 2013"
val date_to_string_test3 = date_to_string (2013, 12, 31) = "December 1, 2013"

val number_before_reaching_sum_test1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val number_before_reaching_sum_test2 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val number_before_reaching_sum_test3 = number_before_reaching_sum (15, [1,2,3,4,5]) = 4

val what_month_test1 = what_month 70 = 3
val what_month_test2 = what_month 31 = 1
val what_month_test3 = what_month 364 = 12
val what_month_test4 = what_month 180 = 6

val month_range_test1 = month_range (31, 34) = [1,2,2,2]
val month_range_test2 = month_range (1, 3) = [1,1,1]
val month_range_test3 = month_range (58, 60) = [2, 2, 3]

val oldest_test1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val oldest_test2 = oldest([(2011,4,28),(2011,3,31),(2012,2,28)]) = SOME (2011,3,31)
val oldest_test3 = oldest([(2012,2,28),(2011,4,28),(2011,3,31)]) = SOME (2011,3,31)
val oldest_test4 = oldest([(2011,3,31),(2011,4,28),(2012,2,28)]) = SOME (2011,3,31)
val oldest_test5 = oldest([]) = NONE;
