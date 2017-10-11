(* ex10-12.ml *)

(* 駅・線路情報を読み込む *)
#use "metro.ml"

(* ローマ字の駅名を漢字に変える *)
(* Usage : romaji_to_kanji "myogadani" global_ekimei_list *)
#use "romaji2kanji.ml"

(* ふたつの駅の距離を返す *)
(* Usage : get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list *)
#use "getEkikanKyori.ml"
     

(* 目的：ローマ字の駅名2つを受け取ったら、その間の距離を調べ、
直接つながっている場合は「A駅からB駅まではXkmです。」という文字列を返し、
つながっていない場合は「A駅とB駅はつながっていません。」という文字列を返す。
A駅・B駅は漢字。また、駅が存在しなかった場合は、「XXXXという駅は存在しません。」
という文字列を返す。実数を文字列に変換する関数 string_of_float を使ってよい。 *)
(* kyori_wo_hyoji : eki1 -> eki2 -> string *)
let kyori_wo_hyoji eki1 eki2 =
  let ekiA = romaji_to_kanji eki1 global_ekimei_list in
  if ekiA = "" then eki1 ^ "という駅は存在しません。"
  else let ekiB = romaji_to_kanji eki2 global_ekimei_list in
       if ekiB = "" then eki2 ^ "という駅は存在しません。"
       else let  distance = get_ekikan_kyori ekiA ekiB global_ekikan_list in
            if distance = infinity then
              ekiA ^ "と" ^ ekiB ^ "はつながっていません。"
            else                
              ekiA ^ "駅から" ^ ekiB ^ "駅までは" ^ string_of_float(distance) ^ "kmです。"

                           
(* テスト *)
let test1 = kyori_wo_hyoji "jinbocho" "otemachi" = "神保町駅から大手町駅までは1.7kmです。"
let test2 = kyori_wo_hyoji "osaka" "otemachi" = "osakaという駅は存在しません。"
                                                  
    
                                         
