(* ex10-10.ml *)

#use "metro.ml"
     
(* 目的：ローマ字の駅名（文字列）と駅名リスト（ekimei_t list型）を受け取ったら、
園駅の漢字表記を文字列で返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji word lst = match lst with
    [] -> ""
  | {kanji = kj; kana = ka; romaji = ro; shozoku = sh} :: rest ->
     if word = ro then kj
     else romaji_to_kanji word rest
                         
(* テスト *)
let test1 = romaji_to_kanji "akasaka" global_ekimei_list = "赤坂"
let test2 = romaji_to_kanji "osaka" global_ekimei_list = ""

                                      
