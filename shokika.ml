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

let tmp_eki_list6 = [
  {namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
  {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
  {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
  {namae = "表参道"; saitan_kyori = infinity; temae_list = []};
  {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
  {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
  {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
  {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
  {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
  {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
  {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []};
  {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
  {namae = "日比谷"; saitan_kyori = infinity; temae_list = []};
  {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
  {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
  {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
]
                             
let rec shokika tmp_eki_list6 kiten = match tmp_eki_list6 with
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
    
let test4 = shokika tmp_eki_list6 "表参道" = [
    {namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
    {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]};
    {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
    {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
    {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
    {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
    {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
    {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
    {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
    {namae = "日比谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
  ]
                                      
let tmp_eki_list11 = [
    {namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂見附"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤羽岩淵"; saitan_kyori = infinity; temae_list = []};
    {namae = "秋葉原"; saitan_kyori = infinity; temae_list = []};
    {namae = "浅草"; saitan_kyori = infinity; temae_list = []};
    {namae = "麻布十番"; saitan_kyori = infinity; temae_list = []};
    {namae = "綾瀬"; saitan_kyori = infinity; temae_list = []};
    {namae = "淡路町"; saitan_kyori = infinity; temae_list = []};
    {namae = "飯田橋"; saitan_kyori = infinity; temae_list = []};
    {namae = "池袋"; saitan_kyori = infinity; temae_list = []};
    {namae = "市ヶ谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "稲荷町"; saitan_kyori = infinity; temae_list = []};
    {namae = "入谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "上野"; saitan_kyori = infinity; temae_list = []};
    {namae = "上野広小路"; saitan_kyori = infinity; temae_list = []};
    {namae = "浦安"; saitan_kyori = infinity; temae_list = []};
    {namae = "営団赤塚"; saitan_kyori = infinity; temae_list = []};
    {namae = "営団成増"; saitan_kyori = infinity; temae_list = []};
    {namae = "江戸川橋"; saitan_kyori = infinity; temae_list = []};
    {namae = "恵比寿"; saitan_kyori = infinity; temae_list = []};
    {namae = "王子"; saitan_kyori = infinity; temae_list = []};
    {namae = "王子神谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
    {namae = "荻窪"; saitan_kyori = infinity; temae_list = []};
    {namae = "押上"; saitan_kyori = infinity; temae_list = []};
    {namae = "落合"; saitan_kyori = infinity; temae_list = []};
    {namae = "御茶ノ水"; saitan_kyori = infinity; temae_list = []};
    {namae = "表参道"; saitan_kyori = infinity; temae_list = []};
    {namae = "神楽坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "葛西"; saitan_kyori = infinity; temae_list = []};
    {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
    {namae = "要町"; saitan_kyori = infinity; temae_list = []};
    {namae = "神谷町"; saitan_kyori = infinity; temae_list = []};
    {namae = "茅場町"; saitan_kyori = infinity; temae_list = []};
    {namae = "神田"; saitan_kyori = infinity; temae_list = []};
    {namae = "外苑前"; saitan_kyori = infinity; temae_list = []};
    {namae = "北綾瀬"; saitan_kyori = infinity; temae_list = []};
    {namae = "北千住"; saitan_kyori = infinity; temae_list = []};
    {namae = "木場"; saitan_kyori = infinity; temae_list = []};
    {namae = "京橋"; saitan_kyori = infinity; temae_list = []};
    {namae = "清澄白河"; saitan_kyori = infinity; temae_list = []};
    {namae = "錦糸町"; saitan_kyori = infinity; temae_list = []};
    {namae = "行徳"; saitan_kyori = infinity; temae_list = []};
    {namae = "銀座"; saitan_kyori = infinity; temae_list = []};
    {namae = "銀座一丁目"; saitan_kyori = infinity; temae_list = []};
    {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
    {namae = "麹町"; saitan_kyori = infinity; temae_list = []};
    {namae = "後楽園"; saitan_kyori = infinity; temae_list = []};
    {namae = "小竹向原"; saitan_kyori = infinity; temae_list = []};
    {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
    {namae = "小伝馬町"; saitan_kyori = infinity; temae_list = []};
    {namae = "駒込"; saitan_kyori = infinity; temae_list = []};
    {namae = "護国寺"; saitan_kyori = infinity; temae_list = []};
    {namae = "桜田門"; saitan_kyori = infinity; temae_list = []};
    {namae = "渋谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "志茂"; saitan_kyori = infinity; temae_list = []};
    {namae = "白金高輪"; saitan_kyori = infinity; temae_list = []};
    {namae = "白金台"; saitan_kyori = infinity; temae_list = []};
    {namae = "新大塚"; saitan_kyori = infinity; temae_list = []};
  ]

let test5 = shokika tmp_eki_list11 "銀座" = [
    {namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂見附"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤羽岩淵"; saitan_kyori = infinity; temae_list = []};
    {namae = "秋葉原"; saitan_kyori = infinity; temae_list = []};
    {namae = "浅草"; saitan_kyori = infinity; temae_list = []};
    {namae = "麻布十番"; saitan_kyori = infinity; temae_list = []};
    {namae = "綾瀬"; saitan_kyori = infinity; temae_list = []};
    {namae = "淡路町"; saitan_kyori = infinity; temae_list = []};
    {namae = "飯田橋"; saitan_kyori = infinity; temae_list = []};
    {namae = "池袋"; saitan_kyori = infinity; temae_list = []};
    {namae = "市ヶ谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "稲荷町"; saitan_kyori = infinity; temae_list = []};
    {namae = "入谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "上野"; saitan_kyori = infinity; temae_list = []};
    {namae = "上野広小路"; saitan_kyori = infinity; temae_list = []};
    {namae = "浦安"; saitan_kyori = infinity; temae_list = []};
    {namae = "営団赤塚"; saitan_kyori = infinity; temae_list = []};
    {namae = "営団成増"; saitan_kyori = infinity; temae_list = []};
    {namae = "江戸川橋"; saitan_kyori = infinity; temae_list = []};
    {namae = "恵比寿"; saitan_kyori = infinity; temae_list = []};
    {namae = "王子"; saitan_kyori = infinity; temae_list = []};
    {namae = "王子神谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
    {namae = "荻窪"; saitan_kyori = infinity; temae_list = []};
    {namae = "押上"; saitan_kyori = infinity; temae_list = []};
    {namae = "落合"; saitan_kyori = infinity; temae_list = []};
    {namae = "御茶ノ水"; saitan_kyori = infinity; temae_list = []};
    {namae = "表参道"; saitan_kyori = infinity; temae_list = []};
    {namae = "神楽坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "葛西"; saitan_kyori = infinity; temae_list = []};
    {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
    {namae = "要町"; saitan_kyori = infinity; temae_list = []};
    {namae = "神谷町"; saitan_kyori = infinity; temae_list = []};
    {namae = "茅場町"; saitan_kyori = infinity; temae_list = []};
    {namae = "神田"; saitan_kyori = infinity; temae_list = []};
    {namae = "外苑前"; saitan_kyori = infinity; temae_list = []};
    {namae = "北綾瀬"; saitan_kyori = infinity; temae_list = []};
    {namae = "北千住"; saitan_kyori = infinity; temae_list = []};
    {namae = "木場"; saitan_kyori = infinity; temae_list = []};
    {namae = "京橋"; saitan_kyori = infinity; temae_list = []};
    {namae = "清澄白河"; saitan_kyori = infinity; temae_list = []};
    {namae = "錦糸町"; saitan_kyori = infinity; temae_list = []};
    {namae = "行徳"; saitan_kyori = infinity; temae_list = []};
    {namae = "銀座"; saitan_kyori = 0.; temae_list = ["銀座"]};
    {namae = "銀座一丁目"; saitan_kyori = infinity; temae_list = []};
    {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
    {namae = "麹町"; saitan_kyori = infinity; temae_list = []};
    {namae = "後楽園"; saitan_kyori = infinity; temae_list = []};
    {namae = "小竹向原"; saitan_kyori = infinity; temae_list = []};
    {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
    {namae = "小伝馬町"; saitan_kyori = infinity; temae_list = []};
    {namae = "駒込"; saitan_kyori = infinity; temae_list = []};
    {namae = "護国寺"; saitan_kyori = infinity; temae_list = []};
    {namae = "桜田門"; saitan_kyori = infinity; temae_list = []};
    {namae = "渋谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "志茂"; saitan_kyori = infinity; temae_list = []};
    {namae = "白金高輪"; saitan_kyori = infinity; temae_list = []};
    {namae = "白金台"; saitan_kyori = infinity; temae_list = []};
    {namae = "新大塚"; saitan_kyori = infinity; temae_list = []};
  ]
                                       
