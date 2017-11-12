(* あらかじめ ex10_11.ml, ex15_5.ml を読み込んでおく必要あり *) 
(* #use "ex10_11.ml" *) (* get_ekikan_kyori の定義 *) 
#use "getEkikanKyori.ml" (* get_ekikan_kyori の定義 *)
     
(* #use "ex15_5.ml"  *) (* saitan_wo_bunri の定義 *) 
#use "saitanWoBunri.ml"  (* saitan_wo_bunri の定義 *)
     
(* ex16_3.ml を読み込むと eki_t 型の定義が２度、読み込まれてしまうので 
   koushin の定義を以下に直接、展開 *) 
 
(* ==================== これは模範解答オリジナル ==================== *)
(* 目的：未確定の駅のリスト v を必要に応じて更新したリストを返す *) 
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *) 
(*
let koushin p v ekikan_list = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
    List.map (fun q -> match q with 
	       {namae = qn; saitan_kyori = qs; temae_list = qt} -> 
		 let kyori = get_ekikan_kyori pn qn ekikan_list in 
		 if kyori = infinity 
		 then q 
		 else if ps +. kyori < qs 
		 then {namae = qn; saitan_kyori = ps +. kyori; 
				   temae_list = qn :: pt} 
		 else q) 
	     v 
*)

(* ==================== これは僕が作った関数 ==================== *)
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
     


         
(* 目的：未確定駅のリストと駅間リストから、各駅への最短路を求める *) 
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *) 
let rec dijkstra_main eki_list ekikan_list = match eki_list with 
    [] -> [] 
  | first :: rest -> 
      let (saitan, nokori) = saitan_wo_bunri (first :: rest) in 
      let eki_list2 = koushin saitan nokori ekikan_list in 
      saitan :: dijkstra_main eki_list2 ekikan_list 
 
(* eki_list2 は eki_list より長さが必ずひとつ短いので、停止する *) 
 
(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4] 

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

            
(* テスト *) 
let test1 = dijkstra_main [] global_ekikan_list = [] 
let test2 = dijkstra_main lst global_ekikan_list = 
  [{namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
   {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}; 
   {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}; 
   {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}] 
