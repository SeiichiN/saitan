(* ex14-15 *)

(* enumerate : int -> int list *)
let rec enumerate x  =
  if x = 0 then [] else x :: enumerate (x-1)
                                        
(* one_to_n : int -> int *)
let one_to_n n =
  List.fold_right (+) (enumerate n) 0
    
                  (* テスト *)
let test1 = one_to_n 0 = 0
let test2 = one_to_n 1 = 1
let test3 = one_to_n 5 = 15
let test4 = one_to_n 10 = 55
                           
