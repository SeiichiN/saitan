(* ex13-6.ml *)


(* タイプekimei_t, タイプekikan_t, 
リストglobal_ekimei_list, リストglobal_ekikan_list *)
#use "metro.ml"

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

               
let p = {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]}
let q = {namae = "大手町"; saitan_kyori = infinity; temae_list = []}
let r = {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}
let s = {namae = "銀座"; saitan_kyori = 0.; temae_list = ["銀座"]}
let t = {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []}
let u = {namae = "日比谷"; saitan_kyori = infinity; temae_list = []}

          
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

type vvv = {
  va : int;
}


(* ふたつの駅の距離を返す *)
(* Usage : get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list *)
#use "getEkikanKyori.ml"

           
(* 直前に確定した駅ｐ(eki_t型)と未確定の駅ｑ(eki_t型)を受け取ったら、
ｐとｑが直接つながっているかどうかを調べ、つながっていたらｑの最短距離と
手前リストを必要に応じて更新したもの、つながっていなかったらもとのｑを
そのまま返す *)
(* koushin1 : eki_t -> eki_t -> eki_t *)
let koushin1 p q = match (p, q) with
    ({namae = pn; saitan_kyori = ps; temae_list = pt},
      {namae = qn; saitan_kyori = qs; temae_list = qt }) ->
      let distance = get_ekikan_kyori pn qn global_ekikan_list in
      if distance = infinity then q
      else if distance +.ps < qs then
        {namae = qn; saitan_kyori = distance +. ps ; temae_list = qn :: pt}
      else q
             
(* テスト *)
let test1 = koushin1 p q =
              {namae = "大手町"; saitan_kyori = infinity; temae_list = []}
let test2 = koushin1 p r =
              {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}
let test3 = koushin1 s t =
              {namae = "霞ヶ関"; saitan_kyori = 1.; temae_list = ["霞ヶ関";  "銀座"]}
let test3 = koushin1 s u =
              {namae = "日比谷"; saitan_kyori = 0.4; temae_list = ["日比谷"; "銀座"]}
                
                
                              


