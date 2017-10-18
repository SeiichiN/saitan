(* ex14-16 *)

(* x までの連続した自然数のリストをつくる *)
(* enumerate : int -> int list *)
let rec enumerate x  =
  if x = 0 then [] else x :: enumerate (x-1)

(* テスト *)
let test10 = enumerate 0 = []
let test11 = enumerate 1 = [1]
let test12 = enumerate 2 = [2; 1]
let test13 = enumerate 5 = [5; 4; 3; 2; 1]
                             
                             
(* 目的：n までの階乗を求める *)
(* fac : int -> int *)
let fac n =
  List.fold_right ( * ) (enumerate n) 1 
    
                  (* テスト *)
let test1 = one_to_n 0 = 0
let test2 = one_to_n 1 = 1
let test3 = one_to_n 2 = 2
let test4 = one_to_n 3 = 6
let test5 = one_to_n 4 = 24
let test6 = one_to_n 5 = 120
                           
