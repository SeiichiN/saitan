(* ex16-3.ml *)

(* ex14-13でつくったkoushinの引数を一つ増やし、駅間のリスト
（ekikan_t list型）を受けとるようにせよ。さらに koushin の中で
get_ekikan_kyori を使うときには、このリストを使うようにせよ。 *)
  
(* タイプekimei_t, タイプekikan_t, 
リストglobal_ekimei_list, リストglobal_ekikan_list *)
#use "metro.ml"

(* ふたつの駅の距離を返す *)
(* Usage : get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list *)
#use "getEkikanKyori.ml"



(* #use "typeEki_t.ml" *)
(* レコード型 eki_t *)
type eki_t = {
  namae : string;  (* 駅名・漢字 *)
  saitan_kyori : float;  (* 最短距離 *)
  temae_list : string list;  (* 駅名（漢字）のリスト *)
}

(* リストの作り方 *)
(* 重複を削除して整列 seiretsu : ekimei_t list -> ekimei_t list *)
(* eki_t型のリストにする make_eki_list : ekimei_t list -> eki_t list *)
(* 初期化する shokika : eki_t list -> string -> eki_t list *)

let tmp_eki_list7 = [
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

(* 確定した駅 *)
let p = {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]}
let s = {namae = "銀座"; saitan_kyori = 0.; temae_list = ["銀座"]}


(* 未確定の駅（追加する駅） *)
let q = {namae = "大手町"; saitan_kyori = infinity; temae_list = []}
let r = {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}
let t = {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []}
let u = {namae = "日比谷"; saitan_kyori = infinity; temae_list = []}


(* 目的：直前に確定した駅ｐ(eki_t型)と、未確定の駅のリストｖ(eki_t list型)
を受け取ったら、必要な更新処理をおこなった後の未確定の駅のリストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v lst =
  (* 直前に確定した駅ｐ(eki_t型)と未確定の駅ｑ(eki_t型)を受け取ったら、
ｐとｑが直接つながっているかどうかを調べ、つながっていたらｑの最短距離と
手前リストを必要に応じて更新したもの、つながっていなかったらもとのｑを
そのまま返す *)
  (* fun : eki_t -> eki_t -> ekikan_t list -> eki_t *)
  List.map (fun q -> 
    match (p, q) with
      ({namae = pn; saitan_kyori = ps; temae_list = pt},
       {namae = qn; saitan_kyori = qs; temae_list = qt }) ->
      let distance = get_ekikan_kyori pn qn lst in
      if distance = infinity then q
      else if distance +. ps < qs then
        {namae = qn; saitan_kyori = distance +. ps ; temae_list = qn :: pt}
      else q
    ) v 
     
(* テスト *)
let test1 = koushin  s  tmp_eki_list7 global_ekikan_list =
  [{namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
   {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
   {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
   {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]};
   {namae = "霞ヶ関"; saitan_kyori = 1.; temae_list = ["霞ヶ関";  "銀座"]};
   {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
   {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
   {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
   {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
   {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
   {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []};
   {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
   {namae = "日比谷"; saitan_kyori = 0.4; temae_list = ["日比谷"; "銀座"]};
   {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
   {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
   {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}]


let test2 = koushin  p  tmp_eki_list7 global_ekikan_list =
[{namae = "青山一丁目"; saitan_kyori = 1.4; temae_list = ["青山一丁目"; "表参道"]};
 {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
 {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
 {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]};
 {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
 {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
 {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
 {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
 {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
 {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
 {namae = "乃木坂"; saitan_kyori = 1.4; temae_list = ["乃木坂"; "表参道"]};
 {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
 {namae = "日比谷"; saitan_kyori = infinity; temae_list = []};
 {namae = "明治神宮前"; saitan_kyori = 0.9; temae_list = ["明治神宮前"; "表参道"]};
 {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
 {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}]

               
                
