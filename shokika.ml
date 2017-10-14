(* ex12-3.ml *)
(* 目的：eki_t型のリストと起点（漢字の文字列）を受け取ったら、起点のみ以下のようなeki_t型のリストを返す *)
(* saitan_kyori = 0 *)
(* temae_list は始点の駅名のみ *)
(* shokika : eki_t list -> string -> eki_t list *)
  
  #use "metro.ml"  (* type ekimei_t, type ekikan_t, リストglobal_ekimei_list, リストglobal_ekikan_list *)
  #use "ex12-1.ml"  (* type eki_t *)
  #use "ex12-2.ml"  (* 関数make_eki_list *)

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

let eki_list = make_eki_list test_ekimei_list                         
  
let rec shokika eki_list kiten = match eki_list with
    [] -> []
  | ({namae = n; saitan_kyori = km; temae_list = lst2 } as first) :: rest ->
     if n = kiten then
       {namae = n; saitan_kyori = 0.; temae_list = [n]} :: shokika rest kiten
     else first :: shokika rest kiten
                           

(* テスト *)
let test1 = shokika [] "表参道" = []
let test2 = shokika eki_list "表参道" = [
    {namae = "代々木上原";   saitan_kyori = infinity;   temae_list = []};
    {namae = "代々木公園";   saitan_kyori = infinity;   temae_list = []};
    {namae = "明治神宮前";   saitan_kyori = infinity;   temae_list = []};
    {namae = "表参道";       saitan_kyori = 0.;   temae_list = ["表参道"]};
    {namae = "乃木坂";       saitan_kyori = infinity;   temae_list = []};
    {namae = "赤坂";         saitan_kyori = infinity;   temae_list = []};
    {namae = "国会議事堂前"; saitan_kyori = infinity;   temae_list = []};
    {namae = "霞ヶ関";       saitan_kyori = infinity;   temae_list = []};
  ]
let test3 = shokika eki_list "代々木上原" = [
    {namae = "代々木上原";   saitan_kyori = 0.;   temae_list = ["代々木上原"]};
    {namae = "代々木公園";   saitan_kyori = infinity;   temae_list = []};
    {namae = "明治神宮前";   saitan_kyori = infinity;   temae_list = []};
    {namae = "表参道";       saitan_kyori = infinity;   temae_list = []};
    {namae = "乃木坂";       saitan_kyori = infinity;   temae_list = []};
    {namae = "赤坂";         saitan_kyori = infinity;   temae_list = []};
    {namae = "国会議事堂前"; saitan_kyori = infinity;   temae_list = []};
    {namae = "霞ヶ関";       saitan_kyori = infinity;   temae_list = []};
  ]
              
            
