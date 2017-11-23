(* ex17-11.ml *)

let eki_kyori_list = [("新大塚", 1.2); ("後楽園", 1.8); ("池袋", 3.0); ("本郷三丁目", 2.6)]

(* 目的：「駅名」と「駅名と距離の組のリスト」を受け取ったら、その駅までの距離を返す *)
(* assoc : string -> ( string * float ) list -> float *)
let rec assoc ekimei lst = match lst with
    [] -> infinity
  | (n, km) :: rest ->
     if n = ekimei then km
     else assoc ekimei rest
                

                         (* テスト *)
let test1 = assoc "後楽園" eki_kyori_list = 1.8
let test2 = assoc "新大塚" eki_kyori_list = 1.2
let test3 = assoc "池袋" eki_kyori_list = 3.0
let test4 = assoc "東京" eki_kyori_list = infinity


                         
