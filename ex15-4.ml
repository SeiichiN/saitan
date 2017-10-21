(* ex15-4.ml *)

#use "ex13-7.ml"

(* ex13-7.mlのテスト結果の表のコピー *)
let tmp_eki_list8 = 
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

(*  eki_t型の駅のサンプル*)
let tmp_eki1 =
  {namae = "大手町"; saitan_kyori = infinity; temae_list = []}
let tmp_eki2 =
  {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}
let tmp_eki3 = 
  {namae = "霞ヶ関"; saitan_kyori = 1.; temae_list = ["霞ヶ関";  "銀座"]}
let tmp_eki4 =
  {namae = "日比谷"; saitan_kyori = 0.4; temae_list = ["日比谷"; "銀座"]}
let tmp_eki0 =
  {namae = ""; saitan_kyori = infinity; temae_list = []}
                
let tmp_eki_list9 = [tmp_eki1; tmp_eki2; tmp_eki3; tmp_eki4]      
                
(* 目的：eki_t型の駅ふたつを受け取ったら、最短距離の小さい方を返す。
ただし、最短距離0の駅は選ばないものとする。 *)
(* chiisai = eki_t -> eki_t -> string *)
let chiisai p (q, v_list) = match (p, q) with
    ({namae = pn; saitan_kyori = ps; temae_list = pt},
     {namae = qn; saitan_kyori = qs; temae_list = qt}) ->
    if ps = infinity && qs = infinity then (p, q :: v_list)
    else if ps <> 0. && qs <> 0. then
      if ps -. qs < 0. then (p, q :: v_list)
      else (q, p :: v_list)
    else if ps = 0. && qs <> 0. then (q, p :: v_list)
    else if ps <> 0. && qs = 0. then (p, q :: v_list)
    else (p, q :: v_list)       (* 両方共0ならば、pとしておく *)
            
(* テスト *)
let test1 = chiisai tmp_eki1 (tmp_eki2, [])  = (tmp_eki1, [tmp_eki2])
let test2 = chiisai tmp_eki2 (tmp_eki3, [])  = (tmp_eki3, [tmp_eki2])
let test3 = chiisai tmp_eki3 (tmp_eki4, [])  = (tmp_eki4, [tmp_eki3])

(* 目的：eki_t list型のリストを受け取ったら、最短距離最小の駅を返す *)
(* saisho : eki_t list -> eki_t *)
let saisho lst = List.fold_right chiisai lst
                                 ({namae = ""; saitan_kyori = infinity; temae_list = []}, [])
                                 (* テスト *)

let test10 = saisho tmp_eki_list9 =
          (tmp_eki4,[tmp_eki1; tmp_eki2; tmp_eki3; tmp_eki0])
let test11 = saisho tmp_eki_list9 =
          (tmp_eki4,[tmp_eki3; tmp_eki2; tmp_eki1; tmp_eki0])
let test12 = saisho tmp_eki_list9 =
          (tmp_eki4,[tmp_eki1; tmp_eki3; tmp_eki2; tmp_eki0])
let test13 = saisho tmp_eki_list9 =
          (tmp_eki4,[tmp_eki3; tmp_eki1; tmp_eki2; tmp_eki0])

(* ****************************************************


            (* 目的：eki_t型の駅の駅名を返す *)
(* saisho_ekimei -> eki_t -> string *)
let ekimei eki = match eki with
    {namae = n; saitan_kyori = s; temae_list = t} ->
    n

let tett20 = ekimei tmp_eki4 = "日比谷"

      
(* 目的：eki_t型をうけとって、駅名のリストをつくる *)
(* mk_eki_list : eki_t -> list *)
let mk_eki_list eki = match eki with
    {namae = n; saitan_kyori = s; temae_list = t} ->
    [n]

let test21 = mk_eki_list tmp_eki3 = ["霞ヶ関"]


******************************************************** *)
