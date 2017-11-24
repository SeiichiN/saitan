(* es17-14.ml *)

#use "ex17-13.ml"

let ekikan_tree = inserts_ekikan Empty global_ekikan_list

let tmplist = [("上野", 1.2); ("三ノ輪", 1.2)]
                                 
let rec search shuteneki ekilist = match ekilist with
    [] -> infinity
  | (ekimei, kyori)::rest ->
     if ekimei = shuteneki then kyori
     else search shuteneki rest

(* テスト *)
let test11 = search "上野" tmplist = 1.2
let test12 = search "御徒町" tmplist = infinity
                 
(* 目的：漢字の駅名ふたつと ekikan_tree_t型の木を受け取ったら、
２駅間の距離を返す *)
(* get_ekikan_kyori: string -> string -> ekikan_tree_t tree -> float *)
let rec get_ekikan_kyori eki1 eki2 tree = match tree with
    Empty -> infinity
  | Node (left, eki, lst, right) ->
     if eki = eki1 then search eki2 lst
     else if eki > eki1 then get_ekikan_kyori eki1 eki2 left
     else get_ekikan_kyori eki1 eki2 right



                                        (* テスト *)
let test1 = get_ekikan_kyori "池袋" "新大塚" ekikan_tree = 1.8
