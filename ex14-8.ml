(* ex14-8.ml *)
(* 整数を受け取ってきたら、その2乗から1を引いた数を返す名前のない関数をつくれ *)
(* function : int -> int *)
let func = fun n -> n * n - 1

                   (* テスト *)
let test1 = func 0 = 0
let test2 = func 1 = 0
let test3 = func 2 = 3
let test4 = func 3 = 8
let test5 = func 4 = 15

                           
