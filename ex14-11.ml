(* ex14-11.ml *)

 #use "metro.ml"

 #use "typeEki_t.ml" 

let test_ekimei_list = [ 
{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}]

let tmp_ekimei_list5 = [
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


                         

(* 目的：ekimei_t型のリストを受け取ったら、その駅名を使ってeki_t型の
リストをつくる *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let make_eki_list lst = List.map (fun 
    {kanji = kj; kana = ka; romaji = ro; shozoku = sho } ->
     {namae = kj; saitan_kyori = infinity; temae_list = []}) lst


                                     
                                     (* テスト *)
let test1 = make_eki_list test_ekimei_list =
              [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
               {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
               {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}]
                                                                             
let test2 = make_eki_list tmp_ekimei_list5 = [
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
                                               
let tmp_ekimei_list11 = [
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

(* test *)
let test3 = make_eki_list tmp_ekimei_list11 = [
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
                                                
