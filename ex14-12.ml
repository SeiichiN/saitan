(* ex14-11-2.ml *)

(* 目的：eki_t型のリストと起点（漢字の文字列）を受け取ったら、起点のみ以下のようなeki_t型のリストを返す *)
(* saitan_kyori = 0 *)
(* temae_list は始点の駅名のみ *)
(* shokika : eki_t list -> string -> eki_t list *)
  
  #use "metro.ml"  (* type ekimei_t, type ekikan_t, リストglobal_ekimei_list, リストglobal_ekikan_list *)
  #use "ex12-1.ml"  (* type eki_t *)


       

let test_ekimei_list = [ 
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"};
  ]


(* 目的：ekimei_t型のリストを受け取ったら、その駅名を使ってeki_t型の
リストをつくる *)
(* make_initial_eki_list : ekimei_t list -> eki_t list *)
let make_initial_eki_list lst kiten=
  List.map (fun {kanji = kj; kana = ka; romaji = ro; shozoku = sho } ->
            if kj = kiten
            then {namae = kj; saitan_kyori = 0.; temae_list = [kj]}
            else {namae = kj; saitan_kyori = infinity; temae_list = []})
           lst


(* テスト *)
let test1 = make_initial_eki_list test_ekimei_list "表参道" = [
    {namae="代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae="代々木公園";  saitan_kyori = infinity; temae_list = []};
    {namae="明治神宮前";  saitan_kyori = infinity; temae_list = []};
    {namae="表参道";  saitan_kyori = 0.; temae_list = ["表参道"]};
    {namae="乃木坂"; saitan_kyori = infinity; temae_list = []};
    {namae="赤坂";  saitan_kyori = infinity; temae_list = []};
    {namae="国会議事堂前";  saitan_kyori = infinity; temae_list = []};
    {namae="霞ヶ関";  saitan_kyori = infinity; temae_list = []};

  ]
                                                                

