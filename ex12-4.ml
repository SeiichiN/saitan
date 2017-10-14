(* ex12-4.ml *)

#use "metro.ml"

let tmp_ekimei_list = [
  {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
  {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
  {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
  {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
  {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
  {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
  {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
  {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
]

let tmp_eki1 =
   {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"}

let tmp_ekimei_list2 = [
  {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
  {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"};
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
  {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
  {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
  {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
  {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
  {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
  {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
  {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
  {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="半蔵門線"}; 
]

let tmp_ekimei_list3 = [
  {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
  {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"};
  {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="半蔵門線"}; 
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
  {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
  {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
  {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
  {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
  {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
  {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
  {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
]
                         

(* 目的：あらかじめひらがな順に並んでいるリストとひらがなをうけとったら、
リストを前から見ていき、昇順となる位置にひらがなを挿入したリストを返す *)
(* ekimei_insert : ekimei_t record -> ekimei_t list -> ekimei_t list *)
let rec ekimei_insert eki0 lst = match lst with
    [] -> eki0 :: []
  | ({kanji = kj; kana = ka; romaji = ro; shozoku = sho} as first) :: rest ->
     match eki0 with {kanji = kj0; kana = ka0; romaji = ro0; shozoku = sho0} ->
     if (ka0 > ka) then first :: ekimei_insert eki0 rest
     else eki0 :: first :: rest

(* テスト *)
let test1 = ekimei_insert tmp_eki1 tmp_ekimei_list = [
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
  ]

                             
(* 目的：ひらがなのリストを受け取ったら、それを昇順に整列したリストを返す *)
(* ekimei_sort : ekimei_t list -> ekimei_t liset *)
let rec ekimei_sort lst = match lst with
    [] -> []
  | first :: rest -> ekimei_insert first (ekimei_sort rest)
                             
(* テスト *)
let test2 = ekimei_sort tmp_ekimei_list = [
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
  ]

let test3 = ekimei_sort tmp_ekimei_list2 = [
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"};
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="半蔵門線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
  ]
                                             
let rec ekimei_insert2 eki0 lst = match lst with
    [] -> eki0 :: []
  | ({kanji = kj; kana = ka; romaji = ro; shozoku = sho} as first) :: rest ->
     match eki0 with {kanji = kj0; kana = ka0; romaji = ro0; shozoku = sho0} ->
       if (ka0 > ka) then first :: ekimei_insert2 eki0 rest
       else if (ka0 = ka) then ekimei_insert2 eki0 rest
       else eki0 :: lst

                                             
(* 目的：ekimei_t型のリストを受け取ったら、それをひらがな順に整列し、
さらに駅の重複を取り除いたekimei_t型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t *)
let rec seiretsu lst = match lst with
    [] -> []
  | first :: rest -> ekimei_insert2 first (seiretsu rest)
                                    

let test4 = seiretsu tmp_ekimei_list2 = [
  {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
  {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"};
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
  {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
  {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
  {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
  {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
  {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
  {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
  {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
]
