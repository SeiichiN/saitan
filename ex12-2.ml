(* wex12-2.ml *)
(* 目的：ekimei_t型のリストを受け取ったら、その駅名を使ってeki_t型の
リストをつくる *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list lst = match lst with
    [] -> []
  | {kanji = kj; kana = ka; romaji = ro; shozoku = sho } :: rest ->
     let eki_list = [{namae = kj; saitan_kyori = infinity; temae_list = []}]
                    :: make_eki_list rest

                                     (* テスト *)
let test1 = make_eki_list global_ekimei_list =
              [{"代々木上原", infinity, []}]
                
