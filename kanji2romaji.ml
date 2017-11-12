(* kanji2romaji.ml *)

#use "metro.ml"
     
(* 目的：漢字の駅名（文字列）と駅名リスト（ekimei_t list型）を受け取ったら、その駅のローマ表記を文字列で返す *)
(* kanji_to_romaji : string -> ekimei_t list -> string *)
let rec kanji_to_romaji word lst = match lst with
    [] -> ""
  | {kanji = kj; kana = ka; romaji = ro; shozoku = sh} :: rest ->
     if word = kj then ro
     else kanji_to_romaji word rest
                         
(* テスト *)
let test1 = kanji_to_romaji "赤坂" global_ekimei_list = "akasaka"


                                      
