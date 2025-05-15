(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val is_older1 = is_older ((1,2,3),(2,3,4)) = true
val is_older2 = is_older ((1,2,3),(1,2,3)) = false
val is_older3 = is_older ((2,3,4),(1,2,3)) = false

val is_older4 = is_older ((2,2,2),(2,2,3)) = true (* d < *)
val is_older5 = is_older ((1,2,2),(2,2,2)) = true (* y < *)
val is_older6 = is_older ((1,2,2),(1,3,2)) = true (* m <  *)


val number_in_month1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val number_in_month2 = number_in_month ([(2012,2,28),(2013,12,1)],1) = 0


val number_in_months1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3


val dates_in_month1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val dates_in_month2 = dates_in_month ([(2012,2,28),(2013,12,1)],3) = []

val dates_in_months1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]


val get_nth1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val get_nth2 = get_nth (["hi", "there", "how", "are", "you"], 6) = " "


val date_to_string1 = date_to_string (2013, 6, 1) = "June 1, 2013"


val num_before1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val num_before2 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0


val what_month1 = what_month 70 = 3
val what_month2 = what_month 1 = 1
val what_month3 = what_month 365 = 12


val month_range1  = month_range (31, 34) = [1,2,2,2]
val month_range2  = month_range (34, 31) = []
val month_range3  = month_range (30, 31) = [1,1]
val month_range4  = month_range (30, 30) = [1]

val oldest = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val oldest2 = oldest([(2011,4,28),(2011,4,28)]) = NONE

val reasonable1 = reasonable_date(0, 12, 31) = false
val reasonable2 = reasonable_date(2012, 13, 31) = false
val reasonable3 = reasonable_date(2012, 12, 32) = false
val reasonable4 = reasonable_date(2025, 5, 3) = true
val reasonable5 = reasonable_date(2024, 2, 29) = true
val reasonable6 = reasonable_date(2025, 2, 29) = false
val reasonable7 = reasonable_date(1900, 2, 29) = false
