(*Assignment 1*)

(* date,date -> bool *)
(* return true if first date is older than second*)
fun is_older(d1 : int*int*int, d2 : int*int*int) =
    #1 d1 < #1 d2 orelse
    #1 d1 = #1 d2 andalso #2 d1 < #2 d2 orelse
    #1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3 d1 < #3 d2
    
    
(* date list, int -> int*)
(* return number of dates which have same month as input month*)
fun number_in_month(lod : (int*int*int) list, m : int) = 
    if null lod
    then 0 
    else if #2 (hd lod) = m  then 1 +  number_in_month((tl lod), m)
    else number_in_month((tl lod), m)

(*date list, int list -> int*)
(* return number of dates which have same month as input months*)
fun number_in_months(lod : (int*int*int) list, ms : int list) = 
    if null ms
    then 0
    else number_in_month(lod, (hd ms)) + number_in_months(lod, (tl ms))

(*date list, int -> date list*)
(* return list of dates which have same month as input month*)
fun dates_in_month(lod : (int*int*int) list, m : int) = 
    if null lod
    then []
    else if #2 (hd lod) = m then (hd lod) :: dates_in_month((tl lod),m)
    else dates_in_month((tl lod),m)

(*date list, int list -> date list*)
(* return list of dates which have same month as input month*)
fun dates_in_months(lod : (int*int*int) list, ms : int list) = 
    if null ms 
    then []
    else dates_in_month(lod, hd ms) @ dates_in_months(lod, tl ms)

(*string list, int -> string*)
(*returns nth string from list*)
fun get_nth(los : string list, n : int) =
    if null los
    then " "
    else if n = 1 then hd los
    else get_nth((tl los) , n - 1)

(* date -> string*)
(* return date formated as string*)
fun date_to_string(d : int*int*int) = 
    let
      val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
     get_nth(months,#2 d) ^ " " ^ Int.toString(#3 d) ^ ", " ^ Int.toString(#1 d)
    end

(* int, int list -> int*)
(* return max n that can be added before sum n >= int*) 
(*(10, [1,2,3,4,5]) = 3*)
fun number_before_reaching_sum(sum : int, allNum : int list) =
    if hd allNum >= sum 
    then 0
    else 1 + number_before_reaching_sum(sum - (hd allNum), (tl allNum))

(*int -> int*)
(* returns num value of month that day of year is in*)
fun what_month(d : int) = 
    let
      val days = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
      number_before_reaching_sum(d,days) + 1
    end

(*int, int -> int list*)
(*return a list of months that every day between two days belongs to*)
fun month_range(d1 : int, d2 : int) = 
    if d1 > d2
    then []
    else what_month(d1) :: month_range(d1 + 1, d2) 
    

(*date list -> date option*)
(*returns SOME oldest date in list else NONE*)
fun oldest(lod : (int*int*int) list) = 
    if null lod
    then NONE
    else
        let 
            val tl_ans = oldest(tl lod)
        in 
            if isSome(tl_ans) andalso is_older(valOf tl_ans, hd lod)
            then tl_ans
            else 
                SOME (hd lod)
        end
        
(*date -> bool*)
(*return true if date is reasonable*)
fun reasonable_date(d : int*int*int) = 
    let
      val days = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        (#1 d) > 0 andalso 
        (#2 d) <= 12 andalso (#2 d) >= 1 andalso
        if (#1 d mod 4 = 0 andalso #1 d mod 100 <> 0) orelse (#1 d mod 400 = 0) andalso #2 d = 2
        then (#3 d) <= 29 andalso (#3 d) >= 1 
        else (#3 d) <= List.nth(days,#2 d - 1) andalso (#3 d) >= 1 
    end
    