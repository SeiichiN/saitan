(* ex10-11.ml *)

(* #use "metro.ml" *)
     
(* 目的：漢字の駅名2つ（文字列）と駅間リスト(ekitan_t list型)を受け取ったら、
駅間リストの中からその2駅間の距離を返す *)
(* これは、2つの駅がひとつのレコードにkitenとshutenとして記入されている場合である。 *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori eki1 eki2 lst = match lst with
    [] -> infinity
  | {kiten = ki; shuten = shu; keiyu = kei; kyori = kyo; jikan = ji} :: rest ->
     if (eki1 = ki && eki2 = shu) || (eki1 = shu && eki2 = ki) then kyo
     else get_ekikan_kyori eki1 eki2 rest
                         
       (* テスト *)
let test1 = get_ekikan_kyori "" "" global_ekikan_list = infinity
let test2 = get_ekikan_kyori "表参道" "乃木坂" global_ekikan_list = 1.4
let test3 = get_ekikan_kyori "表参道" "赤坂" global_ekikan_list = infinity
let test4 = get_ekikan_kyori "九段下" "大手町" global_ekikan_list = infinity
let test5 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let test6 = get_ekikan_kyori "茗荷谷" "池袋" global_ekikan_list = infinity
let test7 = get_ekikan_kyori "東京" "大手町" global_ekikan_list = 0.6

