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

let tmp_ekimei_list4 = [
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
  {kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyama-itchome"; shozoku="半蔵門線"}; 
  {kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; shozoku="半蔵門線"}; 
  {kanji="半蔵門"; kana="はんぞうもん"; romaji="hanzomon"; shozoku="半蔵門線"}; 
  {kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="半蔵門線"}; 
  {kanji="神保町"; kana="じんぼうちょう"; romaji="jinbocho"; shozoku="半蔵門線"}; 
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
                                             
let rec ekimei_insert2 eki0 tmp_ekimei_list4 = match tmp_ekimei_list4 with
    [] -> eki0 :: []
  | ({kanji = kj; kana = ka; romaji = ro; shozoku = sho} as first) :: rest ->
     match eki0 with {kanji = kj0; kana = ka0; romaji = ro0; shozoku = sho0} ->
       if (ka0 > ka) then first :: ekimei_insert2 eki0 rest
       else if (ka0 = ka) then ekimei_insert2 eki0 rest
       else eki0 :: tmp_ekimei_list4

                                             
(* 目的：ekimei_t型のリストを受け取ったら、それをひらがな順に整列し、
さらに駅の重複を取り除いたekimei_t型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t *)
let rec seiretsu tmp_ekimei_list4 = match tmp_ekimei_list4 with
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

let test5 = seiretsu tmp_ekimei_list4 = [
    {kanji = "青山一丁目"; kana = "あおやまいっちょうめ";
     romaji = "aoyama-itchome"; shozoku = "半蔵門線"};
    {kanji = "赤坂"; kana = "あかさか"; romaji = "akasaka";
     shozoku = "千代田線"};
    {kanji = "大手町"; kana = "おおてまち"; romaji = "otemachi";
     shozoku = "千代田線"};
    {kanji = "表参道"; kana = "おもてさんどう";
     romaji = "omotesandou"; shozoku = "千代田線"};
    {kanji = "霞ヶ関"; kana = "かすみがせき"; romaji = "kasumigaseki";
     shozoku = "千代田線"};
    {kanji = "九段下"; kana = "くだんした"; romaji = "kudanshita";
     shozoku = "半蔵門線"};
    {kanji = "国会議事堂前"; kana = "こっかいぎじどうまえ";
     romaji = "kokkaigijidoumae"; shozoku = "千代田線"};
    {kanji = "神保町"; kana = "じんぼうちょう"; romaji = "jinbocho";
     shozoku = "半蔵門線"};
    {kanji = "永田町"; kana = "ながたちょう"; romaji = "nagatacho";
     shozoku = "半蔵門線"};
    {kanji = "二重橋前"; kana = "にじゅうばしまえ";
     romaji = "nijuubasimae"; shozoku = "千代田線"};
    {kanji = "乃木坂"; kana = "のぎざか"; romaji = "nogizaka";
     shozoku = "千代田線"};
    {kanji = "半蔵門"; kana = "はんぞうもん"; romaji = "hanzomon";
     shozoku = "半蔵門線"};
    {kanji = "日比谷"; kana = "ひびや"; romaji = "hibiya";
     shozoku = "千代田線"};
    {kanji = "明治神宮前"; kana = "めいじじんぐうまえ";
     romaji = "meijijinguumae"; shozoku = "千代田線"};
    {kanji = "代々木上原"; kana = "よよぎうえはら";
     romaji = "yoyogiuehara"; shozoku = "千代田線"};
    {kanji = "代々木公園"; kana = "よよぎこうえん";
     romaji = "yoyogikouen"; shozoku = "千代田線"};
  ]
                                          
let test6 = seiretsu global_ekimei_list = [
    {kanji = "青山一丁目"; kana = "あおやまいっちょうめ";
     romaji = "aoyamaicchome"; shozoku = "銀座線"};
    {kanji = "赤坂"; kana = "あかさか"; romaji = "akasaka";
     shozoku = "千代田線"};
    {kanji = "赤坂見附"; kana = "あかさかみつけ";
     romaji = "akasakamitsuke"; shozoku = "銀座線"};
    {kanji = "赤羽岩淵"; kana = "あかばねいわぶち";
     romaji = "akabaneiwabuchi"; shozoku = "南北線"};
    {kanji = "秋葉原"; kana = "あきはばら"; romaji = "akihabara";
     shozoku = "日比谷線"};
    {kanji = "浅草"; kana = "あさくさ"; romaji = "asakusa";
     shozoku = "銀座線"};
    {kanji = "麻布十番"; kana = "あざぶじゅうばん";
     romaji = "azabujuban"; shozoku = "南北線"};
    {kanji = "綾瀬"; kana = "あやせ"; romaji = "ayase";
     shozoku = "千代田線"};
    {kanji = "淡路町"; kana = "あわじちょう"; romaji = "awajicho";
     shozoku = "丸ノ内線"};
    {kanji = "飯田橋"; kana = "いいだばし"; romaji = "idabashi";
     shozoku = "南北線"};
    {kanji = "池袋"; kana = "いけぶくろ"; romaji = "ikebukuro";
     shozoku = "丸ノ内線"};
    {kanji = "市ヶ谷"; kana = "いちがや"; romaji = "ichigaya";
     shozoku = "南北線"};
    {kanji = "稲荷町"; kana = "いなりちょう"; romaji = "inaricho";
     shozoku = "銀座線"};
    {kanji = "入谷"; kana = "いりや"; romaji = "iriya";
     shozoku = "日比谷線"};
    {kanji = "上野"; kana = "うえの"; romaji = "ueno";
     shozoku = "銀座線"};
    {kanji = "上野広小路"; kana = "うえのひろこうじ";
     romaji = "uenohirokoji"; shozoku = "銀座線"};
    {kanji = "浦安"; kana = "うらやす"; romaji = "urayasu";
     shozoku = "東西線"};
    {kanji = "営団赤塚"; kana = "えいだんあかつか";
     romaji = "eidanakakuka"; shozoku = "有楽町線"};
    {kanji = "営団成増"; kana = "えいだんなります";
     romaji = "eidannarimasu"; shozoku = "有楽町線"};
    {kanji = "江戸川橋"; kana = "えどがわばし";
     romaji = "edogawabasi"; shozoku = "有楽町線"};
    {kanji = "恵比寿"; kana = "えびす"; romaji = "ebisu";
     shozoku = "日比谷線"};
    {kanji = "王子"; kana = "おうじ"; romaji = "oji";
     shozoku = "南北線"};
    {kanji = "王子神谷"; kana = "おうじかみや"; romaji = "ojikamiya";
     shozoku = "南北線"};
    {kanji = "大手町"; kana = "おおてまち"; romaji = "otemachi";
     shozoku = "千代田線"};
    {kanji = "荻窪"; kana = "おぎくぼ"; romaji = "ogikubo";
     shozoku = "丸ノ内線"};
    {kanji = "押上"; kana = "おしあげ"; romaji = "oshiage";
     shozoku = "半蔵門線"};
    {kanji = "落合"; kana = "おちあい"; romaji = "ochiai";
     shozoku = "東西線"};
    {kanji = "御茶ノ水"; kana = "おちゃのみず"; romaji = "ochanomizu";
     shozoku = "丸ノ内線"};
    {kanji = "表参道"; kana = "おもてさんどう";
     romaji = "omotesandou"; shozoku = "千代田線"};
    {kanji = "神楽坂"; kana = "かぐらざか"; romaji = "kagurazaka";
     shozoku = "東西線"};
    {kanji = "葛西"; kana = "かさい"; romaji = "kasai";
     shozoku = "東西線"};
    {kanji = "霞ヶ関"; kana = "かすみがせき"; romaji = "kasumigaseki";
     shozoku = "千代田線"};
    {kanji = "要町"; kana = "かなめちょう"; romaji = "kanametyou";
     shozoku = "有楽町線"};
    {kanji = "神谷町"; kana = "かみやちょう"; romaji = "kamiyacho";
     shozoku = "日比谷線"};
    {kanji = "茅場町"; kana = "かやばちょう"; romaji = "kayabacho";
     shozoku = "日比谷線"};
    {kanji = "神田"; kana = "かんだ"; romaji = "kanda";
     shozoku = "銀座線"};
    {kanji = "外苑前"; kana = "がいえんまえ"; romaji = "gaienmae";
     shozoku = "銀座線"};
    {kanji = "北綾瀬"; kana = "きたあやせ"; romaji = "kitaayase";
     shozoku = "千代田線"};
    {kanji = "北千住"; kana = "きたせんじゅ"; romaji = "kitasenjyu";
     shozoku = "千代田線"};
    {kanji = "木場"; kana = "きば"; romaji = "kiba"; shozoku = "東西線"};
    {kanji = "京橋"; kana = "きょうばし"; romaji = "kyobashi";
     shozoku = "銀座線"};
    {kanji = "清澄白河"; kana = "きよすみしらかわ";
     romaji = "kiyosumi-shirakawa"; shozoku = "半蔵門線"};
    {kanji = "錦糸町"; kana = "きんしちょう"; romaji = "kinshicho";
     shozoku = "半蔵門線"};
    {kanji = "行徳"; kana = "ぎょうとく"; romaji = "gyotoku";
     shozoku = "東西線"};
    {kanji = "銀座"; kana = "ぎんざ"; romaji = "ginza";
     shozoku = "銀座線"};
    {kanji = "銀座一丁目"; kana = "ぎんざいっちょうめ";
     romaji = "ginzaittyoume"; shozoku = "有楽町線"};
    {kanji = "九段下"; kana = "くだんした"; romaji = "kudanshita";
     shozoku = "半蔵門線"};
    {kanji = "麹町"; kana = "こうじまち"; romaji = "koujimachi";
     shozoku = "有楽町線"};
    {kanji = "後楽園"; kana = "こうらくえん"; romaji = "korakuen";
     shozoku = "丸ノ内線"};
    {kanji = "小竹向原"; kana = "こたけむかいはら";
     romaji = "kotakemukaihara"; shozoku = "有楽町線"};
    {kanji = "国会議事堂前"; kana = "こっかいぎじどうまえ";
     romaji = "kokkaigijidoumae"; shozoku = "千代田線"};
    {kanji = "小伝馬町"; kana = "こでんまちょう";
     romaji = "kodemmacho"; shozoku = "日比谷線"};
    {kanji = "駒込"; kana = "こまごめ"; romaji = "komagome";
     shozoku = "南北線"};
    {kanji = "護国寺"; kana = "ごこくじ"; romaji = "gokokuji";
     shozoku = "有楽町線"};
    {kanji = "桜田門"; kana = "さくらだもん"; romaji = "sakuradamon";
     shozoku = "有楽町線"};
    {kanji = "渋谷"; kana = "しぶや"; romaji = "shibuya";
     shozoku = "銀座線"};
    {kanji = "志茂"; kana = "しも"; romaji = "shimo"; shozoku = "南北線"};
    {kanji = "白金高輪"; kana = "しろかねたかなわ";
     romaji = "shirokanetakanawa"; shozoku = "南北線"};
    {kanji = "白金台"; kana = "しろかねだい"; romaji = "shirokanedai";
     shozoku = "南北線"};
    {kanji = "新大塚"; kana = "しんおおつか"; romaji = "shinotsuka";
     shozoku = "南北線"};
                                            
  ]
                                            
