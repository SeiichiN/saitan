(* ex16-5.ml *)

#use "seiretsu.ml"
     
#use "romaji2kanji.ml"

#use "ex14-12.ml"          (* make_initial_eki_list *)
#use "ex16-4.ml"           (* dijkstra_main *)


(* 始点の駅名（ローマ字）と終点の駅名（ローマ字）を受け取ったら、
seiretsu を使って global_ekimei_list の重複を取り除き、
romaji_to_kanji を使って始点と終点の駅の漢字表記（文字列）を求め、
make_initial_eki_list を使って駅のリスト（eki_t list型）を作り、
dijkstra_main を使って各駅までの最短路を確定し、
その中から終点の駅のレコード（eki_t型）を返す
ような関数 dijkstra を作れ。
 *)

(* 目的：引数の文字列と等しい要素をリストの中から求め、そのレコードを返す *)
(* onaji: string -> eki_t list -> eki_t *)
let rec onaji eki lst = match lst with
    [] -> {namae = ""; saitan_kyori = 0.; temae_list = []}
  | ({namae = n; saitan_kyori = km; temae_list = lst2} as first)::rest ->
     if n = eki then first
     else onaji eki rest
     

(* dijkstra: string -> string -> eki_t *)
let dijkstra shiten syuten =
  let ekimei_list = seiretsu global_ekimei_list in
  let shiten_kanji = romaji_to_kanji shiten ekimei_list in
  let syuten_kanji = romaji_to_kanji syuten ekimei_list in
  let init_eki_list = make_initial_eki_list ekimei_list shiten_kanji in
  let keiro_list = dijkstra_main init_eki_list global_ekikan_list in
  onaji syuten_kanji keiro_list


               (* テスト *)
let test1 = dijkstra "omotesandou" "akasaka" =
              {namae = "赤坂"; saitan_kyori = 2.5; temae_list = ["赤坂"; "乃木坂"; "表参道"]};

                               
                               
