(* ex12-3.ml *)
(* 目的：eki_t型のリストと起点（漢字の文字列）を受け取ったら、起点のみ以下のようなeki_t型のリストを返す *)
(* saitan_kyori = 0 *)
(* temae_list は始点の駅名のみ *)
(* shokika : eki_t list -> eki_t list *)
  
  #use "metro.ml"  (* type ekimei_t, type ekikan_t, リストglobal_ekimei_list, リストglobal_ekikan_list *)
  #use "ex12-1.ml"  (* type eki_t *)
  #use "ex12-2.ml"  (* 関数make_eki_list *)

let test_ekimei_list = [ 
{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}]
  
let rec shokika lst = match lst with
    [] -> []
  | {namae = n; saitan_kyori = km; temae_list = lst2 } :: rest ->
     {namae = n; saitan_kyori = 0.; temae_list = [n]} :: shokika rest

                                                              (* テスト *)
let test1 = shokika test_ekimei_list =
              [{namae = "代々木上原"; saitan_kyori = 0.; temae_list = ["代々木上原"]};
              {namae = "代々木公園"; saitan_kyori = 0.; temae_list = ["代々木公園"]};
              {namae = "明治神宮前"; saitan_kyori = 0.; temae_list = ["明治神宮前"]};]
              
            
